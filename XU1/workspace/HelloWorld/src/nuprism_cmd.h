/*
 * nuprism_cmd.h
 *
 *  Created on: May 8, 2020
 *      Author: rypay
 */

#ifndef SRC_NUPRISM_CMD_H_
#define SRC_NUPRISM_CMD_H_

#define NUPRISM_CMD_SUCCESS 1;
#define NUPRISM_CMD_FAILURE 0;

u8 command_handler(char* command);
u8 adc_command_parser(char* command);
u8 display_help_info();
void display_error_message();
u8 clock_cleaner_command_parser(char* command);

#endif /* SRC_NUPRISM_CMD_H_ */
