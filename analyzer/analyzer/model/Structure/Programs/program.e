note
	description: "Summary description for {PROGRAM}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PROGRAM

inherit
	COMPOSITE[CLASS_DECLARATION]

create
	make

feature
	make
		do
			create children.make
		end


end
