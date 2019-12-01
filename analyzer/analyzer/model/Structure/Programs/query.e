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
		do
			name := n
			parameters := ps
			return_type := rt
		end

feature
	name: STRING
	parameters: ARRAY[TUPLE[STRING, STRING]]
	return_type: STRING

feature
	query_status: STRING
		do
			create Result.make_empty
			Result.append("  + " + name + ": " + return_type + "%N")
		end

end
