note
	description: "Singleton access to the default business model."
	author: "Jackie Wang"
	date: "$Date$"
	revision: "$Revision$"

expanded class
	ANALYZER_ACCESS

feature
	m: ANALYZER
		once
			create Result.make
		end

invariant
	m = m
end




