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
		local
			list: LINKED_LIST[STRING]
			b: BOOLEAN
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
						create list.make
						b := (across ps as p some (across model.program.children as c some
							c.item.name ~ p.item.pn or p.item.pn ~ "INTEGER" or p.item.pn ~ "BOOLEAN" end) end)
						if b then
							across ps as p loop
								across model.program.children as c loop
									if c.item.name ~ p.item.pn or p.item.pn ~ "INTEGER" or p.item.pn ~ "BOOLEAN" then
										list.extend (p.item.pn)
									end
								end
							end
							model.set_status ("")
						else
							model.add_command(cn, fn, ps)
						end
					end
				end
			end
			etf_cmd_container.on_change.notify ([Current])
    	end

end
