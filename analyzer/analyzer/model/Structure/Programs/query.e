note
	description: "Summary description for {QUERY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	QUERY

inherit
	ROUTINE_DECLARATION

create
	make

feature
	make(n: STRING; ps: ARRAY[TUPLE[pn: STRING; ft: STRING]]; rt: STRING)
		local
			expr: EXPRESSION
		do
			name := n
			parameters := ps
			return_type := rt
		ensure
			non_empty_return: not return_type.is_empty
		end

feature
	parameters: ARRAY[TUPLE[STRING, STRING]]
	return_type: STRING

feature
	query_status: STRING
		do
			create Result.make_empty
			Result.append("%N        + " + name + ": " + return_type)
		end

end
