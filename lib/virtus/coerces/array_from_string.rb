module Virtus
	module Coerces
		class ArrayFromString < Virtus::Attribute
			def coerce(value)
				value.to_s.split(" ").map(&:strip)
			end
		end
	end
end