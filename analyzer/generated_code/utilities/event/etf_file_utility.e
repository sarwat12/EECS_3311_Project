note
	description: "Reading and writing to files."
	author: "JSO"
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_FILE_UTILITY

create
	read_text_from

feature -- attributes

	Error: BOOLEAN

	Error_string: STRING

	items: LIST[STRING]
			-- file as a list of strings, separated by new lines

	item : STRING
			-- the entire file as a single string
			-- ASSUMPTION: input file does not change!
		do
			create Result.make_empty
			across items as line
			loop
				Result.append (line.item + "%N")
			end
		end

feature {NONE} -- creates
	read_text_from (a_path: STRING)
 			-- read file at `a_path'
 			-- Error is false if there are Errors reading the file
 			-- item is the text in the file if there are no Errors
 			-- Error_string is the Error condition
		local
			l_file: PLAIN_TEXT_FILE
			line: STRING
		do
			create {LINKED_LIST[STRING]} items.make
			create Error_string.make_empty
			create l_file.make_with_name (a_path)
				-- Perform checks until we can make
				-- a real attempt to open the file.
			if not l_file.exists then
				Error := true
				Error_string := "Error: '" + a_path + "' does not exist"
			else
				if not l_file.is_readable then
					Error := True
					Error_string := "Error: '" + a_path + "' is not readable"
				else
					from
						l_file.open_read
					until
						NOT l_file.readable
					loop
						l_file.read_line
						create line.make_from_string (l_file.last_string)
						items.extend (line)
					end
					l_file.close
				end
			end
		ensure
			Error implies items.count = 0 and Error_string.count > 0
			not Error implies Error_string.count = 0
		end

feature -- Commands
	remove_comment_lines
			-- Remove user comment lines, i.e., those starting with '--'.
			-- This is used to make the handling of the window mode accurate.
		local
			line: STRING
		do
			from
				items.start
			until
				items.after
			loop
				line := items.item.twin
				line.left_adjust
				if 		line.starts_with ("--")
					OR	line.is_whitespace
				then
					items.remove
				else
					items.forth
				end
			end
		end
end



