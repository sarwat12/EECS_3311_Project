note
	description: "Summary description for {BOOLEAN_CONSTANT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BOOLEAN_CONSTANT

inherit
	EXPRESSION

create
	make

feature
	make(v: BOOLEAN)
		do
			value := v
		end

feature
	value: BOOLEAN

feature
	accept(v: VISITOR)
		do
			v.visit_boolean_constant (Current)
		end

end
