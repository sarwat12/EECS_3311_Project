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
			status := FALSE
			create message.make_empty
			create program.make
		end

feature -- model attributes
	start: BOOLEAN
	status: BOOLEAN
	program: PROGRAM

feature -- model operations

	add_assignment_instruction(cn: STRING ; fn: STRING ; n: STRING)
		do

		end

	add_attribute(cn: STRING ; fn: STRING ; ft: STRING)
		do

		end

	add_call_chain(chain: ARRAY[STRING])
		do

		end

	add_class(cn: STRING)
		do

		end

	add_command(cn: STRING ; fn: STRING ; ps: ARRAY[TUPLE[pn: STRING; ft: STRING]])
		do

		end

	add_query(cn: STRING ; fn: STRING ; ps: ARRAY[TUPLE[pn: STRING; pt: STRING]] ; rt: STRING)
		do

		end

	bool_value(c: BOOLEAN)
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

	int_value(c: INTEGER_32)
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

feature --Extra helper features



feature --Error Reporting
	message: STRING

	set_message(msg: STRING)
		do
			message := msg
		end

feature -- queries
	out : STRING
		do
			create Result.make_empty

			if start = TRUE then
				Result.append("  Status: OK.%N")
				Result.append("  Number of classes being specified: 0")
				start := FALSE
			end

			if not message.is_empty then
				Result.append(message)
				create message.make_empty
			else

			end

		end

end




