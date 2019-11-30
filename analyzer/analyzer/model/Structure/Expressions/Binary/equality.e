note
	description: "Summary description for {EQUALITY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	EQUALITY

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

	accept(v: VISITOR)
		do
			v.visit_equality (Current)
		end

end
