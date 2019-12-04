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
		ensure
			child_incremented: children.count = (old children.count) + 1
		end

end
