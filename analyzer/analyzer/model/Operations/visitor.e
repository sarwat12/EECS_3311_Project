note
	description: "Summary description for {VISITOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	VISITOR

feature
	visit_attribute_declaration(ad: ATTRIBUTE_DECLARATION)
		deferred
		end

	visit_class_declaration(cd: CLASS_DECLARATION)
		deferred
		end

	visit_command(c: COMMAND)
		deferred
		end

	visit_program(p: PROGRAM)
		deferred
		end

	visit_query(q: QUERY)
		deferred
		end

	visit_boolean_constant(bc: BOOLEAN_CONSTANT)
		deferred
		end

	visit_call_chain(cc: CALL_CHAIN)
		deferred
		end

	visit_integer_constant(ic: INTEGER_CONSTANT)
		deferred
		end

	visit_numerical_negation(nn: NUMERICAL_NEGATION)
		deferred
		end

	visit_logical_negation(lg: LOGICAL_NEGATION)
		deferred
		end

	visit_addition(a: ADDITION)
		deferred
		end

	visit_subtraction(s: SUBTRACTION)
		deferred
		end

	visit_conjunction(c: CONJUNCTION)
		deferred
		end

	visit_disjunction(d: DISJUNCTION)
		deferred
		end

	visit_equality(e: EQUALITY)
		deferred
		end

	visit_greater_than(gt: GREATER_THAN)
		deferred
		end

	visit_less_than(lt: LESS_THAN)
		deferred
		end

	visit_modulo(m: MODULO)
		deferred
		end

	visit_multiplication(m: MULTIPLICATION)
		deferred
		end

	visit_quotient(q: QUOTIENT)
		deferred
		end

end
