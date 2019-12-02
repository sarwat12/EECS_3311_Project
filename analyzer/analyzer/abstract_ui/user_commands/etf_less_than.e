note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_LESS_THAN
inherit
	ETF_LESS_THAN_INTERFACE
create
	make
feature -- command
	less_than
    	do
			-- perform some update on the model state
			if model.assignment_instruction = FALSE then
				model.set_status ("  Status: Error (An assignment instruction is not currently being specified).")
			else
				model.less_than
			end
			etf_cmd_container.on_change.notify ([Current])
    	end

end
