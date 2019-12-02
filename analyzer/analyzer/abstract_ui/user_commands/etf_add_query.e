note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_ADD_QUERY
inherit
	ETF_ADD_QUERY_INTERFACE
create
	make
feature -- command
	add_query(cn: STRING ; fn: STRING ; ps: ARRAY[TUPLE[pn: STRING; pt: STRING]] ; rt: STRING)
		require else
			add_query_precond(cn, fn, ps, rt)
    	do
			-- perform some update on the model state
			if model.assignment_instruction = TRUE then
				model.set_status ("  Status: ERROR (An assignment instruction is currently being specified for routine "
				+ model.assignment.fn + " in class " + model.assignment.cn + ").")
			else
				model.add_query(cn, fn, ps, rt)
			end
			etf_cmd_container.on_change.notify ([Current])
    	end

end
