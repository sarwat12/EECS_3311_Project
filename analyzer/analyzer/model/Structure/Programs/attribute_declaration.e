note
	description: "Summary description for {ATTRIBUTE_DECLARATION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ATTRIBUTE_DECLARATION

inherit
	FEATURE_DECLARATION

create
	make

feature
	make(n: STRING; t: STRING)
		do
			name:= n
			type := t
		end

feature
	name: STRING
	type: STRING

feature
	attribute_status: STRING
		do
			create Result.make_empty
			Result.append("    + " + name + ": " + type + "%N")
		end

end
