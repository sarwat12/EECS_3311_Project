note
	description: "Summary description for {QUOTIENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	QUOTIENT

inherit
	BINARY_OPERATION

create
	make

feature
	make(l: EXPRESSION; r: EXPRESSION)
		do
			create children.make
			add_child (l)
			add_child (r)
		end

	feature
	accept(v: VISITOR)
		do
			v.visit_quotient (Current)
		end

end
