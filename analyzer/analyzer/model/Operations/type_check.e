note
	description: "Summary description for {TYPE_CHECK}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TYPE_CHECK

inherit
	VISITOR

feature
	visit_attribute_declaration(ad: ATTRIBUTE_DECLARATION)
		do
		end

	visit_class_declaration(cd: CLASS_DECLARATION)
		do
		end

	visit_command(c: COMMAND)
		do
		end

	visit_program(p: PROGRAM)
		do
		end

	visit_query(q: QUERY)
		do
		end

	visit_boolean_constant(bc: BOOLEAN_CONSTANT)
		do
		end

	visit_call_chain(cc: CALL_CHAIN)
		do
		end

	visit_integer_constant(ic: INTEGER_CONSTANT)
		do
		end

	visit_numerical_negation(nn: NUMERICAL_NEGATION)
		do
		end

	visit_logical_negation(lg: LOGICAL_NEGATION)
		do
		end

	visit_addition(a: ADDITION)
		do
		end

	visit_subtraction(s: SUBTRACTION)
		do
		end

	visit_conjunction(c: CONJUNCTION)
		do
		end

	visit_disjunction(d: DISJUNCTION)
		do
		end

	visit_equality(e: EQUALITY)
		do
		end

	visit_greater_than(gt: GREATER_THAN)
		do
		end

	visit_less_than(lt: LESS_THAN)
		do
		end

	visit_modulo(m: MODULO)
		do
		end

	visit_multiplication(m: MULTIPLICATION)
		do
		end

	visit_quotient(q: QUOTIENT)
		do
		end

end
