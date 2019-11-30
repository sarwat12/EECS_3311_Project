note
	description: "Summary description for {LESS_THAN}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	LESS_THAN

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
			v.visit_less_than (Current)
		end

end
