note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_ADD_ASSIGNMENT_INSTRUCTION
inherit
	ETF_ADD_ASSIGNMENT_INSTRUCTION_INTERFACE
create
	make
feature -- command
	add_assignment_instruction(cn: STRING ; fn: STRING ; n: STRING)
		require else
			add_assignment_instruction_precond(cn, fn, n)
    	do
			-- perform some update on the model state
			if model.assignment_instruction = TRUE then
				model.set_status ("  Status: ERROR (An assignment instruction is currently being specified for routine "
				+ model.assignment.fn + " in class " + model.assignment.cn + ").")
			else
				model.add_assignment_instruction(cn, fn, n)
			end
			etf_cmd_container.on_change.notify ([Current])
    	end

end
