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
				model.set_status ("  Status: Error (An assignment instruction is currently being specified for routine "
				+ model.assignment.fn + " in class " + model.assignment.cn + ").")
				model.message.append ("%N  Routine currently being implemented: {" + model.assignment.cn + "}." + model.assignment.fn)
				model.message.append ("%N  Assignment being specified: " + model.assignment.vn + " := " + model.specified)
			else
				if not (across model.program.children as c some c.item.name ~ cn end) then
					model.set_status ("  Status: Error (" + cn + " is not an existing class name).")
				else
					across model.program.children as c loop
						if c.item.name ~ cn then
							if across c.item.children as f all f.item.name /~ fn end then
								model.set_status ("  Status: Error (" + fn + " is not an existing feature name in class " + cn + ").")
							else
								model.add_assignment_instruction(cn, fn, n)
							end
						end
					end

				end
			end
			etf_cmd_container.on_change.notify ([Current])
    	end

end
