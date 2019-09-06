/**
  ******************************************************************************
  * @file    Lab1.c 
  * @author  Noah Salzman/Nikhil Bajaj
  * @version V1.0.0
  * @date    08/28/2013
  * @brief   Main program body.
  ******************************************************************************
  */ 

/* Includes ------------------------------------------------------------------*/
#include "ME586.h"

int main(void)
{
	int i;
	int j;
	initports(0x0);
	for(i=0;i<256;i++){
		digout(i);
		for(j=0;j<0x04FFFF;j++){
			__nop();
		}
		if (i == 255){
			i=0;
		}
	}
} //end of main program

void inthand(void){		//external interrupt service routine
	
	// DO NOT PUT ANYTHING HERE FOR LAB1
	
}

void timehand(void){	//systick timer service routine
	
	// DO NOT PUT ANYTHING HERE FOR LAB1
	
}
/***********************END OF FILE****/
