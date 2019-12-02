note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_ADD_COMMAND
inherit
	ETF_ADD_COMMAND_INTERFACE
create
	make
feature -- command
	add_command(cn: STRING ; fn: STRING ; ps: ARRAY[TUPLE[pn: STRING; ft: STRING]])
		require else
			add_command_precond(cn, fn, ps)
    	do
			-- perform some update on the model state
			if model.assignment_instruction = TRUE then
				model.set_status ("  Status: ERROR (An assignment instruction is currently being specified for routine "
				+ model.assignment.fn + " in class " + model.assignment.cn + ").")
			else
				model.add_command(cn, fn, ps)
			end
			etf_cmd_container.on_change.notify ([Current])
    	end

end
