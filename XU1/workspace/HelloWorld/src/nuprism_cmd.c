/*
 * nuprism_cmd.c
 *
 *  Created on: May 8, 2020
 *      Author: rypay
 */

#include <stdio.h>
#include "StandardIncludes.h"
#include "UtilityFunctions.h"

#include "xparameters.h"
#include <stdlib.h>
#include <string.h>
#include "xil_types.h"

#include "nuprism_cmd.h"

u8 command_handler(char* command){

	char * token;
	token = strtok(command, " ");

	if (strcmp(token, "help") == 0){
		return display_help_info();
	} else if (strcmp(token, "adc") == 0){
		return adc_command_parser(strtok(NULL, " "));
	} else if (strcmp(token, "clc") == 0){
		return clock_cleaner_command_parser(strtok(NULL, " "));
	} else {
		display_error_message();
		return NUPRISM_CMD_FAILURE;
	}
	return NUPRISM_CMD_SUCCESS;
}

u8 adc_command_parser(char* command){
	printf("%s\n", strtok(NULL, " "));
	return NUPRISM_CMD_SUCCESS;
}

u8 display_help_info(){
	printf("helpinfohere\n");
	return NUPRISM_CMD_SUCCESS;
}

void display_error_message(){
	printf("errormessagehere\n");
}

u8 clock_cleaner_command_parser(char* command){
	printf("%s\n", strtok(NULL, " "));
	return NUPRISM_CMD_SUCCESS;
}
