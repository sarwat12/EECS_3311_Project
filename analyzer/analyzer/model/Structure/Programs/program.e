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
			num_classes := 0
		end

feature
	num_classes: INTEGER

feature
	add_class(name:STRING)
		do
			add_child (create {CLASS_DECLARATION}.make (name))
			num_classes := num_classes + 1
		end

	add_attribute(cn: STRING ; fn: STRING ; ft: STRING)
		do
			across children as class_name loop
				if class_name.item.name ~ cn then
					class_name.item.add_child (create {ATTRIBUTE_DECLARATION}.make (fn, ft))
					class_name.item.increase_attributes
				end
			end
		end

	add_command(cn: STRING ; fn: STRING ; ps: ARRAY[TUPLE[pn: STRING; ft: STRING]])
		do
			across children as class_name loop
				if class_name.item.name ~ cn then
					class_name.item.add_child (create {COMMAND}.make (fn, ps))
					class_name.item.increase_commands
				end
			end
		end

	add_query(cn: STRING ; fn: STRING ; ps: ARRAY[TUPLE[pn: STRING; pt: STRING]] ; rt: STRING)
		do
			across children as class_name loop
				if class_name.item.name ~ cn then
					class_name.item.add_child (create {QUERY}.make (fn, ps, rt))
					class_name.item.increase_queries
				end
			end
		end

	program_status: STRING
		do
			create Result.make_empty
			Result.append ("  Number of classes being specified: " + num_classes.out + "%N")
			across children as c loop
				Result.append("    " + c.item.name + "%N")
				Result.append (c.item.class_status)
			end
		end

end
