note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	ETF_LOGICAL_NEGATION_INTERFACE
inherit
	ETF_COMMAND
		redefine 
			make 
		end

feature {NONE} -- Initialization

	make(an_etf_cmd_name: STRING; etf_cmd_args: TUPLE; an_etf_cmd_container: ETF_ABSTRACT_UI_INTERFACE)
		do
			Precursor(an_etf_cmd_name,etf_cmd_args,an_etf_cmd_container)
			etf_cmd_routine := agent logical_negation
			etf_cmd_routine.set_operands (etf_cmd_args)
			if
				TRUE
			then
				out := "logical_negation"
			else
				etf_cmd_Error := True
			end
		end

feature -- command 
	logical_negation
    	deferred
    	end
end
