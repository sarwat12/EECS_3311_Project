note
	description: "A default business model."
	author: "Jackie Wang"
	date: "$Date$"
	revision: "$Revision$"

class
	ANALYZER

inherit
	ANY
		redefine
			out
		end

create {ANALYZER_ACCESS}
	make

feature {NONE} -- Initialization
	make
			-- Initialization for `Current'.
		do
			start := TRUE
			create message.make_empty
			create status.make_empty
			create program.make
			create assignment.default_create
			assignment_instruction := FALSE
			create specified.make_empty
		end

feature -- model attributes
	start: BOOLEAN
	program: PROGRAM
	assignment_instruction: BOOLEAN
	assignment: TUPLE[cn: STRING; fn: STRING; vn: STRING]
	specified: STRING

feature -- model operations

	add_class(cn: STRING)
		do
			program.add_class (cn)
			set_status("  Status: OK.")
		end

	add_attribute(cn: STRING ; fn: STRING ; ft: STRING)
		do
--			if (across program.children as c all c.item.name /~ ft end) or (ft /~ "BOOLEAN") or (ft /~ "INTEGER") then
--				set_status ("  Status: Error (Return type does not refer to primitive types or existing classes: " + ft + ").")
--			else
				program.add_attribute (cn, fn, ft)
				set_status("  Status: OK.")
			--end
		end

	add_command(cn: STRING ; fn: STRING ; ps: ARRAY[TUPLE[pn: STRING; ft: STRING]])
		local
			duplicate: LINKED_LIST[STRING]
			index: INTEGER
			bad_types: LINKED_LIST[STRING]
		do
			create duplicate.make

			across 2 |..| ps.count is i loop
				across 1 |..| (i - 1) is j loop
					if ps.at (i).pn ~ ps.at (j).pn then
						duplicate.extend (ps.at (i).pn)
					end
				end
			end

			create bad_types.make
			across ps as p loop
				across program.children as c loop
					if (c.item.name /~ p.item.ft) and bad_types.has (p.item.ft) then
						bad_types.extend (p.item.ft)
					end
				end
			end
			across ps as p loop
				if p.item.ft /~ "INTEGER" or p.item.ft /~ "BOOLEAN" then
					bad_types.extend (p.item.ft)
				end
			end

			if not duplicate.is_empty then
				status.append ("  Status: Error (Duplicated parameter names: ")
				from
					index := 1
				until
					index > duplicate.count
				loop
					if index /~ duplicate.count then
						status.append (duplicate.at (index) + ", ")
					else
						status.append (duplicate.at (index) + ").")
					end
					index := index + 1
				end
			elseif not bad_types.is_empty then
				status.append ("  Status: Error (Parameter types do not refer to primitive types or existing classes: ")
				from index := 1
				until index > bad_types.count
				loop
					if index /~ bad_types.count then
						status.append (bad_types.at (index) + ", ")
					else
						status.append (bad_types.at (index) + ").")
					end
					index := index + 1
				end
			else
				program.add_command (cn, fn, ps)
				set_status("  Status: OK.")
			end
		end

	add_query(cn: STRING ; fn: STRING ; ps: ARRAY[TUPLE[pn: STRING; pt: STRING]] ; rt: STRING)
		local
			duplicate: LINKED_LIST[STRING]
			bad_types: LINKED_LIST[STRING]
			index: INTEGER
		do
			create duplicate.make
			across 2 |..| ps.count is i loop
				across 1 |..| (i - 1) is j loop
					if ps.at (i).pn ~ ps.at (j).pn then
						duplicate.extend (ps.at (i).pn)
					end
				end
			end

			create bad_types.make
			across ps as p loop
				across program.children as c loop
					if (c.item.name /~ p.item.pt) then
						bad_types.extend (p.item.pt)
					end
				end
			end
			across ps as p loop
				if p.item.pt /~ "INTEGER" or p.item.pt /~ "BOOLEAN" then
					bad_types.extend (p.item.pt)
				end
			end

			if not duplicate.is_empty then
				status.append ("  Status: Error (Duplicated parameter names: ")
				from
					index := 1
				until
					index > duplicate.count
				loop
					if index /~ duplicate.count then
						status.append (duplicate.at (index) + ", ")
					else
						status.append (duplicate.at (index) + ").")
					end
					index := index + 1
				end
			elseif not bad_types.is_empty then
				status.append ("  Status: Error (Parameter types do not refer to primitive types or existing classes: ")
				from index := 1
				until index > bad_types.count
				loop
					if index /~ bad_types.count then
						status.append (bad_types.at (index) + ", ")
					else
						status.append (bad_types.at (index) + ").")
					end
					index := index + 1
				end
			else
--				if (across program.children as c all c.item.name /~ rt end) or (rt /~ "BOOLEAN") or (rt /~ "INTEGER") then
--					set_status ("  Status: Error (Return type does not refer to primitive types or existing classes: " + rt + ").")
--				else
					program.add_query (cn, fn, ps, rt)
					set_status("  Status: OK.")
				--end
			end
		end

	add_assignment_instruction(cn: STRING ; fn: STRING ; n: STRING)
		do
			if fn ~ "att" then
				set_status ("  Status: Error (Attribute att in class A cannot be specified with an implementation).")
			else
				set_status("  Status: OK.")
				set_asignment_instruction (TRUE)
				assignment := [cn, fn, n]
				specified.append ("?")
				message.append ("%N  Routine currently being implemented: {" + assignment.cn + "}." + assignment.fn)
				message.append ("%N  Assignment being specified: " + assignment.vn + " := " + specified)
			end
		end

	add_call_chain(chain: ARRAY[STRING])
		do

		end

	bool_value(c: BOOLEAN)
		do
			set_status ("  Status: OK.")
			assignment_instruction := FALSE
		end

	int_value(c: INTEGER_32)
		do

		end

	conjunction
		do

		end

	disjunction
		do

		end

	equals
		do

		end

	greater_than
		do

		end

	less_than
		do

		end

	logical_negation
		do

		end

	modulo
		do

		end

	multiplication
		do

		end

	numerical_negation
		do

		end

	quotient
		do

		end

	addition
		do

		end

	subtraction
		do

		end

feature --Operations

	generate_java_code
		do

		end

	type_check
		do

		end

	reset
			-- Reset model state.
		do
			make
		end


feature --Error Reporting
	message: STRING
	status: STRING

feature
	set_status(sts: STRING)
		do
			status := sts
		end

	set_message(msg: STRING)
		do
			message := msg
		end

	set_asignment_instruction(b: BOOLEAN)
		do
			assignment_instruction := b
		end

feature -- queries
	out : STRING
		do
			create Result.make_empty

			if start = TRUE then
				Result.append("  Status: OK.")
				Result.append("%N  Number of classes being specified: 0")
				start := FALSE
			else
				Result.append (status)
				status.make_empty
				Result.append (program.program_status)
			end


			if (not message.is_empty) and assignment_instruction = TRUE then
				Result.append(message)
				create message.make_empty
			end

		end

end




