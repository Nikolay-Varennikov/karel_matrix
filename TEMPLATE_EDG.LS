/PROG  TEMPLATE_EDG
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 2674;
CREATE		= DATE 22-03-22  TIME 17:35:56;
MODIFIED	= DATE 22-04-07  TIME 18:13:34;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 92;
MEMORY_SIZE	= 3146;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,*,*,*;
CONTROL_CODE	= 00000000 00000000;
/APPL
  ARC Welding Equipment : 1,*,*,*,*;
/MN
   1:  !setting parametrs ;
   2:  CALL SET_EDG_ST(90,(-135)) ;
   3:  CALL SET_LIM(1,1,1) ;
   4:   ;
   5:J P[1] 10% FINE    ;
   6:   ;
   7:  !setting start offset ;
   8:  PR[GP1:10,1]=1225    ;
   9:  PR[GP1:10,2]=87    ;
  10:  PR[GP1:10,3]=(-1055)    ;
  11:  PR[GP1:10,4]=0    ;
  12:  PR[GP1:10,5]=0    ;
  13:  PR[GP1:10,6]=0    ;
  14:   ;
  15:  CALL APR_ZDA(50,0,0) ;
  16:  !CYLINDRICAL SEARCH ;
  17:  JMP LBL[21] ;
  18:  LBL[20] ;
  19:  UALM[2] ;
  20:  LBL[21] ;
  21:   ;
  22:  CALL SRCH((-15),180,270,0,(-100),0,25) ;
  23:  CALL APR_ZDA(50,180,270) ;
  24:  CALL APR_ZDA(50,180,0) ;
  25:   ;
  26:  CALL SRCH((-15),180,0,0,(-100),0,26) ;
  27:  CALL APR_ZDA(50,180,0) ;
  28:  CALL APR_ZDA(50,180,90) ;
  29:   ;
  30:  CALL SRCH((-15),180,90,0,(-100),0,27) ;
  31:  CALL APR_ZDA(50,180,90) ;
  32:  CALL APR_ZDA(50,180,180) ;
  33:   ;
  34:  CALL SRCH((-15),180,180,0,(-100),0,28) ;
  35:  CALL APR_ZDA(50,180,180) ;
  36:   ;
  37:  CALL CHK_CIRC(25,26,27,28) ;
  38:  IF (R[13]<>0),JMP LBL[20] ;
  39:   ;
  40:  !calculated PRE offset ;
  41:  CALL CALC_EDG_FRM(25,26,27,28,25,26,27,28) ;
  42:   ;
  43:  !centring WP frame as calculated ;
  44:  PR[10]=PR[11]    ;
  45:   ;
  46:   ;
  47:  !edge measurment ;
  48:  JMP LBL[11] ;
  49:  LBL[10] ;
  50:  UALM[2] ;
  51:  LBL[11] ;
  52:   ;
  53:  CALL SRCH(20,100,0,(-100),0,0,21) ;
  54:  CALL SRCH(20,100,90,(-100),0,0,22) ;
  55:  CALL SRCH(20,100,180,(-100),0,0,23) ;
  56:  CALL SRCH(20,100,270,(-100),0,0,24) ;
  57:   ;
  58:  CALL CHK_PLATE(21,22,23,24) ;
  59:  IF (R[13]<>0),JMP LBL[10] ;
  60:   ;
  61:  !calculated offset ;
  62:  CALL CALC_EDG_FRM(25,26,27,28,21,22,23,24) ;
  63:   ;
  64:  PR[GP1:10,1]=PR[GP1:11,1]    ;
  65:  PR[GP1:10,2]=PR[GP1:11,2]    ;
  66:  PR[GP1:10,3]=PR[GP1:11,3]    ;
  67:  PR[GP1:10,4]=PR[GP1:11,4]    ;
  68:  PR[GP1:10,5]=PR[GP1:11,5]    ;
  69:  PR[GP1:10,6]=PR[GP1:11,6]    ;
  70:   ;
  71:  !change orientation for welding ;
  72:  CALL SET_EDG_ST(90,(-135)) ;
  73:  CALL APR_ZDA(50,0,0) ;
  74:   ;
  75:  !welding parameters ;
  76:  R[10]=1    ;
  77:  R[11]=1    ;
  78:  CALL WAVE(6,.7,.2,.2) ;
  79:  CALL MSED(2,0,1,0) ;
  80:   ;
  81:  !       dZ D A1 A2 END TRN  wave ;
  82:  //CALL WLD(2,106,0,275,1,1,1) ;
  83:   ;
  84:  !       dZ D A1 A2 END TRN  wave ;
  85:  R[10]=1    ;
  86:  R[11]=2    ;
  87:  CALL WLD(2,125,0,360,1,1,0) ;
  88:   ;
  89:   ;
  90:  CALL APR_ZDA(50,0,0) ;
  91:   ;
  92:J P[1] 10% FINE    ;
/POS
P[1]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1320.024  mm,	Y =    21.650  mm,	Z =  -504.719  mm,
	W =    -5.088 deg,	P =     3.429 deg,	R =  -135.007 deg
};
/END
