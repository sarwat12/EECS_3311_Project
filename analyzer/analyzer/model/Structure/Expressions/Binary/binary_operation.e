note
	description: "Summary description for {BINARY_OPERATION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	BINARY_OPERATION

inherit
	EXPRESSION
	COMPOSITE[EXPRESSION]

feature
	left_child: EXPRESSION
		do
			Result := children.at(children.lower)
		end

	right_child: EXPRESSION
		do
			Result := children.at(children.lower + 1)
		end

end
