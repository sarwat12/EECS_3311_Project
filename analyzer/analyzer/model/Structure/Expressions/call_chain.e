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
	make(s: STRING)
		do
			create strings.make_empty
			strings.force (s, strings.count + 1)
		ensure
			incremented: strings.count = old strings.count + 1
		end

feature
	strings: ARRAY[STRING]

feature
	accept(v: VISITOR)
		do
			v.visit_call_chain (Current)
		end

	chain: STRING
		do
			create Result.make_empty
			across strings as s loop
				Result.append(s.item)
			end
		end

end
