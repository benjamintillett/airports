module Weather
	def weather 
		[:sunny,:stormy].sample
	end
	def stormy?
		weather == :stormy
	end

end
