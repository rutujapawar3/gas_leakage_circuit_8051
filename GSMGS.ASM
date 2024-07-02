          ORG 0000H
          SJMP START
          ORG 0030H
START:    MOV TCON,#00H
          MOV TMOD,#21H 
          MOV SP,#50H
          MOV IE,#00H
          MOV IP,#00H
          MOV P2,#00H
          MOV P3,#0FFH
          MOV P1,#0FFH
          MOV PCON,#00H      ; initialise serial comm
          MOV SCON,#50H      ; tx, rx mode
          MOV TH1,#0FDH      ; baud rate 9600
          SETB TR1
           CLR P3.7  
           CLR P3.5
           CLR P3.4     
          
          
          
          MOV R4,#00H
          MOV R3,#00H
          MOV R2,#00H
          MOV R5,#00H
          MOV R6,#00H
          MOV R7,#00H
               
         LCALL LOOP
         LCALL LOOP
         LCALL LOOP
         MOV SBUF,#'A'
         JNB TI,$
         CLR TI
         LCALL PENTER
         LCALL LOOP
         LCALL LOOP
         LCALL LOOP
        
          
          
          MOV R2,#00H
          MOV DPTR,#NAME1 
 LLL:         MOV A,R2    
		  MOVC A,@A+DPTR
		  MOV SBUF,A
		  JNB TI,$
		  CLR TI
		  
		  INC R2
		  CJNE R2,#09H,LLL
		  
		  LCALL PENTER
		  
		  CLR RI
		  CLR RI
		  
		  
		  LCALL LOOP
		  LCALL LOOP
		 
		  CLR RI
		  CLR RI
   EEE1:  
          CLR P3.7
		  
          JNB P1.7,SEN1
          JNB P1.7,SEN2
          JNB P1.7,SEN3
          JNB P1.7,SEN4
          SJMP EEE1
          
   
          
           SEN1:  SETB P3.7
           SETB P3.4
           SETB P3.5
           LCALL INCSEND1
           LJMP EEE1
           SEN2:  SETB P3.7
           SETB P3.4
           SETB P3.5
           LCALL INCSEND2
           LJMP EEE1
           SEN3:SETB P3.7
           SETB P3.4
           SETB P3.5
           LCALL INCSEND3
           LJMP EEE1
           SEN4:SETB P3.7
           SETB P3.4
           SETB P3.5
           LCALL INCSEND4
           LJMP EEE1
           
              LJMP EEE1
    

          

INCSEND1:  
          MOV R2,#00H
          MOV DPTR,#NAME3 
 LLL2E:         MOV A,R2    
		  MOVC A,@A+DPTR
		  MOV SBUF,A
		  JNB TI,$
		  CLR TI
		  INC R2
		  CJNE R2,#14H,LLL2E
		  
		  LCALL PENTER
	      LCALL LOOP
	      LCALL LOOP
	      
	       MOV R2,#00H
          MOV DPTR,#GSMSG1 
 LLL3E:         MOV A,R2    
		  MOVC A,@A+DPTR
		  MOV SBUF,A
		  JNB TI,$
		  CLR TI
		  INC R2
		  CJNE R2,#10H,LLL3E
		  
		  LCALL PENTER1
		 
		  LCALL LOOP
		  LCALL LOOP
		  LCALL LOOP
		  LCALL LOOP
		  
		  
          MOV R2,#00H
          MOV DPTR,#NAME4 
 LLL2EZ:         MOV A,R2    
		  MOVC A,@A+DPTR
		  MOV SBUF,A
		  JNB TI,$
		  CLR TI
		  INC R2
		  CJNE R2,#14H,LLL2EZ
		  
		  LCALL PENTER
	      LCALL LOOP
	      LCALL LOOP
	      
	       MOV R2,#00H
          MOV DPTR,#GSMSG1 
 LLL3EZ:         MOV A,R2    
		  MOVC A,@A+DPTR
		  MOV SBUF,A
		  JNB TI,$
		  CLR TI
		  INC R2
		  CJNE R2,#10H,LLL3EZ
		  
		  LCALL PENTER1
		 
		  LCALL LOOP
		  LCALL LOOP
		  LCALL LOOP
		  LCALL LOOP		  
		  
		  RET


INCSEND2: 
          MOV R2,#00H
          MOV DPTR,#NAME3 
 LLL21D:         MOV A,R2    
		  MOVC A,@A+DPTR
		  MOV SBUF,A
		  JNB TI,$
		  CLR TI
		  INC R2
		  CJNE R2,#14H,LLL21D
		  
		  LCALL PENTER
	      LCALL LOOP
	      LCALL LOOP
	      
	       MOV R2,#00H
          MOV DPTR,#GSMSG2
 LLL31D:         MOV A,R2    
		  MOVC A,@A+DPTR
		  MOV SBUF,A
		  JNB TI,$
		  CLR TI
		  INC R2
		  CJNE R2,#10H,LLL31D
		  
		  LCALL PENTER1
		  
		  LCALL LOOP
		  LCALL LOOP
		  LCALL LOOP
		  LCALL LOOP
		  
          MOV R2,#00H
          MOV DPTR,#NAME4 
 LLL21DZ:         MOV A,R2    
		  MOVC A,@A+DPTR
		  MOV SBUF,A
		  JNB TI,$
		  CLR TI
		  INC R2
		  CJNE R2,#14H,LLL21DZ
		  
		  LCALL PENTER
	      LCALL LOOP
	      LCALL LOOP
	      
	       MOV R2,#00H
          MOV DPTR,#GSMSG2
 LLL31DZ:         MOV A,R2    
		  MOVC A,@A+DPTR
		  MOV SBUF,A
		  JNB TI,$
		  CLR TI
		  INC R2
		  CJNE R2,#10H,LLL31DZ
		  
		  LCALL PENTER1
		  
		  LCALL LOOP
		  LCALL LOOP
		  LCALL LOOP
		  LCALL LOOP		  
		 
		  RET

INCSEND3:  
          MOV R2,#00H
          MOV DPTR,#NAME3 
 LLL2E3:         MOV A,R2    
		  MOVC A,@A+DPTR
		  MOV SBUF,A
		  JNB TI,$
		  CLR TI
		  INC R2
		  CJNE R2,#14H,LLL2E3
		  
		  LCALL PENTER
	      LCALL LOOP
	      LCALL LOOP
	      
	       MOV R2,#00H
          MOV DPTR,#GSMSG3 
 LLL3E3:         MOV A,R2    
		  MOVC A,@A+DPTR
		  MOV SBUF,A
		  JNB TI,$
		  CLR TI
		  INC R2
		  CJNE R2,#10H,LLL3E3
		  
		  LCALL PENTER1
		 
		  LCALL LOOP
		  LCALL LOOP
		  LCALL LOOP
		  LCALL LOOP
    MOV R2,#00H
          MOV DPTR,#NAME4 
 LLL2E3Z:         MOV A,R2    
		  MOVC A,@A+DPTR
		  MOV SBUF,A
		  JNB TI,$
		  CLR TI
		  INC R2
		  CJNE R2,#14H,LLL2E3Z
		  
		  LCALL PENTER
	      LCALL LOOP
	      LCALL LOOP
	      
	       MOV R2,#00H
          MOV DPTR,#GSMSG3 
 LLL3E3Z:         MOV A,R2    
		  MOVC A,@A+DPTR
		  MOV SBUF,A
		  JNB TI,$
		  CLR TI
		  INC R2
		  CJNE R2,#10H,LLL3E3Z
		  
		  LCALL PENTER1
		 
		  LCALL LOOP
		  LCALL LOOP
		  LCALL LOOP
		  LCALL LOOP		  
		  RET


INCSEND4: 
          MOV R2,#00H
          MOV DPTR,#NAME3 
 LLL21D4:         MOV A,R2    
		  MOVC A,@A+DPTR
		  MOV SBUF,A
		  JNB TI,$
		  CLR TI
		  INC R2
		  CJNE R2,#14H,LLL21D4
		  
		  LCALL PENTER
	      LCALL LOOP
	      LCALL LOOP
	      
	       MOV R2,#00H
          MOV DPTR,#GSMSG4
 LLL31D4:         MOV A,R2    
		  MOVC A,@A+DPTR
		  MOV SBUF,A
		  JNB TI,$
		  CLR TI
		  INC R2
		  CJNE R2,#10H,LLL31D4
		  
		  LCALL PENTER1
		  
		  LCALL LOOP
		  LCALL LOOP
		  LCALL LOOP
		  LCALL LOOP
		  
		  MOV R2,#00H
          MOV DPTR,#NAME4 
 LLL21D4Z:         MOV A,R2    
		  MOVC A,@A+DPTR
		  MOV SBUF,A
		  JNB TI,$
		  CLR TI
		  INC R2
		  CJNE R2,#14H,LLL21D4Z
		  
		  LCALL PENTER
	      LCALL LOOP
	      LCALL LOOP
	      
	       MOV R2,#00H
          MOV DPTR,#GSMSG4
 LLL31D4Z:         MOV A,R2    
		  MOVC A,@A+DPTR
		  MOV SBUF,A
		  JNB TI,$
		  CLR TI
		  INC R2
		  CJNE R2,#10H,LLL31D4Z
		  
		  LCALL PENTER1
		  
		  LCALL LOOP
		  LCALL LOOP
		  LCALL LOOP
		  LCALL LOOP
		 
		  RET
		  


          	  
		  PENTER1:              
         
          mov sbuf,#1Ah
          jnb ti,$
          clr ti
           
          RET     
		  
    
          
          
DELAY500MS:
          MOV R4,#05H
DELAYLOOP: 
          MOV TL0,#0B0H
          MOV TH0,#03CH
          SETB TR0
          JNB TF0,$
          CLR TR0
          CLR TF0
          DJNZ R4,DELAYLOOP
          RET
          
 PENTER:              
         
          mov sbuf,#0dh
          jnb ti,$
          clr ti
           
          RET                    
          
LOOP:  
             MOV R5,#20H
  BACK:
             MOV TL0,#0B0H
             MOV TH0,#03CH
             SETB TR0
             JNB TF0,$       
             CLR TR0
             CLR TF0
             DJNZ R5,BACK        
                RET
                
 LOOP1:  
             MOV R5,#55H
  BACK1:
             MOV TL0,#0B0H
             MOV TH0,#03CH
             SETB TR0
             JNB TF0,$       
             CLR TR0
             CLR TF0
             DJNZ R5,BACK1        
                RET               
   
         
     NAME1:
          DB "AT+CMGF=1"  
          
        
          
          NAME3:
          DB "AT+CMGS="8767964287""
          
          NAME4:
          DB "AT+CMGS="8767964287""
          
         
          
    GSMSG1: DB "WAR:GLEAK DETECT" 
    
    GSMSG2: DB "WAR:GLEAK DETECT"  
     
    GSMSG3: DB "WAR:GLEAK DETECT" 
    
    GSMSG4: DB "WAR:GLEAK DETECT" 
      
        END