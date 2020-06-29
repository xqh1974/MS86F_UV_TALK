opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	16F685
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_DEVICE_INIT
	FNCALL	_main,_TIMER0_INIT
	FNCALL	_main,_ENABLE_INTERRUPT
	FNCALL	_main,_PlaySound
	FNCALL	_main,_GetUvKeyEvent
	FNCALL	_main,_SetUV
	FNCALL	_main,_GetO3KeyEvent
	FNCALL	_main,_SetO3
	FNCALL	_main,_DELAY_MS
	FNCALL	_SetO3,_PlaySound
	FNCALL	_SetUV,_PlaySound
	FNCALL	_PlaySound,_DELAY_MS
	FNCALL	_PlaySound,_DELAY_125US
	FNCALL	_DELAY_MS,_DELAY_125US
	FNROOT	_main
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_O3_working_timer
	global	_UV_working_timer
	global	_T0_cnt
	global	_UV_timeout
	global	GetO3KeyEvent@keytime
	global	GetUvKeyEvent@keytime
	global	_O3_timeout
	global	_ANSEL
psect	text361,local,class=CODE,delta=2
global __ptext361
__ptext361:
_ANSEL	set	286
	DABS	1,286,1	;_ANSEL

	global	_ANSELH
_ANSELH	set	287
	DABS	1,287,1	;_ANSELH

	global	_CM1CON0
_CM1CON0	set	281
	DABS	1,281,1	;_CM1CON0

	global	_CM2CON0
_CM2CON0	set	282
	DABS	1,282,1	;_CM2CON0

	global	_CM2CON1
_CM2CON1	set	283
	DABS	1,283,1	;_CM2CON1

	global	_EEADRH
_EEADRH	set	271
	DABS	1,271,1	;_EEADRH

	global	_EEDATH
_EEDATH	set	270
	DABS	1,270,1	;_EEDATH

	global	_IOCB
_IOCB	set	278
	DABS	1,278,1	;_IOCB

	global	_PSTRCON
_PSTRCON	set	413
	DABS	1,413,1	;_PSTRCON

	global	_SRCON
_SRCON	set	414
	DABS	1,414,1	;_SRCON

	global	_VRCON
_VRCON	set	280
	DABS	1,280,1	;_VRCON

	global	_WPUB
_WPUB	set	277
	DABS	1,277,1	;_WPUB

	global	_ANS0
_ANS0	set	2288
	DABS	1,286,1	;_ANS0

	global	_ANS1
_ANS1	set	2289
	DABS	1,286,1	;_ANS1

	global	_ANS10
_ANS10	set	2298
	DABS	1,287,1	;_ANS10

	global	_ANS11
_ANS11	set	2299
	DABS	1,287,1	;_ANS11

	global	_ANS2
_ANS2	set	2290
	DABS	1,286,1	;_ANS2

	global	_ANS3
_ANS3	set	2291
	DABS	1,286,1	;_ANS3

	global	_ANS4
_ANS4	set	2292
	DABS	1,286,1	;_ANS4

	global	_ANS5
_ANS5	set	2293
	DABS	1,286,1	;_ANS5

	global	_ANS6
_ANS6	set	2294
	DABS	1,286,1	;_ANS6

	global	_ANS7
_ANS7	set	2295
	DABS	1,286,1	;_ANS7

	global	_ANS8
_ANS8	set	2296
	DABS	1,287,1	;_ANS8

	global	_ANS9
_ANS9	set	2297
	DABS	1,287,1	;_ANS9

	global	_C1CH0
_C1CH0	set	2248
	DABS	1,281,1	;_C1CH0

	global	_C1CH1
_C1CH1	set	2249
	DABS	1,281,1	;_C1CH1

	global	_C1OE
_C1OE	set	2253
	DABS	1,281,1	;_C1OE

	global	_C1ON
_C1ON	set	2255
	DABS	1,281,1	;_C1ON

	global	_C1OUT
_C1OUT	set	2254
	DABS	1,281,1	;_C1OUT

	global	_C1POL
_C1POL	set	2252
	DABS	1,281,1	;_C1POL

	global	_C1R
_C1R	set	2250
	DABS	1,281,1	;_C1R

	global	_C1SEN
_C1SEN	set	3317
	DABS	1,414,1	;_C1SEN

	global	_C1VREN
_C1VREN	set	2247
	DABS	1,280,1	;_C1VREN

	global	_C2CH0
_C2CH0	set	2256
	DABS	1,282,1	;_C2CH0

	global	_C2CH1
_C2CH1	set	2257
	DABS	1,282,1	;_C2CH1

	global	_C2OE
_C2OE	set	2261
	DABS	1,282,1	;_C2OE

	global	_C2ON
_C2ON	set	2263
	DABS	1,282,1	;_C2ON

	global	_C2OUT
_C2OUT	set	2262
	DABS	1,282,1	;_C2OUT

	global	_C2POL
_C2POL	set	2260
	DABS	1,282,1	;_C2POL

	global	_C2R
_C2R	set	2258
	DABS	1,282,1	;_C2R

	global	_C2REN
_C2REN	set	3316
	DABS	1,414,1	;_C2REN

	global	_C2SYNC
_C2SYNC	set	2264
	DABS	1,283,1	;_C2SYNC

	global	_C2VREN
_C2VREN	set	2246
	DABS	1,280,1	;_C2VREN

	global	_EEPGD
_EEPGD	set	3175
	DABS	1,396,1	;_EEPGD

	global	_IOCB4
_IOCB4	set	2228
	DABS	1,278,1	;_IOCB4

	global	_IOCB5
_IOCB5	set	2229
	DABS	1,278,1	;_IOCB5

	global	_IOCB6
_IOCB6	set	2230
	DABS	1,278,1	;_IOCB6

	global	_IOCB7
_IOCB7	set	2231
	DABS	1,278,1	;_IOCB7

	global	_MC1OUT
_MC1OUT	set	2271
	DABS	1,283,1	;_MC1OUT

	global	_MC2OUT
_MC2OUT	set	2270
	DABS	1,283,1	;_MC2OUT

	global	_PULSR
_PULSR	set	3314
	DABS	1,414,1	;_PULSR

	global	_PULSS
_PULSS	set	3315
	DABS	1,414,1	;_PULSS

	global	_SR0
_SR0	set	3318
	DABS	1,414,1	;_SR0

	global	_SR1
_SR1	set	3319
	DABS	1,414,1	;_SR1

	global	_STRA
_STRA	set	3304
	DABS	1,413,1	;_STRA

	global	_STRB
_STRB	set	3305
	DABS	1,413,1	;_STRB

	global	_STRC
_STRC	set	3306
	DABS	1,413,1	;_STRC

	global	_STRD
_STRD	set	3307
	DABS	1,413,1	;_STRD

	global	_STRSYNC
_STRSYNC	set	3308
	DABS	1,413,1	;_STRSYNC

	global	_T1GSS
_T1GSS	set	2265
	DABS	1,283,1	;_T1GSS

	global	_VP6EN
_VP6EN	set	2244
	DABS	1,280,1	;_VP6EN

	global	_VR0
_VR0	set	2240
	DABS	1,280,1	;_VR0

	global	_VR1
_VR1	set	2241
	DABS	1,280,1	;_VR1

	global	_VR2
_VR2	set	2242
	DABS	1,280,1	;_VR2

	global	_VR3
_VR3	set	2243
	DABS	1,280,1	;_VR3

	global	_VRR
_VRR	set	2245
	DABS	1,280,1	;_VRR

	global	_WPUB4
_WPUB4	set	2220
	DABS	1,277,1	;_WPUB4

	global	_WPUB5
_WPUB5	set	2221
	DABS	1,277,1	;_WPUB5

	global	_WPUB6
_WPUB6	set	2222
	DABS	1,277,1	;_WPUB6

	global	_WPUB7
_WPUB7	set	2223
	DABS	1,277,1	;_WPUB7

	global	_WREN
_WREN	set	3170
	DABS	1,396,1	;_WREN

	global	_INTCON
_INTCON	set	11
	global	_MSCON
_MSCON	set	27
	global	_PORTA
_PORTA	set	5
	global	_PORTC
_PORTC	set	7
	global	_T0CON0
_T0CON0	set	31
	global	_TMR0
_TMR0	set	1
	global	_GIE
_GIE	set	95
	global	_PA3
_PA3	set	43
	global	_PA6
_PA6	set	46
	global	_PC0
_PC0	set	56
	global	_PC1
_PC1	set	57
	global	_PC4
_PC4	set	60
	global	_PC5
_PC5	set	61
	global	_RA4
_RA4	set	44
	global	_RA7
_RA7	set	47
	global	_T0IE
_T0IE	set	93
	global	_T0IF
_T0IF	set	90
	global	_T0ON
_T0ON	set	251
	global	_OPTION
_OPTION	set	129
	global	_OSCCON
_OSCCON	set	143
	global	_PSINKA
_PSINKA	set	151
	global	_PSINKC
_PSINKC	set	159
	global	_PSRCA
_PSRCA	set	136
	global	_PSRCC
_PSRCC	set	148
	global	_TRISA
_TRISA	set	133
	global	_TRISC
_TRISC	set	135
	global	_WPUA
_WPUA	set	149
	global	_WPUC
_WPUC	set	147
	file	"ms86_uv_cxy_h05.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
GetO3KeyEvent@keytime:
       ds      1

GetUvKeyEvent@keytime:
       ds      1

_O3_timeout:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_O3_working_timer:
       ds      2

_UV_working_timer:
       ds      2

_T0_cnt:
       ds      1

_UV_timeout:
       ds      1

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
	clrf	((__pbssBANK0)+5)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_DEVICE_INIT
?_DEVICE_INIT:	; 0 bytes @ 0x0
	global	?_DELAY_125US
?_DELAY_125US:	; 0 bytes @ 0x0
	global	?_ISR
?_ISR:	; 0 bytes @ 0x0
	global	??_ISR
??_ISR:	; 0 bytes @ 0x0
	global	?_TIMER0_INIT
?_TIMER0_INIT:	; 0 bytes @ 0x0
	global	?_ENABLE_INTERRUPT
?_ENABLE_INTERRUPT:	; 0 bytes @ 0x0
	global	?_PlaySound
?_PlaySound:	; 0 bytes @ 0x0
	global	?_SetUV
?_SetUV:	; 0 bytes @ 0x0
	global	?_SetO3
?_SetO3:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_GetO3KeyEvent
?_GetO3KeyEvent:	; 1 bytes @ 0x0
	global	?_GetUvKeyEvent
?_GetUvKeyEvent:	; 1 bytes @ 0x0
	ds	2
	global	??_DEVICE_INIT
??_DEVICE_INIT:	; 0 bytes @ 0x2
	global	??_DELAY_125US
??_DELAY_125US:	; 0 bytes @ 0x2
	global	??_TIMER0_INIT
??_TIMER0_INIT:	; 0 bytes @ 0x2
	global	??_ENABLE_INTERRUPT
??_ENABLE_INTERRUPT:	; 0 bytes @ 0x2
	global	??_GetO3KeyEvent
??_GetO3KeyEvent:	; 0 bytes @ 0x2
	global	??_GetUvKeyEvent
??_GetUvKeyEvent:	; 0 bytes @ 0x2
	global	DELAY_125US@a
DELAY_125US@a:	; 1 bytes @ 0x2
	global	GetO3KeyEvent@key_event
GetO3KeyEvent@key_event:	; 1 bytes @ 0x2
	global	GetUvKeyEvent@key_event
GetUvKeyEvent@key_event:	; 1 bytes @ 0x2
	ds	1
	global	?_DELAY_MS
?_DELAY_MS:	; 0 bytes @ 0x3
	global	DELAY_MS@Time
DELAY_MS@Time:	; 2 bytes @ 0x3
	ds	2
	global	??_DELAY_MS
??_DELAY_MS:	; 0 bytes @ 0x5
	global	DELAY_MS@a
DELAY_MS@a:	; 2 bytes @ 0x5
	ds	2
	global	??_PlaySound
??_PlaySound:	; 0 bytes @ 0x7
	global	PlaySound@sn
PlaySound@sn:	; 1 bytes @ 0x7
	ds	1
	global	PlaySound@i
PlaySound@i:	; 1 bytes @ 0x8
	ds	1
	global	??_SetUV
??_SetUV:	; 0 bytes @ 0x9
	global	??_SetO3
??_SetO3:	; 0 bytes @ 0x9
	global	??_main
??_main:	; 0 bytes @ 0x9
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	SetUV@open
SetUV@open:	; 1 bytes @ 0x0
	global	SetO3@open
SetO3@open:	; 1 bytes @ 0x0
	ds	1
	global	main@keycode
main@keycode:	; 1 bytes @ 0x1
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 9, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      9      12
;; BANK0           48      2       8

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_PlaySound
;;   _SetO3->_PlaySound
;;   _SetUV->_PlaySound
;;   _PlaySound->_DELAY_MS
;;   _DELAY_MS->_DELAY_125US
;;
;; Critical Paths under _ISR in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_SetUV
;;   _main->_SetO3
;;
;; Critical Paths under _ISR in BANK0
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 1     1      0    1279
;;                                              1 BANK0      1     1      0
;;                        _DEVICE_INIT
;;                        _TIMER0_INIT
;;                   _ENABLE_INTERRUPT
;;                          _PlaySound
;;                      _GetUvKeyEvent
;;                              _SetUV
;;                      _GetO3KeyEvent
;;                              _SetO3
;;                           _DELAY_MS
;; ---------------------------------------------------------------------------------
;; (1) _SetO3                                                1     1      0     340
;;                                              0 BANK0      1     1      0
;;                          _PlaySound
;; ---------------------------------------------------------------------------------
;; (1) _SetUV                                                1     1      0     340
;;                                              0 BANK0      1     1      0
;;                          _PlaySound
;; ---------------------------------------------------------------------------------
;; (2) _PlaySound                                            2     2      0     309
;;                                              7 COMMON     2     2      0
;;                           _DELAY_MS
;;                        _DELAY_125US
;; ---------------------------------------------------------------------------------
;; (1) _DELAY_MS                                             4     2      2     139
;;                                              3 COMMON     4     2      2
;;                        _DELAY_125US
;; ---------------------------------------------------------------------------------
;; (1) _GetUvKeyEvent                                        1     1      0      40
;;                                              2 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _GetO3KeyEvent                                        1     1      0      40
;;                                              2 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _ENABLE_INTERRUPT                                     0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _TIMER0_INIT                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _DELAY_125US                                          1     1      0      68
;;                                              2 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _DEVICE_INIT                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (5) _ISR                                                  2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 5
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _DEVICE_INIT
;;   _TIMER0_INIT
;;   _ENABLE_INTERRUPT
;;   _PlaySound
;;     _DELAY_MS
;;       _DELAY_125US
;;     _DELAY_125US
;;   _GetUvKeyEvent
;;   _SetUV
;;     _PlaySound
;;       _DELAY_MS
;;         _DELAY_125US
;;       _DELAY_125US
;;   _GetO3KeyEvent
;;   _SetO3
;;     _PlaySound
;;       _DELAY_MS
;;         _DELAY_125US
;;       _DELAY_125US
;;   _DELAY_MS
;;     _DELAY_125US
;;
;; _ISR (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      9       C       1       85.7%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       4       2        0.0%
;;DATA                 0      0      18       3        0.0%
;;BITBANK0            30      0       0       4        0.0%
;;BANK0               30      2       8       5       16.7%
;;ABS                  0      0      14       6        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 292 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  keycode         1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       1
;;      Temps:          0       0
;;      Totals:         0       1
;;Total ram usage:        1 bytes
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_DEVICE_INIT
;;		_TIMER0_INIT
;;		_ENABLE_INTERRUPT
;;		_PlaySound
;;		_GetUvKeyEvent
;;		_SetUV
;;		_GetO3KeyEvent
;;		_SetO3
;;		_DELAY_MS
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"MS86F_PWM1_HALF.C"
	line	292
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	293
	
l2502:	
	line	294
;MS86F_PWM1_HALF.C: 294: O3_working_timer=0;
	clrf	(_O3_working_timer)
	clrf	(_O3_working_timer+1)
	line	295
;MS86F_PWM1_HALF.C: 295: UV_timeout=0;
	clrf	(_UV_timeout)
	line	296
;MS86F_PWM1_HALF.C: 296: UV_working_timer=0;
	clrf	(_UV_working_timer)
	clrf	(_UV_working_timer+1)
	line	297
;MS86F_PWM1_HALF.C: 297: UV_timeout=0;
	clrf	(_UV_timeout)
	line	298
	
l2504:	
;MS86F_PWM1_HALF.C: 298: DEVICE_INIT();
	fcall	_DEVICE_INIT
	line	299
	
l2506:	
;MS86F_PWM1_HALF.C: 299: TIMER0_INIT();
	fcall	_TIMER0_INIT
	line	300
	
l2508:	
;MS86F_PWM1_HALF.C: 300: ENABLE_INTERRUPT();
	fcall	_ENABLE_INTERRUPT
	line	301
	
l2510:	
;MS86F_PWM1_HALF.C: 301: PlaySound(0xef);
	movlw	(0EFh)
	fcall	_PlaySound
	line	302
	
l2512:	
;MS86F_PWM1_HALF.C: 302: PlaySound(1);
	movlw	(01h)
	fcall	_PlaySound
	line	305
	
l2514:	
;MS86F_PWM1_HALF.C: 304: {
;MS86F_PWM1_HALF.C: 305: keycode=GetUvKeyEvent();
	fcall	_GetUvKeyEvent
	movwf	(main@keycode)
	line	306
	
l2516:	
;MS86F_PWM1_HALF.C: 306: if(keycode>0 || UV_timeout)
	movf	(main@keycode),f
	skipz
	goto	u821
	goto	u820
u821:
	goto	l2520
u820:
	
l2518:	
	movf	(_UV_timeout),w
	skipz
	goto	u830
	goto	l2530
u830:
	line	308
	
l2520:	
;MS86F_PWM1_HALF.C: 307: {
;MS86F_PWM1_HALF.C: 308: if(UV_timeout || UV_working_timer)SetUV(0);
	movf	(_UV_timeout),f
	skipz
	goto	u841
	goto	u840
u841:
	goto	l2524
u840:
	
l2522:	
	movf	(_UV_working_timer+1),w
	iorwf	(_UV_working_timer),w
	skipnz
	goto	u851
	goto	u850
u851:
	goto	l2526
u850:
	
l2524:	
	movlw	(0)
	fcall	_SetUV
	goto	l2528
	line	309
	
l2526:	
;MS86F_PWM1_HALF.C: 309: else SetUV(1);
	movlw	(01h)
	fcall	_SetUV
	line	310
	
l2528:	
;MS86F_PWM1_HALF.C: 310: UV_timeout=0;
	clrf	(_UV_timeout)
	line	312
	
l2530:	
;MS86F_PWM1_HALF.C: 311: }
;MS86F_PWM1_HALF.C: 312: keycode=GetO3KeyEvent();
	fcall	_GetO3KeyEvent
	movwf	(main@keycode)
	line	313
	
l2532:	
;MS86F_PWM1_HALF.C: 313: if(keycode>0 || O3_timeout)
	movf	(main@keycode),f
	skipz
	goto	u861
	goto	u860
u861:
	goto	l2536
u860:
	
l2534:	
	movf	(_O3_timeout),w
	skipz
	goto	u870
	goto	l2546
u870:
	line	315
	
l2536:	
;MS86F_PWM1_HALF.C: 314: {
;MS86F_PWM1_HALF.C: 315: if(O3_timeout || O3_working_timer)SetO3(0);
	movf	(_O3_timeout),f
	skipz
	goto	u881
	goto	u880
u881:
	goto	l2540
u880:
	
l2538:	
	movf	(_O3_working_timer+1),w
	iorwf	(_O3_working_timer),w
	skipnz
	goto	u891
	goto	u890
u891:
	goto	l2542
u890:
	
l2540:	
	movlw	(0)
	fcall	_SetO3
	goto	l2544
	line	316
	
l2542:	
;MS86F_PWM1_HALF.C: 316: else SetO3(1);
	movlw	(01h)
	fcall	_SetO3
	line	317
	
l2544:	
;MS86F_PWM1_HALF.C: 317: O3_timeout=0;
	clrf	(_O3_timeout)
	line	320
	
l2546:	
;MS86F_PWM1_HALF.C: 318: }
;MS86F_PWM1_HALF.C: 320: DELAY_MS(10);
	movlw	0Ah
	movwf	(?_DELAY_MS)
	clrf	(?_DELAY_MS+1)
	fcall	_DELAY_MS
	goto	l2514
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	322
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_SetO3
psect	text362,local,class=CODE,delta=2
global __ptext362
__ptext362:

;; *************** function _SetO3 *****************
;; Defined at:
;;		line 269 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;  open            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  open            1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       1
;;      Temps:          0       0
;;      Totals:         0       1
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_PlaySound
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text362
	file	"MS86F_PWM1_HALF.C"
	line	269
	global	__size_of_SetO3
	__size_of_SetO3	equ	__end_of_SetO3-_SetO3
	
_SetO3:	
	opt	stack 3
; Regs used in _SetO3: [wreg+status,2+status,0+pclath+cstack]
;SetO3@open stored from wreg
	movwf	(SetO3@open)
	line	270
	
l2490:	
;MS86F_PWM1_HALF.C: 270: if(open)
	movf	(SetO3@open),w
	skipz
	goto	u810
	goto	l857
u810:
	line	272
	
l2492:	
;MS86F_PWM1_HALF.C: 271: {
;MS86F_PWM1_HALF.C: 272: PC1=0;
	bcf	(57/8),(57)&7
	line	273
;MS86F_PWM1_HALF.C: 273: PC0=1;
	bsf	(56/8),(56)&7
	line	274
	
l2494:	
;MS86F_PWM1_HALF.C: 274: O3_working_timer=60*10;
	movlw	low(0258h)
	movwf	(_O3_working_timer)
	movlw	high(0258h)
	movwf	((_O3_working_timer))+1
	line	275
	
l2496:	
;MS86F_PWM1_HALF.C: 275: PlaySound(4);
	movlw	(04h)
	fcall	_PlaySound
	line	276
;MS86F_PWM1_HALF.C: 276: }
	goto	l859
	line	277
	
l857:	
	line	279
;MS86F_PWM1_HALF.C: 277: else
;MS86F_PWM1_HALF.C: 278: {
;MS86F_PWM1_HALF.C: 279: PC1=1;
	bsf	(57/8),(57)&7
	line	280
;MS86F_PWM1_HALF.C: 280: PC0=0;
	bcf	(56/8),(56)&7
	line	281
	
l2498:	
;MS86F_PWM1_HALF.C: 281: O3_working_timer=0;
	clrf	(_O3_working_timer)
	clrf	(_O3_working_timer+1)
	line	282
	
l2500:	
;MS86F_PWM1_HALF.C: 282: PlaySound(5);
	movlw	(05h)
	fcall	_PlaySound
	line	284
	
l859:	
	return
	opt stack 0
GLOBAL	__end_of_SetO3
	__end_of_SetO3:
;; =============== function _SetO3 ends ============

	signat	_SetO3,4216
	global	_SetUV
psect	text363,local,class=CODE,delta=2
global __ptext363
__ptext363:

;; *************** function _SetUV *****************
;; Defined at:
;;		line 252 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;  open            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  open            1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       1
;;      Temps:          0       0
;;      Totals:         0       1
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_PlaySound
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text363
	file	"MS86F_PWM1_HALF.C"
	line	252
	global	__size_of_SetUV
	__size_of_SetUV	equ	__end_of_SetUV-_SetUV
	
_SetUV:	
	opt	stack 3
; Regs used in _SetUV: [wreg+status,2+status,0+pclath+cstack]
;SetUV@open stored from wreg
	movwf	(SetUV@open)
	line	253
	
l2478:	
;MS86F_PWM1_HALF.C: 253: if(open)
	movf	(SetUV@open),w
	skipz
	goto	u800
	goto	l852
u800:
	line	255
	
l2480:	
;MS86F_PWM1_HALF.C: 254: {
;MS86F_PWM1_HALF.C: 255: RA4=0;
	bcf	(44/8),(44)&7
	line	256
;MS86F_PWM1_HALF.C: 256: PA3=0;
	bcf	(43/8),(43)&7
	line	257
	
l2482:	
;MS86F_PWM1_HALF.C: 257: UV_working_timer=60*3;
	movlw	0B4h
	movwf	(_UV_working_timer)
	clrf	(_UV_working_timer+1)
	line	258
	
l2484:	
;MS86F_PWM1_HALF.C: 258: PlaySound(2);
	movlw	(02h)
	fcall	_PlaySound
	line	259
;MS86F_PWM1_HALF.C: 259: }
	goto	l854
	line	260
	
l852:	
	line	262
;MS86F_PWM1_HALF.C: 260: else
;MS86F_PWM1_HALF.C: 261: {
;MS86F_PWM1_HALF.C: 262: RA4=1;
	bsf	(44/8),(44)&7
	line	263
;MS86F_PWM1_HALF.C: 263: PA3=1;
	bsf	(43/8),(43)&7
	line	264
	
l2486:	
;MS86F_PWM1_HALF.C: 264: UV_working_timer=0;
	clrf	(_UV_working_timer)
	clrf	(_UV_working_timer+1)
	line	265
	
l2488:	
;MS86F_PWM1_HALF.C: 265: PlaySound(3);
	movlw	(03h)
	fcall	_PlaySound
	line	267
	
l854:	
	return
	opt stack 0
GLOBAL	__end_of_SetUV
	__end_of_SetUV:
;; =============== function _SetUV ends ============

	signat	_SetUV,4216
	global	_PlaySound
psect	text364,local,class=CODE,delta=2
global __ptext364
__ptext364:

;; *************** function _PlaySound *****************
;; Defined at:
;;		line 224 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;  sn              1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  sn              1    7[COMMON] unsigned char 
;;  i               1    8[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         2       0
;;      Temps:          0       0
;;      Totals:         2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_DELAY_MS
;;		_DELAY_125US
;; This function is called by:
;;		_SetUV
;;		_SetO3
;;		_main
;; This function uses a non-reentrant model
;;
psect	text364
	file	"MS86F_PWM1_HALF.C"
	line	224
	global	__size_of_PlaySound
	__size_of_PlaySound	equ	__end_of_PlaySound-_PlaySound
	
_PlaySound:	
	opt	stack 3
; Regs used in _PlaySound: [wreg+status,2+status,0+pclath+cstack]
;PlaySound@sn stored from wreg
	line	226
	movwf	(PlaySound@sn)
	
l2458:	
;MS86F_PWM1_HALF.C: 225: char i;
;MS86F_PWM1_HALF.C: 226: PA6=1;
	bsf	(46/8),(46)&7
	line	227
;MS86F_PWM1_HALF.C: 227: RA7=1;
	bsf	(47/8),(47)&7
	line	229
;MS86F_PWM1_HALF.C: 229: PA6=0;
	bcf	(46/8),(46)&7
	line	230
	
l2460:	
;MS86F_PWM1_HALF.C: 230: DELAY_MS(5);
	movlw	05h
	movwf	(?_DELAY_MS)
	clrf	(?_DELAY_MS+1)
	fcall	_DELAY_MS
	line	232
	
l2462:	
;MS86F_PWM1_HALF.C: 232: for(i=0;i<8;i++)
	clrf	(PlaySound@i)
	line	233
	
l847:	
	line	234
;MS86F_PWM1_HALF.C: 233: {
;MS86F_PWM1_HALF.C: 234: PA6=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(46/8),(46)&7
	line	235
;MS86F_PWM1_HALF.C: 235: RA7=(sn&1);
	btfsc	(PlaySound@sn),0
	goto	u771
	goto	u770
	
u771:
	bcf	status, 5	;RP0=0, select bank0
	bsf	(47/8),(47)&7
	goto	u784
u770:
	bcf	status, 5	;RP0=0, select bank0
	bcf	(47/8),(47)&7
u784:
	line	236
	
l2468:	
;MS86F_PWM1_HALF.C: 236: DELAY_125US();
	fcall	_DELAY_125US
	line	237
;MS86F_PWM1_HALF.C: 237: DELAY_125US();
	fcall	_DELAY_125US
	line	238
;MS86F_PWM1_HALF.C: 238: DELAY_125US();
	fcall	_DELAY_125US
	line	239
;MS86F_PWM1_HALF.C: 239: DELAY_125US();
	fcall	_DELAY_125US
	line	240
	
l2470:	
;MS86F_PWM1_HALF.C: 240: PA6=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(46/8),(46)&7
	line	241
;MS86F_PWM1_HALF.C: 241: DELAY_125US();
	fcall	_DELAY_125US
	line	242
;MS86F_PWM1_HALF.C: 242: DELAY_125US();
	fcall	_DELAY_125US
	line	243
;MS86F_PWM1_HALF.C: 243: DELAY_125US();
	fcall	_DELAY_125US
	line	244
;MS86F_PWM1_HALF.C: 244: DELAY_125US();
	fcall	_DELAY_125US
	line	246
	
l2472:	
;MS86F_PWM1_HALF.C: 246: sn>>=1;
	clrc
	rrf	(PlaySound@sn),f
	line	232
	
l2474:	
	incf	(PlaySound@i),f
	
l2476:	
	movlw	(08h)
	subwf	(PlaySound@i),w
	skipc
	goto	u791
	goto	u790
u791:
	goto	l847
u790:
	
l848:	
	line	248
;MS86F_PWM1_HALF.C: 247: }
;MS86F_PWM1_HALF.C: 248: PA6=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(46/8),(46)&7
	line	249
;MS86F_PWM1_HALF.C: 249: RA7=1;
	bsf	(47/8),(47)&7
	line	250
	
l849:	
	return
	opt stack 0
GLOBAL	__end_of_PlaySound
	__end_of_PlaySound:
;; =============== function _PlaySound ends ============

	signat	_PlaySound,4216
	global	_DELAY_MS
psect	text365,local,class=CODE,delta=2
global __ptext365
__ptext365:

;; *************** function _DELAY_MS *****************
;; Defined at:
;;		line 116 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;  Time            2    3[COMMON] unsigned short 
;; Auto vars:     Size  Location     Type
;;  a               2    5[COMMON] unsigned short 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0
;;      Params:         2       0
;;      Locals:         2       0
;;      Temps:          0       0
;;      Totals:         4       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_DELAY_125US
;; This function is called by:
;;		_PlaySound
;;		_main
;; This function uses a non-reentrant model
;;
psect	text365
	file	"MS86F_PWM1_HALF.C"
	line	116
	global	__size_of_DELAY_MS
	__size_of_DELAY_MS	equ	__end_of_DELAY_MS-_DELAY_MS
	
_DELAY_MS:	
	opt	stack 5
; Regs used in _DELAY_MS: [wreg+status,2+status,0+pclath+cstack]
	line	119
	
l2448:	
;MS86F_PWM1_HALF.C: 117: unsigned short a;
;MS86F_PWM1_HALF.C: 119: Time<<=3;
	clrc
	rlf	(DELAY_MS@Time),f
	rlf	(DELAY_MS@Time+1),f
	clrc
	rlf	(DELAY_MS@Time),f
	rlf	(DELAY_MS@Time+1),f
	clrc
	rlf	(DELAY_MS@Time),f
	rlf	(DELAY_MS@Time+1),f
	line	121
	
l2450:	
;MS86F_PWM1_HALF.C: 121: for(a=0;a<Time;a++)
	clrf	(DELAY_MS@a)
	clrf	(DELAY_MS@a+1)
	goto	l2456
	line	123
	
l2452:	
;MS86F_PWM1_HALF.C: 122: {
;MS86F_PWM1_HALF.C: 123: DELAY_125US();
	fcall	_DELAY_125US
	line	121
	
l2454:	
	incf	(DELAY_MS@a),f
	skipnz
	incf	(DELAY_MS@a+1),f
	
l2456:	
	movf	(DELAY_MS@Time+1),w
	subwf	(DELAY_MS@a+1),w
	skipz
	goto	u765
	movf	(DELAY_MS@Time),w
	subwf	(DELAY_MS@a),w
u765:
	skipc
	goto	u761
	goto	u760
u761:
	goto	l2452
u760:
	line	125
	
l806:	
	return
	opt stack 0
GLOBAL	__end_of_DELAY_MS
	__end_of_DELAY_MS:
;; =============== function _DELAY_MS ends ============

	signat	_DELAY_MS,4216
	global	_GetUvKeyEvent
psect	text366,local,class=CODE,delta=2
global __ptext366
__ptext366:

;; *************** function _GetUvKeyEvent *****************
;; Defined at:
;;		line 205 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  key_event       1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         1       0
;;      Temps:          0       0
;;      Totals:         1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text366
	file	"MS86F_PWM1_HALF.C"
	line	205
	global	__size_of_GetUvKeyEvent
	__size_of_GetUvKeyEvent	equ	__end_of_GetUvKeyEvent-_GetUvKeyEvent
	
_GetUvKeyEvent:	
	opt	stack 6
; Regs used in _GetUvKeyEvent: [wreg+status,2+status,0]
	line	207
	
l2424:	
;MS86F_PWM1_HALF.C: 206: static unsigned char keytime=0;
;MS86F_PWM1_HALF.C: 207: unsigned char key_event=0;
	clrf	(GetUvKeyEvent@key_event)
	line	208
	
l2426:	
;MS86F_PWM1_HALF.C: 208: if(PC5==0)
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(61/8),(61)&7
	goto	u711
	goto	u710
u711:
	goto	l2436
u710:
	line	210
	
l2428:	
;MS86F_PWM1_HALF.C: 209: {
;MS86F_PWM1_HALF.C: 210: if(keytime<200)
	movlw	(0C8h)
	subwf	(GetUvKeyEvent@keytime),w
	skipnc
	goto	u721
	goto	u720
u721:
	goto	l2444
u720:
	line	212
	
l2430:	
;MS86F_PWM1_HALF.C: 211: {
;MS86F_PWM1_HALF.C: 212: keytime++;
	incf	(GetUvKeyEvent@keytime),f
	line	213
	
l2432:	
;MS86F_PWM1_HALF.C: 213: if(keytime>=200)key_event = 2;
	movlw	(0C8h)
	subwf	(GetUvKeyEvent@keytime),w
	skipc
	goto	u731
	goto	u730
u731:
	goto	l2444
u730:
	
l2434:	
	movlw	(02h)
	movwf	(GetUvKeyEvent@key_event)
	goto	l2444
	line	218
	
l2436:	
;MS86F_PWM1_HALF.C: 216: else
;MS86F_PWM1_HALF.C: 217: {
;MS86F_PWM1_HALF.C: 218: if(keytime>10 && keytime<200)key_event=1;
	movlw	(0Bh)
	subwf	(GetUvKeyEvent@keytime),w
	skipc
	goto	u741
	goto	u740
u741:
	goto	l2442
u740:
	
l2438:	
	movlw	(0C8h)
	subwf	(GetUvKeyEvent@keytime),w
	skipnc
	goto	u751
	goto	u750
u751:
	goto	l2442
u750:
	
l2440:	
	clrf	(GetUvKeyEvent@key_event)
	incf	(GetUvKeyEvent@key_event),f
	line	219
	
l2442:	
;MS86F_PWM1_HALF.C: 219: keytime=0;
	clrf	(GetUvKeyEvent@keytime)
	line	221
	
l2444:	
;MS86F_PWM1_HALF.C: 220: }
;MS86F_PWM1_HALF.C: 221: return key_event;
	movf	(GetUvKeyEvent@key_event),w
	line	222
	
l844:	
	return
	opt stack 0
GLOBAL	__end_of_GetUvKeyEvent
	__end_of_GetUvKeyEvent:
;; =============== function _GetUvKeyEvent ends ============

	signat	_GetUvKeyEvent,89
	global	_GetO3KeyEvent
psect	text367,local,class=CODE,delta=2
global __ptext367
__ptext367:

;; *************** function _GetO3KeyEvent *****************
;; Defined at:
;;		line 186 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  key_event       1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         1       0
;;      Temps:          0       0
;;      Totals:         1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text367
	file	"MS86F_PWM1_HALF.C"
	line	186
	global	__size_of_GetO3KeyEvent
	__size_of_GetO3KeyEvent	equ	__end_of_GetO3KeyEvent-_GetO3KeyEvent
	
_GetO3KeyEvent:	
	opt	stack 6
; Regs used in _GetO3KeyEvent: [wreg+status,2+status,0]
	line	188
	
l2400:	
;MS86F_PWM1_HALF.C: 187: static unsigned char keytime=0;
;MS86F_PWM1_HALF.C: 188: unsigned char key_event=0;
	clrf	(GetO3KeyEvent@key_event)
	line	189
	
l2402:	
;MS86F_PWM1_HALF.C: 189: if(PC4==0)
	btfsc	(60/8),(60)&7
	goto	u661
	goto	u660
u661:
	goto	l2412
u660:
	line	191
	
l2404:	
;MS86F_PWM1_HALF.C: 190: {
;MS86F_PWM1_HALF.C: 191: if(keytime<200)
	movlw	(0C8h)
	subwf	(GetO3KeyEvent@keytime),w
	skipnc
	goto	u671
	goto	u670
u671:
	goto	l2420
u670:
	line	193
	
l2406:	
;MS86F_PWM1_HALF.C: 192: {
;MS86F_PWM1_HALF.C: 193: keytime++;
	incf	(GetO3KeyEvent@keytime),f
	line	194
	
l2408:	
;MS86F_PWM1_HALF.C: 194: if(keytime>=200)key_event = 2;
	movlw	(0C8h)
	subwf	(GetO3KeyEvent@keytime),w
	skipc
	goto	u681
	goto	u680
u681:
	goto	l2420
u680:
	
l2410:	
	movlw	(02h)
	movwf	(GetO3KeyEvent@key_event)
	goto	l2420
	line	199
	
l2412:	
;MS86F_PWM1_HALF.C: 197: else
;MS86F_PWM1_HALF.C: 198: {
;MS86F_PWM1_HALF.C: 199: if(keytime>10 && keytime<200)key_event=1;
	movlw	(0Bh)
	subwf	(GetO3KeyEvent@keytime),w
	skipc
	goto	u691
	goto	u690
u691:
	goto	l2418
u690:
	
l2414:	
	movlw	(0C8h)
	subwf	(GetO3KeyEvent@keytime),w
	skipnc
	goto	u701
	goto	u700
u701:
	goto	l2418
u700:
	
l2416:	
	clrf	(GetO3KeyEvent@key_event)
	incf	(GetO3KeyEvent@key_event),f
	line	200
	
l2418:	
;MS86F_PWM1_HALF.C: 200: keytime=0;
	clrf	(GetO3KeyEvent@keytime)
	line	202
	
l2420:	
;MS86F_PWM1_HALF.C: 201: }
;MS86F_PWM1_HALF.C: 202: return key_event;
	movf	(GetO3KeyEvent@key_event),w
	line	203
	
l834:	
	return
	opt stack 0
GLOBAL	__end_of_GetO3KeyEvent
	__end_of_GetO3KeyEvent:
;; =============== function _GetO3KeyEvent ends ============

	signat	_GetO3KeyEvent,89
	global	_ENABLE_INTERRUPT
psect	text368,local,class=CODE,delta=2
global __ptext368
__ptext368:

;; *************** function _ENABLE_INTERRUPT *****************
;; Defined at:
;;		line 170 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 17F/20
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text368
	file	"MS86F_PWM1_HALF.C"
	line	170
	global	__size_of_ENABLE_INTERRUPT
	__size_of_ENABLE_INTERRUPT	equ	__end_of_ENABLE_INTERRUPT-_ENABLE_INTERRUPT
	
_ENABLE_INTERRUPT:	
	opt	stack 6
; Regs used in _ENABLE_INTERRUPT: []
	line	171
	
l2398:	
;MS86F_PWM1_HALF.C: 171: T0IF = 0;
	bcf	(90/8),(90)&7
	line	172
;MS86F_PWM1_HALF.C: 172: T0IE = 1;
	bsf	(93/8),(93)&7
	line	173
;MS86F_PWM1_HALF.C: 173: T0ON = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(251/8),(251)&7
	line	175
;MS86F_PWM1_HALF.C: 175: GIE = 1;
	bsf	(95/8),(95)&7
	line	176
	
l821:	
	return
	opt stack 0
GLOBAL	__end_of_ENABLE_INTERRUPT
	__end_of_ENABLE_INTERRUPT:
;; =============== function _ENABLE_INTERRUPT ends ============

	signat	_ENABLE_INTERRUPT,88
	global	_TIMER0_INIT
psect	text369,local,class=CODE,delta=2
global __ptext369
__ptext369:

;; *************** function _TIMER0_INIT *****************
;; Defined at:
;;		line 158 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text369
	file	"MS86F_PWM1_HALF.C"
	line	158
	global	__size_of_TIMER0_INIT
	__size_of_TIMER0_INIT	equ	__end_of_TIMER0_INIT-_TIMER0_INIT
	
_TIMER0_INIT:	
	opt	stack 6
; Regs used in _TIMER0_INIT: [wreg+status,2]
	line	159
	
l2394:	
;MS86F_PWM1_HALF.C: 159: T0CON0 = 0B00000000;
	clrf	(31)	;volatile
	line	160
	
l2396:	
;MS86F_PWM1_HALF.C: 160: OPTION = 0B00000111;
	movlw	(07h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(129)^080h	;volatile
	line	161
	
l818:	
	return
	opt stack 0
GLOBAL	__end_of_TIMER0_INIT
	__end_of_TIMER0_INIT:
;; =============== function _TIMER0_INIT ends ============

	signat	_TIMER0_INIT,88
	global	_DELAY_125US
psect	text370,local,class=CODE,delta=2
global __ptext370
__ptext370:

;; *************** function _DELAY_125US *****************
;; Defined at:
;;		line 107 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  a               1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         1       0
;;      Temps:          0       0
;;      Totals:         1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DELAY_MS
;;		_PlaySound
;; This function uses a non-reentrant model
;;
psect	text370
	file	"MS86F_PWM1_HALF.C"
	line	107
	global	__size_of_DELAY_125US
	__size_of_DELAY_125US	equ	__end_of_DELAY_125US-_DELAY_125US
	
_DELAY_125US:	
	opt	stack 5
; Regs used in _DELAY_125US: [wreg+status,2+status,0]
	line	110
	
l2384:	
;MS86F_PWM1_HALF.C: 108: unsigned char a;
;MS86F_PWM1_HALF.C: 110: for(a=0;a<125;a++)
	clrf	(DELAY_125US@a)
	line	111
	
l798:	
	line	112
# 112 "MS86F_PWM1_HALF.C"
clrwdt ;#
psect	text370
	line	110
	
l2390:	
	incf	(DELAY_125US@a),f
	
l2392:	
	movlw	(07Dh)
	subwf	(DELAY_125US@a),w
	skipc
	goto	u651
	goto	u650
u651:
	goto	l798
u650:
	line	114
	
l800:	
	return
	opt stack 0
GLOBAL	__end_of_DELAY_125US
	__end_of_DELAY_125US:
;; =============== function _DELAY_125US ends ============

	signat	_DELAY_125US,88
	global	_DEVICE_INIT
psect	text371,local,class=CODE,delta=2
global __ptext371
__ptext371:

;; *************** function _DEVICE_INIT *****************
;; Defined at:
;;		line 74 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text371
	file	"MS86F_PWM1_HALF.C"
	line	74
	global	__size_of_DEVICE_INIT
	__size_of_DEVICE_INIT	equ	__end_of_DEVICE_INIT-_DEVICE_INIT
	
_DEVICE_INIT:	
	opt	stack 6
; Regs used in _DEVICE_INIT: [wreg+status,2]
	line	75
	
l2356:	
;MS86F_PWM1_HALF.C: 75: OSCCON = 0B01110001;
	movlw	(071h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	78
	
l2358:	
;MS86F_PWM1_HALF.C: 78: INTCON = 0B00000000;
	clrf	(11)	;volatile
	line	79
	
l2360:	
;MS86F_PWM1_HALF.C: 79: OPTION = 0B00001000;
	movlw	(08h)
	movwf	(129)^080h	;volatile
	line	81
	
l2362:	
;MS86F_PWM1_HALF.C: 81: PORTA = 0B11011000;
	movlw	(0D8h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(5)	;volatile
	line	82
	
l2364:	
;MS86F_PWM1_HALF.C: 82: TRISA = 0B00100111;
	movlw	(027h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	83
	
l2366:	
;MS86F_PWM1_HALF.C: 83: WPUA = 0B00100111;
	movlw	(027h)
	movwf	(149)^080h	;volatile
	line	89
	
l2368:	
;MS86F_PWM1_HALF.C: 89: PORTC = 0B00000010;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(7)	;volatile
	line	90
	
l2370:	
;MS86F_PWM1_HALF.C: 90: TRISC = 0B11111100;
	movlw	(0FCh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	91
	
l2372:	
;MS86F_PWM1_HALF.C: 91: WPUC = 0B11111100;
	movlw	(0FCh)
	movwf	(147)^080h	;volatile
	line	93
	
l2374:	
;MS86F_PWM1_HALF.C: 93: PSRCA = 0B11111111;
	movlw	(0FFh)
	movwf	(136)^080h	;volatile
	line	94
	
l2376:	
;MS86F_PWM1_HALF.C: 94: PSRCC = 0B11111111;
	movlw	(0FFh)
	movwf	(148)^080h	;volatile
	line	95
	
l2378:	
;MS86F_PWM1_HALF.C: 95: PSINKA = 0B11111111;
	movlw	(0FFh)
	movwf	(151)^080h	;volatile
	line	96
	
l2380:	
;MS86F_PWM1_HALF.C: 96: PSINKC = 0B11111111;
	movlw	(0FFh)
	movwf	(159)^080h	;volatile
	line	97
	
l2382:	
;MS86F_PWM1_HALF.C: 97: MSCON = 0B00110000;
	movlw	(030h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(27)	;volatile
	line	105
	
l795:	
	return
	opt stack 0
GLOBAL	__end_of_DEVICE_INIT
	__end_of_DEVICE_INIT:
;; =============== function _DEVICE_INIT ends ============

	signat	_DEVICE_INIT,88
	global	_ISR
psect	text372,local,class=CODE,delta=2
global __ptext372
__ptext372:

;; *************** function _ISR *****************
;; Defined at:
;;		line 128 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          2       0
;;      Totals:         2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text372
	file	"MS86F_PWM1_HALF.C"
	line	128
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 3
; Regs used in _ISR: [wreg+status,2+status,0]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_ISR+0)
	movf	pclath,w
	movwf	(??_ISR+1)
	ljmp	_ISR
psect	text372
	line	129
	
i1l2172:	
;MS86F_PWM1_HALF.C: 129: if(T0IE&&T0IF)
	btfss	(93/8),(93)&7
	goto	u34_21
	goto	u34_20
u34_21:
	goto	i1l815
u34_20:
	
i1l2174:	
	btfss	(90/8),(90)&7
	goto	u35_21
	goto	u35_20
u35_21:
	goto	i1l815
u35_20:
	line	131
	
i1l2176:	
;MS86F_PWM1_HALF.C: 130: {
;MS86F_PWM1_HALF.C: 131: T0IF = 0;
	bcf	(90/8),(90)&7
	line	132
	
i1l2178:	
;MS86F_PWM1_HALF.C: 132: TMR0 = 6;
	movlw	(06h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(1)	;volatile
	line	133
	
i1l2180:	
;MS86F_PWM1_HALF.C: 133: T0_cnt++;
	incf	(_T0_cnt),f	;volatile
	line	134
	
i1l2182:	
;MS86F_PWM1_HALF.C: 134: if(T0_cnt>=125)
	movlw	(07Dh)
	subwf	(_T0_cnt),w	;volatile
	skipc
	goto	u36_21
	goto	u36_20
u36_21:
	goto	i1l815
u36_20:
	line	136
	
i1l2184:	
;MS86F_PWM1_HALF.C: 135: {
;MS86F_PWM1_HALF.C: 136: if(O3_working_timer)
	movf	(_O3_working_timer+1),w
	iorwf	(_O3_working_timer),w
	skipnz
	goto	u37_21
	goto	u37_20
u37_21:
	goto	i1l2192
u37_20:
	line	138
	
i1l2186:	
;MS86F_PWM1_HALF.C: 137: {
;MS86F_PWM1_HALF.C: 138: O3_working_timer--;
	movlw	low(01h)
	subwf	(_O3_working_timer),f
	movlw	high(01h)
	skipc
	decf	(_O3_working_timer+1),f
	subwf	(_O3_working_timer+1),f
	line	139
	
i1l2188:	
;MS86F_PWM1_HALF.C: 139: if(O3_working_timer==0)O3_timeout=1;
	movf	((_O3_working_timer+1)),w
	iorwf	((_O3_working_timer)),w
	skipz
	goto	u38_21
	goto	u38_20
u38_21:
	goto	i1l2192
u38_20:
	
i1l2190:	
	clrf	(_O3_timeout)
	incf	(_O3_timeout),f
	line	141
	
i1l2192:	
;MS86F_PWM1_HALF.C: 140: }
;MS86F_PWM1_HALF.C: 141: if(UV_working_timer)
	movf	(_UV_working_timer+1),w
	iorwf	(_UV_working_timer),w
	skipnz
	goto	u39_21
	goto	u39_20
u39_21:
	goto	i1l2200
u39_20:
	line	143
	
i1l2194:	
;MS86F_PWM1_HALF.C: 142: {
;MS86F_PWM1_HALF.C: 143: UV_working_timer--;
	movlw	low(01h)
	subwf	(_UV_working_timer),f
	movlw	high(01h)
	skipc
	decf	(_UV_working_timer+1),f
	subwf	(_UV_working_timer+1),f
	line	144
	
i1l2196:	
;MS86F_PWM1_HALF.C: 144: if(UV_working_timer==0)UV_timeout=1;
	movf	((_UV_working_timer+1)),w
	iorwf	((_UV_working_timer)),w
	skipz
	goto	u40_21
	goto	u40_20
u40_21:
	goto	i1l2200
u40_20:
	
i1l2198:	
	clrf	(_UV_timeout)
	incf	(_UV_timeout),f
	line	146
	
i1l2200:	
;MS86F_PWM1_HALF.C: 145: }
;MS86F_PWM1_HALF.C: 146: T0_cnt=0;
	clrf	(_T0_cnt)	;volatile
	line	149
	
i1l815:	
	movf	(??_ISR+1),w
	movwf	pclath
	swapf	(??_ISR+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ISR
	__end_of_ISR:
;; =============== function _ISR ends ============

	signat	_ISR,88
psect	text373,local,class=CODE,delta=2
global __ptext373
__ptext373:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
