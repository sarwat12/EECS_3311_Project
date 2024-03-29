note
	description: "A facade class for easy manipulation of the business objects."
	author: "Jackie Wang"
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_MODEL_FACADE

create
	make

feature -- Queries
	model: ANALYZER

	Error: BOOLEAN

	status_message: STRING

	output_message: STRING

	history: LIST[STRING]
		-- Return the trace of events executed so far.

feature {NONE} -- Implementation
	sys: ETF_SOFTWARE_OPERATION
	input: ETF_INPUT_HANDLER
	output: ETF_GUI_OUTPUT_HANDLER
	ui: ETF_ABSTRACT_UI

feature -- Constructor
	make
			-- Initialize.
		local
			model_access: ANALYZER_ACCESS
		do
			model := model_access.m
			create sys.make
			create ui.make
	      	create input.make_without_running("dummy", ui)
	      	create output.make
	      	output.model.reset
			input.on_Error.attach (agent output.log_Error)

			create {LINKED_LIST[STRING]} history.make
			Error := FALSE
			create status_message.make_from_string (man_page)
			create output_message.make_empty
		end

	execute_cmd (cmd: STRING)
			-- Execute 'cmd'.
			-- Set 'Error_message' or 'output_message', but not both.
		do
			if cmd ~ "man" then
				Error := FALSE
				create status_message.make_from_string (man_page)
				create output_message.make_empty
			else
				create input.make_without_running(cmd, ui)
				input.on_Error.attach (agent output.log_Error)
				input.parse_and_validate_input_string
				if input.etf_Error then
					Error := TRUE
					create status_message.make_from_string (output.Error_message)
					status_message.prepend ("Command entered: " + cmd + "%N")
					-- 'output_message' is retained
				else
					history.extend (cmd)
					sys.execute_without_log (cmd)
					Error := FALSE
					create status_message.make_empty
					create output_message.make_from_string (output.model_state)
				end
			end
		end

	reset
		do
			make
		end

	man_page : STRING = "[
  type_check
  generate_java_code
  add_class(
      cn: CLASS_NAME = STRING
  )
  add_attribute(
      cn: CLASS_NAME = STRING ; 
      fn: FEATURE_NAME = STRING ; 
      ft: CLASS_NAME = STRING
  )
  add_command(
      cn: CLASS_NAME = STRING ; 
      fn: FEATURE_NAME = STRING ; 
      ps: ARRAY[TUPLE[pn: VAR_NAME = STRING; ft: CLASS_NAME = STRING]]
  )
  add_query(
      cn: CLASS_NAME = STRING ; 
      fn: FEATURE_NAME = STRING ; 
      ps: ARRAY[TUPLE[pn: VAR_NAME = STRING; pt: CLASS_NAME = STRING]] ; 
      rt: CLASS_NAME = STRING
  )
  add_assignment_instruction(
      cn: CLASS_NAME = STRING ; 
      fn: FEATURE_NAME = STRING ; 
      n: VAR_NAME = STRING
  )
  add_call_chain(
      chain: ARRAY[VAR_NAME = STRING]
  )
  bool_value(
      c: BOOLEAN
  )
  int_value(
      c: INTEGER_32
  )
  addition
  subtraction
  multiplication
  quotient
  modulo
  conjunction
  disjunction
  equals
  greater_than
  less_than
  numerical_negation
  logical_negation
]"

invariant
	err_msg_set:
		Error implies not status_message.is_empty
end
