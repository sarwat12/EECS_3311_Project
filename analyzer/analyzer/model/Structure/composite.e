note
	description: "Summary description for {COMPOSITE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	COMPOSITE[G]

feature --Atrributes
	children: LINKED_LIST[G]

feature --Commands
	add_child(new_child: G)
		do
			children.extend(new_child)
		end

end
