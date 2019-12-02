note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_ADD_ATTRIBUTE
inherit
	ETF_ADD_ATTRIBUTE_INTERFACE
create
	make
feature -- command
	add_attribute(cn: STRING ; fn: STRING ; ft: STRING)
		require else
			add_attribute_precond(cn, fn, ft)
    	do
			-- perform some update on the model state
			if model.assignment_instruction = TRUE then
				model.set_status ("  Status: Error (An assignment instruction is currently being specified for routine "
				+ model.assignment.fn + " in class " + model.assignment.cn + ").")
				model.message.append ("%N  Routine currently being implemented: {" + model.assignment.cn + "}." + model.assignment.fn)
				model.message.append ("%N  Assignment being specified: " + model.assignment.vn + " := " + model.specified)
			else
				if not (across model.program.children as c some c.item.name ~ cn end) then
					model.set_status ("  Status: Error (" + cn + " is not an existing class name).")
				else
					if (across model.program.children as c all
						(c.item.name ~ cn) implies (across c.item.children as f some f.item.name ~ fn end) end) then
						model.set_status ("  Status: Error (" + fn + " is already an existing feature name in class " + cn + ").")
					else
						model.add_attribute(cn, fn, ft)
					end
				end
			end
			etf_cmd_container.on_change.notify ([Current])
    	end
end
