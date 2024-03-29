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
		ensure
			name_not_empty: not name.is_empty
		end

feature
	type: STRING

feature
	attribute_status: STRING
		do
			create Result.make_empty
			Result.append("%N        + " + name + ": " + type)
		end

end
