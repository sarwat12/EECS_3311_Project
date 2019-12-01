note
	description: "Summary description for {COMMAND}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	COMMAND

inherit
	ROUTINE_DECLARATION

create
	make

feature
	make(n: STRING; p: ARRAY[TUPLE[name: STRING; type: STRING]])
		do
			name := n
			create paramaters.make_from_array (p)
		end

feature
	name: STRING
	paramaters: ARRAY[TUPLE[STRING, STRING]]

feature
	command_status: STRING
		do
			create Result.make_empty
			Result.append("  + " + name + "%N")
		end

end
