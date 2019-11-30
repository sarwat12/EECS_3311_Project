note
	description: "Summary description for {CONJUNCTION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CONJUNCTION

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
			v.visit_conjunction (Current)
		end

end
