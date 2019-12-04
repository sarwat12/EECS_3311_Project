note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_ADD_CALL_CHAIN
inherit
	ETF_ADD_CALL_CHAIN_INTERFACE
create
	make
feature -- command
	add_call_chain(chain: ARRAY[STRING])
    	do
			-- perform some update on the model state
			if model.assignment_instruction = FALSE then
				model.set_status ("  Status: Error (An assignment instruction is not currently being specified).")
			else
				if chain.is_empty then
					model.set_status ("  Status: Error (Call chain is empty).")
					model.message.append ("%N  Routine currently being implemented: {" + model.assignment.cn + "}." + model.assignment.fn)
					model.message.append ("%N  Assignment being specified: " + model.assignment.vn + " := " + model.specified)
				else
					model.add_call_chain (chain)
				end
			end
			etf_cmd_container.on_change.notify ([Current])
    	end

end
