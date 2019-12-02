note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_ADD_CLASS
inherit
	ETF_ADD_CLASS_INTERFACE
create
	make
feature -- command
	add_class(cn: STRING)
		require else
			add_class_precond(cn)
    	do
			-- perform some update on the model state
			if model.assignment_instruction = TRUE then
				model.set_status ("  Status: ERROR (An assignment instruction is currently being specified for routine "
				+ model.assignment.fn + " in class " + model.assignment.cn + ").")
			else
				model.add_class(cn)
			end
			etf_cmd_container.on_change.notify ([Current])
    	end

end
