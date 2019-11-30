note
	description: "Summary description for {NUMERICAL_NEGATION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	NUMERICAL_NEGATION

inherit
	UNARY_OPERATION

create
	make

feature
	make(expr: EXPRESSION)
		do
			create negation.make_from_string ("-")
			expression := expr
		end

feature
	negation: STRING
	expression: EXPRESSION

feature
	accept(v: VISITOR)
		do
			v.visit_numerical_negation (Current)
		end

end
