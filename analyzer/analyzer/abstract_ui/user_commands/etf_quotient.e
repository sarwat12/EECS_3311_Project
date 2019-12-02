note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_QUOTIENT
inherit
	ETF_QUOTIENT_INTERFACE
create
	make
feature -- command
	quotient
    	do
			-- perform some update on the model state
			if model.assignment_instruction = FALSE then
				model.set_status ("  Status: Error (An assignment instruction is not currently being specified).")
			else
				model.quotient
			end
			etf_cmd_container.on_change.notify ([Current])
    	end

end
