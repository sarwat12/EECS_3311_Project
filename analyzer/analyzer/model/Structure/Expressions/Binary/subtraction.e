note
	description: "Summary description for {SUBTRACTION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SUBTRACTION

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
			v.visit_subtraction (Current)
		end

end
