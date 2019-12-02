note
	description: "Output handler for bank triggered via an observer event"
	author: "JSO"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	ETF_OUTPUT_HANDLER_INTERFACE

feature {NONE} -- Initialization

	make
		-- Initialization for `Current'.
	do
		create output.make_empty
		create Error_message.make_empty
	end

feature -- queries

	output: STRING

	Error_message: STRING


feature -- Log to 'output'

	log_model_state
		deferred
		end

	log_empty (a_cmd: ETF_COMMAND)
		do
			output := output
		end

	log_command (a_cmd: ETF_COMMAND)
			-- Log the normal effect of 'a_cmd' to 'output'
		local
			l_command_name: STRING
		do
			l_command_name := "->" + a_cmd.out + "%N"
			if a_cmd.etf_cmd_message.count = 0 then
				output.append (l_command_name)
				-- 'output' may also be accumulated with the model state
			else
				output.append (l_command_name + "  Error: " + a_cmd.etf_cmd_message)
			end
		end

	log_Error (a_Error: STRING)
			-- Log 'a_Error' to 'Error_message'
		do
			Error_message := a_Error
		end
end







