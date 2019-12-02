note
	description: "Operate abstract user interface"
	author: "JSO and Jackie Wang"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	ETF_SOFTWARE_OPERATION_INTERFACE

feature {NONE} -- Initialization

	make
			-- initialize input, output, ui
		do
			initialize_attributes
		end

	initialize_attributes
			-- initialize attributes
			-- and attach output handlers
		do
			create output.make
			  -- create user interface and attach command output handlers
			create ui.make -- user interface		
			  -- create empty default input handler
			create input.make_without_running (dummy_command, ui)
		end

feature -- attributes
	ui				: ETF_ABSTRACT_UI
	input			: ETF_INPUT_HANDLER
	output			: ETF_CMD_LINE_OUTPUT_HANDLER
	dummy_command	: STRING = ""
	Error			: BOOLEAN

feature -- Commands

	execute(cmds : STRING; is_init: BOOLEAN)
			-- Parse input string `cmds' as a list of commands
			-- If no input Errors,
			-- 		then execute commands and log to 'output'
			-- 		note. when 'is_init', log the initial state
			-- If Errors,
			-- 		then report Errors to 'output'
		do
			initialize_attributes

		    -- attach output handler log
			ui.on_change.attach (agent output.log_command)

		    -- create an input parser and attach Error output handler
			create input.make_without_running(cmds, ui)
			input.on_Error.attach (agent output.log_Error)

			-- parse and validate input
			input.parse_and_validate_input_string
			if not input.etf_Error then
				if is_init then
					output.log_model_state
				end
				ui.run_input_commands
			else
				Error := input.etf_Error
			end
		end

	execute_without_log(cmds : STRING)
			-- Parse input string `cmds' as a list of commands
			-- If no input Errors,
			-- 		then execute commands without writing to a log
			-- If Errors,
			-- 		then report Errors to 'output'
		do
			initialize_attributes

		    -- attach output handler log
			ui.on_change.attach (agent output.log_empty)

		    -- create an input parser and attach Error output handler
			create input.make_without_running(cmds, ui)
			input.on_Error.attach (agent output.log_Error)

			-- parse and validate input
			input.parse_and_validate_input_string
			if not input.etf_Error then
				ui.run_input_commands
			else
				Error := input.etf_Error
			end
		end
end







