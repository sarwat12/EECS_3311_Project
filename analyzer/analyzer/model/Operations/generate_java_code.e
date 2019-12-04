note
	description: "Summary description for {GENERATE_JAVA_CODE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GENERATE_JAVA_CODE

inherit
	VISITOR

feature
	visit_attribute_declaration(ad: ATTRIBUTE_DECLARATION)
		require else
			attribute_has_name: not ad.name.is_empty
		do

		ensure then
			name_unchanged: ad.name ~ (old ad.name.deep_twin)
		end

	visit_class_declaration(cd: CLASS_DECLARATION)
		require else
			class_has_name: not cd.name.is_empty
		do

		ensure then
			children_unchanged: cd.children ~ (old cd.children.deep_twin)
		end

	visit_command(c: COMMAND)
		require else
			command_has_name: not c.name.is_empty
		do

		ensure then
			name_unchanged: c.name ~ (old c.name.deep_twin)
		end

	visit_program(p: PROGRAM)
		do

		ensure then
			children_unchanged: p.children ~ (old p.children.deep_twin)
		end

	visit_query(q: QUERY)
		require else
			query_has_name: not q.name.is_empty
		do

		ensure then
			name_unchanged: q.name ~ (old q.name.deep_twin)
		end

	visit_boolean_constant(bc: BOOLEAN_CONSTANT)
		require else
			is_boolean: bc.value = TRUE or bc.value = FALSE
		do

		ensure then
			value_unchanged: bc.value ~ (old bc.value)
		end

	visit_call_chain(cc: CALL_CHAIN)
		require else
			has_children: not cc.strings.is_empty
		do

		ensure then
			chain_unchanged: cc.strings ~ (old cc.strings.deep_twin)
		end

	visit_integer_constant(ic: INTEGER_CONSTANT)
		require else
			is_not_zero: ic.value > 0
		do

		ensure then
			value_unchanged: ic.value ~ (old ic.value)
		end

	visit_numerical_negation(nn: NUMERICAL_NEGATION)
		require else
			one_child: nn.children.count = 1
		do

		ensure then
			children_unchanged: nn.children ~ (old nn.children.deep_twin)
		end

	visit_logical_negation(lg: LOGICAL_NEGATION)
		require else
			one_child: lg.children.count = 1
		do

		ensure then
			children_unchanged: lg.children ~ (old lg.children.deep_twin)
		end

	visit_addition(a: ADDITION)
		require else
			has_children: not a.children.is_empty
		do

		ensure then
			children_unchanged: a.children ~ (old a.children.deep_twin)
		end

	visit_subtraction(s: SUBTRACTION)
		require else
			has_children: not s.children.is_empty
		do

		ensure then
			children_unchanged: s.children ~ (old s.children.deep_twin)
		end

	visit_conjunction(c: CONJUNCTION)
		require else
			has_children: not c.children.is_empty
		do

		ensure then
			children_unchanged: c.children ~ (old c.children.deep_twin)
		end

	visit_disjunction(d: DISJUNCTION)
		require else
			has_children: not d.children.is_empty
		do

		ensure then
			children_unchanged: d.children ~ (old d.children.deep_twin)
		end

	visit_equality(e: EQUALITY)
		require else
			has_children: not e.children.is_empty
		do

		ensure then
			children_unchanged: e.children ~ (old e.children.deep_twin)
		end

	visit_greater_than(gt: GREATER_THAN)
		require else
			has_children: not gt.children.is_empty
		do

		ensure then
			children_unchanged: gt.children ~ (old gt.children.deep_twin)
		end

	visit_less_than(lt: LESS_THAN)
		require else
			has_children: not lt.children.is_empty
		do

		ensure then
			children_unchanged: lt.children ~ (old lt.children.deep_twin)
		end

	visit_modulo(m: MODULO)
		require else
			has_children: not m.children.is_empty
		do

		ensure then
			children_unchanged: m.children ~ (old m.children.deep_twin)
		end

	visit_multiplication(m: MULTIPLICATION)
		require else
			has_children: not m.children.is_empty
		do

		ensure then
			children_unchanged: m.children ~ (old m.children.deep_twin)
		end

	visit_quotient(q: QUOTIENT)
		require else
			has_children: not q.children.is_empty
		do

		ensure then
			children_unchanged: q.children ~ (old q.children.deep_twin)
		end

end
