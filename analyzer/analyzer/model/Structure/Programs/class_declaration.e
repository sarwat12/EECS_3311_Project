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
	make(n: STRING)
		do
			create children.make
			name := n
			num_queries := 0
			num_commands := 0
			num_attributes := 0
		end

feature--Class attributes
	name: STRING
	num_queries: INTEGER
	num_commands: INTEGER
	num_attributes: INTEGER

feature

	increase_queries
		do
			num_queries := num_queries + 1
		end

	increase_commands
		do
			num_commands := num_commands + 1
		end

	increase_attributes
		do
			num_attributes := num_attributes + 1
		end

	class_status: STRING
		do
			create Result.make_empty
			Result.append("%N      Number of attributes: " + num_attributes.out)
			across children as c loop
				if attached {ATTRIBUTE_DECLARATION} c.item then
					check attached {ATTRIBUTE_DECLARATION} c.item as attr then
						Result.append(attr.attribute_status)
					end
				end
			end
			Result.append("%N      Number of queries: " + num_queries.out)
			across children as c loop
				if attached {QUERY} c.item then
					check attached {QUERY} c.item as query then
						Result.append(query.query_status)
					end
				end
			end
			Result.append("%N      Number of commands: " + num_commands.out)
			across children as c loop
				if attached {COMMAND} c.item then
					check attached {COMMAND} c.item as command then
						Result.append(command.command_status)
					end
				end
			end
		end
end
