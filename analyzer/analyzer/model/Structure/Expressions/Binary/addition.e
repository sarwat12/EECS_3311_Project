note
	description: "Summary description for {ADDITION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ADDITION

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
			v.visit_addition (Current)
		end

end
