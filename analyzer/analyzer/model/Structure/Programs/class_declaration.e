note
	description: "Summary description for {CLASS_DECLARATION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CLASS_DECLARATION

inherit
	COMPOSITE[FEATURE_DECLARATION]

create
	make

feature
	make
		do
			create children.make
		end

end
