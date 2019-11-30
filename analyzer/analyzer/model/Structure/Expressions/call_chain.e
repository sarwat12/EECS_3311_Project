note
	description: "Summary description for {CALL_CHAIN}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CALL_CHAIN

inherit
	EXPRESSION

create
	make

feature
	make
		do
			create strings.make_empty
		end

feature
	strings: ARRAY[STRING]

feature
	accept(v: VISITOR)
		do
			v.visit_call_chain (Current)
		end

end
