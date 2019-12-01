note
	description: "Summary description for {LOGICAL_NEGATION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	LOGICAL_NEGATION

inherit
	UNARY_OPERATION

create
	make

feature
	make(expr: EXPRESSION)
		do
			create children.make
			create negation.make_from_string ("!")
			add_child(expr)
		end

feature
	negation: STRING

feature
	accept(v: VISITOR)
		do
			v.visit_logical_negation (Current)
		end

end
