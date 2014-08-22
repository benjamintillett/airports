class Plane
	
	def initialize
		@status = :flying
	end

	def flying?
		@status == :flying
	end

	def landed?
		@status == :landed
	end

	def land!
		@status = :landed
		self
	end

	def take_off!
		@status = :flying
		self
	end
end