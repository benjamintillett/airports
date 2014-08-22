require 'weather.rb'

class Airport 

	include Weather

	DEFAULT_CAPACITY = 200
	attr_accessor :capacity

	def initialize
		@planes = []
		@capacity = capacity ||= DEFAULT_CAPACITY
	end
	
	def land(plane)
		@planes << plane  if (!stormy? && !full?)
	end
	
	def take_off(plane)
		@planes.delete(plane) unless stormy?
	end
	
	def has_plane?(plane)
		@planes.include?(plane)
	end

	def full?
		@planes.count == @capacity
	end


end