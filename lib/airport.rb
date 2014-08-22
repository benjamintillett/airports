class Airport 

	DEFAULT_CAPACITY = 200

	def initialize
		@planes = []
		@capacity = capacity ||= DEFAULT_CAPACITY
	end
	def land(plane)
		@planes << plane
		true
	end
	def take_off(plane)
		@planes.delete(plane)
		true		
	end
	def has_plane?(plane)
		@planes.include?(plane)
	end
end