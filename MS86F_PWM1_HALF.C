/**********************************************************
*�ļ���:MS86F_PWM1_HALF.c
*����:MS86Fxx02��PWM1���Ż������������ʾ
*�����ͺ�:MS86F1602
*����:�ڲ�RC 16MHz 2T
*���Ŷ���:
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
*˵��:������������PWM1ģ�����һ������������,����Ϊ10KHz,
*     ռ�ձ�Ϊ75%PWM.
*ע��:1.PWM1ģ��������3·ͬ����,��ͬռ�ձȵ�PWM,��P1A��P1B��P1C
*     2.��3·PWM�������������ÿ������߲�����.������û�п���P1B��
*       P1C,��������P1A
*     3.ÿһ·PWM����ӳ�䵽ĳ�������ŵĹ���,�ҿ�������������ӳ��.
*       ����P1B����ӳ�䵽PA4�Ż���PA5��;�ֱ���P1A����ӳ�䵽PC5��
*       PC3��PC1.
*     4.P1A�ǿ��������һ·��P1A������PWM,���ǳ�֮Ϊ:P1AN,������
*       ����ͼ����:P1A0N��P1A1N��P1A2N.��������������PWMҲ�Ǹ�
*       P1Aһ������ӳ�䵽ĳ�����ܽ���(PC4��PC2��PC0)
*     5.P1A�ĸ�·�����߼�����:
*       a.P1A0=P1A1=P1A2,P1A0N=P1A2N=P1A2N
*       b.P1A0��P1A0N����
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
*������:DEVICE_INIT
*����:�ϵ�������ʼ��
*�������:��
*���ز���:��
====================================================*/
void DEVICE_INIT(void)
{
	OSCCON = 0B01110001;	//Bit7,LFMOD=0,WDT����Ƶ��=32KHz
							//Bit6:4,IRCF[2:0]=101,�ڲ�RCƵ��=4MHz
							//Bit0,SCS=1,ϵͳʱ��ѡ��Ϊ�ڲ�����
	INTCON = 0B00000000;	//�ݽ�ֹ�����ж�
	OPTION = 0B00001000;	//Bit4=1 WDT MODE,PS=000=1:1 WDT RATE
    
	PORTA = 0B11011000;
	TRISA  = 0B00100111;		//PORTA��RA7,RA6,RA4,RA3Ϊ��������PORTA��Ϊ����
    WPUA  = 0B00100111;		//����PORTA���ڲ�����
 /*   
	PORTC 	= 0B00010000;
	TRISC 	= 0B11101110;		//RC0,RC4Ϊ���,����PORTC��Ϊ����
	WPUC 	= 0B11101110;		//RC0,RC4����������,����PORTC�ڿ�������
 */ 
	PORTC 	= 0B00000010;
	TRISC 	= 0B11111100;		//RC0,RC1Ϊ���,����PORTC��Ϊ����
	WPUC 	= 0B11111100;		//RC0,RC1����������,����PORTC�ڿ�������
    
    PSRCA  = 0B11111111;	//Դ�����������
    PSRCC  = 0B11111111;
    PSINKA = 0B11111111;	//������������
    PSINKC = 0B11111111;
    MSCON  = 0B00110000;
        
    //BIT5:PSRCAH4��PSRCA[4]��ͬ����Դ����.00:4mA; 11:33mA; 01��10:8mA
    //BIT4:PSRCAH3��PSRCA[3]��ͬ����Դ����.00:4mA; 11:33mA; 01��10:8mA
    //BIT3:UCFG1<1:0>Ϊ01ʱ��λ������.0:��ֹLVR; 1:��LVR
    //BIT2:��ʱ�Ӳ��������ڵ�ƽ��ģʽ.0:�ر�ƽ��ģʽ; 1:��ƽ��ģʽ
    //BIT1:0:�رտ�ʱ�Ӳ���������:1:�򿪿�ʱ�Ӳ���������
    //BIT0:0:˯��ʱֹͣ����:1:˯��ʱ���ֹ���.��T2ʱ�Ӳ���ѡ��ָ��ʱ�ӵ�ʱ��
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
*������:TIMER0_INIT
*����:Timer0��ʼ��
*�������:��
*���ز���:��
====================================================*/
void TIMER0_INIT(void)
{
	T0CON0 = 0B00000000;
	OPTION = 0B00000111;           //Bit4=0 TIMER0 MODE,PS=011=1:256 TIMER0 RATE												
}

/*====================================================
*������:ENABLE_INTERRUPT
*����:���������ж�
*�������:��
*���ز���:��
====================================================*/
void ENABLE_INTERRUPT(void)
{
	T0IF = 0;                       //��TIMER0�жϱ�־λ
	T0IE = 1;                       //ʹ��TIMER0�ж�
	T0ON = 1;						//����Timer0
    
	GIE = 1;                        //�������ж�
}
void DISABLE_INTERRUPT(void)
{  
	T0IF = 0;                       //��TIMER0�жϱ�־λ
	T0IE = 0;                       //ʹ��TIMER0�ж�
	T0ON = 0;						//����Timer0

	GIE = 0;                        //�������ж�
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
*������:main
*����:������
*�������:��
*���ز���:��
====================================================*/
void main(void)
{
    unsigned char keycode=0; 
    O3_working_timer=0;
    UV_timeout=0;
    UV_working_timer=0;
    UV_timeout=0;
	DEVICE_INIT();	   //������ʼ��
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

