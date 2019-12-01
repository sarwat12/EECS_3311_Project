note
	description: "Summary description for {UNARY_OPERATION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	UNARY_OPERATION

inherit
	EXPRESSION
	COMPOSITE[EXPRESSION]

feature
	expression: EXPRESSION
		do
			Result := children.at(children.lower)
		end

end
