note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_BOOL_VALUE
inherit
	ETF_BOOL_VALUE_INTERFACE
create
	make
feature -- command
	bool_value(c: BOOLEAN)
    	do
			-- perform some update on the model state
			if model.assignment_instruction = FALSE then
				model.set_status ("  Status: Error (An assignment instruction is not currently being specified).")
			else
				model.bool_value (c)
			end
			etf_cmd_container.on_change.notify ([Current])
    	end

end
