/**********************************************************
*文件名:MS86F_PWM1_HALF.c
*功能:MS86Fxx02的PWM1半桥互补输出功能演示
*器件型号:MS86F1602
*振荡器:内部RC 16MHz 2T
*引脚定义:
*                 ----------------
*  VDD-----------|1(VDD)   (GND)16|------------GND
*  NC------------|2(RA7)   (PA0)15|-------------NC
*  NC------------|3(PA6)   (PA1)14|-------------NC
*  NC------------|4(PA5)   (PA2)13|-------------NC
*  NC------------|5(PA4)   (PA3)12|-------------NC
*  NC------------|6(PC5)   (PC0)11|----------P1A2N
*  NC------------|7(PC4)   (PC1)10|-----------P1A2
*  NC------------|8(PC3)   (PC2)09|-------------NC
*                 ----------------
*                 MS86F1602 SOP16
*说明:该例程是设置PWM1模块输出一个互补带死区,周期为10KHz,
*     占空比为75%PWM.
*注意:1.PWM1模块可以输出3路同周期,不同占空比的PWM,即P1A、P1B和P1C
*     2.这3路PWM可以有软件设置开启或者不开启.该例程没有开启P1B和
*       P1C,仅开启了P1A
*     3.每一路PWM都有映射到某几个引脚的功能,且可以由软件设置映射.
*       比如P1B可以映射到PA4脚或者PA5脚;又比如P1A可以映射到PC5、
*       PC3和PC1.
*     4.P1A是可以输出另一路与P1A互补的PWM,我们称之为:P1AN,体现在
*       引脚图上是:P1A0N、P1A1N和P1A2N.并且这个互补输出PWM也是跟
*       P1A一样具有映射到某几个管脚上(PC4、PC2和PC0)
*     5.P1A的各路波形逻辑如下:
*       a.P1A0=P1A1=P1A2,P1A0N=P1A2N=P1A2N
*       b.P1A0与P1A0N互补
**********************************************************/
#include "SYSCFG.h";
#include "MS86Fxx01.h";
////////////////////////////PIN//////////////////////////////////////////////
/*
	VDD				1					14	VSS
    PA7				2					13	PA0/ICSPCLK
    PA6				3					12	PA1/ICSPDAT
    [P1B]/PA5	4					11	PA2/[P1C]
    P1B/PA4		5					10	PA3/P1C
    P1A0/PC5		6					9		PC0/[P1A2N]
    P1A0N/PC4	7					8		PC1/[P1A2]				  
*/
/////////////////////////////////////////////////////////////////////
											//VCC
#define PIN_IO_DAT				RA7
#define PIN_IO_CLK				PA6
#define PIN_IO_BUSY				RA5//P1B
#define PIN_UV_LED				RA4//P1A0
#define PIN_UV_KEY 				PC5
#define PIN_O3_KEY				PC4//P1A2

#define PIN_O3_LED				PC1//[P1A2]
#define PIN_O3_EN					PC0//[P1A2N]
#define PIN_UV_EN					PA3//P1C
											//PA2//[P1C]
                                            //PA1/ICSPDAT
                                            //PA0/ICSPCLK
                                            //VSS
////////////////////////////PIN////////////////////////////////////

unsigned short O3_working_timer=0;
unsigned char O3_timeout=0;
unsigned short UV_working_timer=0;
unsigned char UV_timeout=0;
/*====================================================
*函数名:DEVICE_INIT
*功能:上电器件初始化
*输入参数:无
*返回参数:无
====================================================*/
void DEVICE_INIT(void)
{
	OSCCON = 0B01110001;	//Bit7,LFMOD=0,WDT振荡器频率=32KHz
							//Bit6:4,IRCF[2:0]=101,内部RC频率=4MHz
							//Bit0,SCS=1,系统时钟选择为内部振荡器
	INTCON = 0B00000000;	//暂禁止所有中断
	OPTION = 0B00001000;	//Bit4=1 WDT MODE,PS=000=1:1 WDT RATE
    
	PORTA = 0B11011000;
	TRISA  = 0B00100111;		//PORTA口RA7,RA6,RA4,RA3为出，其他PORTA口为输入
    WPUA  = 0B00100111;		//开启PORTA口内部上拉
 /*   
	PORTC 	= 0B00010000;
	TRISC 	= 0B11101110;		//RC0,RC4为输出,其他PORTC口为输入
	WPUC 	= 0B11101110;		//RC0,RC4不开启上拉,其他PORTC口开启上拉
 */ 
	PORTC 	= 0B00000010;
	TRISC 	= 0B11111100;		//RC0,RC1为输出,其他PORTC口为输入
	WPUC 	= 0B11111100;		//RC0,RC1不开启上拉,其他PORTC口开启上拉
    
    PSRCA  = 0B11111111;	//源电流设置最大
    PSRCC  = 0B11111111;
    PSINKA = 0B11111111;	//灌电流设置最大
    PSINKC = 0B11111111;
    MSCON  = 0B00110000;
        
    //BIT5:PSRCAH4和PSRCA[4]共同决定源电流.00:4mA; 11:33mA; 01、10:8mA
    //BIT4:PSRCAH3和PSRCA[3]共同决定源电流.00:4mA; 11:33mA; 01、10:8mA
    //BIT3:UCFG1<1:0>为01时此位有意义.0:禁止LVR; 1:打开LVR
    //BIT2:快时钟测量慢周期的平均模式.0:关闭平均模式; 1:打开平均模式
    //BIT1:0:关闭快时钟测量慢周期:1:打开快时钟测量慢周期
    //BIT0:0:睡眠时停止工作:1:睡眠时保持工作.当T2时钟不是选择指令时钟的时候
}
void DELAY_125US(void)
{
	unsigned char a;

	for(a=0;a<125;a++)
	{
		CLRWDT();
	}
}
void DELAY_MS(unsigned short Time)
{
	unsigned short a;
    
	Time<<=3;

	for(a=0;a<Time;a++)
	{
		DELAY_125US();
	}
}
volatile unsigned char T0_cnt=0;
void interrupt ISR(void)
{
	if(T0IE&&T0IF)
	{
		T0IF = 0;
		TMR0 = 6;
        T0_cnt++;
        if(T0_cnt>=125)
        {
            if(O3_working_timer)
            {
                O3_working_timer--;
                if(O3_working_timer==0)O3_timeout=1;
            }
             if(UV_working_timer)
            {
                UV_working_timer--;
                if(UV_working_timer==0)UV_timeout=1;
            }
            T0_cnt=0;
        }
    }
}

/*====================================================
*函数名:TIMER0_INIT
*功能:Timer0初始化
*输入参数:无
*返回参数:无
====================================================*/
void TIMER0_INIT(void)
{
	T0CON0 = 0B00000000;
	OPTION = 0B00000111;           //Bit4=0 TIMER0 MODE,PS=011=1:256 TIMER0 RATE												
}

/*====================================================
*函数名:ENABLE_INTERRUPT
*功能:开启所需中断
*输入参数:无
*返回参数:无
====================================================*/
void ENABLE_INTERRUPT(void)
{
	T0IF = 0;                       //清TIMER0中断标志位
	T0IE = 1;                       //使能TIMER0中断
	T0ON = 1;						//开启Timer0
    
	GIE = 1;                        //开启总中断
}
void DISABLE_INTERRUPT(void)
{  
	T0IF = 0;                       //清TIMER0中断标志位
	T0IE = 0;                       //使能TIMER0中断
	T0ON = 0;						//开启Timer0

	GIE = 0;                        //开启总中断
}
char GetO3KeyEvent(void)
{
	static unsigned char keytime=0;
    unsigned char key_event=0;
    if(PIN_O3_KEY==0)
    {
        if(keytime<200)
        {
			keytime++;
			if(keytime>=200)key_event = 2;
        }
    }
    else
    {
        if(keytime>10 && keytime<200)key_event=1;
        keytime=0;
    }
    return key_event;
}
char GetUvKeyEvent(void)
{
	static unsigned char keytime=0;
    unsigned char key_event=0;
    if(PIN_UV_KEY==0)
    {
        if(keytime<200)
        {
			keytime++;
			if(keytime>=200)key_event = 2;
        }
    }
    else
    {
        if(keytime>10 && keytime<200)key_event=1;
        keytime=0;
    }
    return key_event;
}
void PlaySound(char sn)
{
    char i;
    PIN_IO_CLK=1;
    PIN_IO_DAT=1;
    
	PIN_IO_CLK=0;
    DELAY_MS(5);
    
	for(i=0;i<8;i++)
    {
        PIN_IO_CLK=0;
        PIN_IO_DAT=(sn&1);
        DELAY_125US();
        DELAY_125US();
        DELAY_125US();
        DELAY_125US();
        PIN_IO_CLK=1;
        DELAY_125US();
        DELAY_125US();
        DELAY_125US();
        DELAY_125US();
        
		sn>>=1;
    }
	PIN_IO_CLK=1;
    PIN_IO_DAT=1;
}
void SetUV(char open)
{
	 if(open)
	{
		PIN_UV_LED=0;
		PIN_UV_EN=0;
		UV_working_timer=60*3;
		PlaySound(2);
	}
    else
    {
		PIN_UV_LED=1;
		PIN_UV_EN=1;
		UV_working_timer=0;
		PlaySound(3);
	}
}
void SetO3(char open)
{
	 if(open)
	{
		PIN_O3_LED=0;
		PIN_O3_EN=1;
		O3_working_timer=60*10;
		PlaySound(4);
	}
    else
    {
		PIN_O3_LED=1;
		PIN_O3_EN=0;
		O3_working_timer=0;
		PlaySound(5);
	}
}
/*====================================================
*函数名:main
*功能:主函数
*输入参数:无
*返回参数:无
====================================================*/
void main(void)
{
    unsigned char keycode=0; 
    O3_working_timer=0;
    UV_timeout=0;
    UV_working_timer=0;
    UV_timeout=0;
	DEVICE_INIT();	   //器件初始化
    TIMER0_INIT();
    ENABLE_INTERRUPT();
	PlaySound(0xef);//set to max volume
    PlaySound(1);//play welcome
	while(1)
    {
        keycode=GetUvKeyEvent();
        if(keycode>0 || UV_timeout)
        {
            if(UV_timeout || UV_working_timer)SetUV(0);
			else  SetUV(1);         
			UV_timeout=0;
        }
        keycode=GetO3KeyEvent();
        if(keycode>0 || O3_timeout)
        {
			if(O3_timeout || O3_working_timer)SetO3(0);
			else  SetO3(1);         
			O3_timeout=0;
        }
        
		DELAY_MS(10);
    }
}


