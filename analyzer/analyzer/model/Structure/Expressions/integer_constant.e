note
	description: "Summary description for {INTEGER_CONSTANT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	INTEGER_CONSTANT

inherit
	EXPRESSION

create
	make

feature
	make(v: INTEGER)
		do
			value := v
		end

feature
	value: INTEGER

feature
	accept(v: VISITOR)
		do
			v.visit_integer_constant (Current)
		end

end
