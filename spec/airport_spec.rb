require 'airport'
require 'plane'
require 'weather_spec'
 
# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport and how that is impermented.
#
# If the airport is full then no planes can land
describe Airport do

  include_examples "the weather"
  let(:airport) { Airport.new }
  let(:plane) { double :plane }
  let(:full_airport) { Airport.new }
  let(:half_full_airport) { Airport.new }  

  before do 
 	fill_airport(full_airport)
  	(half_full_airport.capacity)/2.times { half_full_airport.land(double :plane) } 	 
  end

  context "self knowlage: " do 
  	it 'knows when its full' do 
  		expect(full_airport).to be_full
  	end
  	it 'knows when its not full' do 
  		expect(half_full_airport).not_to be_full
  	end
  end

  
  context 'taking off and landing' do

  	before { allow_any_instance_of(Airport).to receive(:stormy?).and_return( false) }

    it 'Can land a plane' do
    	expect(airport.land(plane)).not_to eq nil
    end

    it 'has the plane after landing' do 
    	airport.land(plane)
    	expect(airport).to have_plane(plane)
    end
    
    it 'will not land a plane if full' do 
    	expect(full_airport.land(plane)).to eq nil
    end

    it "does not have plane after failed landing attempt" do 
    	full_airport.land(plane)
    	expect(airport).not_to have_plane(plane)
    end


    it 'a plane can take off' do
    	airport.land(plane)
    	expect(airport.take_off(plane)).to eq plane
    end

    it 'a plane can not take off if not in airport' do
    	expect(airport.take_off(plane)).to eq nil
    end
    
    
    it 'does not have the plane after take off' do 
    	airport.take_off(plane)
    	expect(airport).not_to have_plane(plane)
    end
  end
    
    # Include a weather condition using a module.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
    # 
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport
    context 'weather conditions' do
      
      it 'a plane cannot take off when there is a storm brewing' do
      	airport.land(plane)
      	expect(airport).to receive(:stormy?) { true }
      	expect(airport.take_off(plane)).to be nil
      end
    
      it 'a plane cannot land in the middle of a storm' do
      	expect(airport).to receive(:stormy?) { true }
      	expect(airport.land(plane)).to be nil
      end

    end
  end
end
 
# When we create a new plane, it should have a "flying" status, thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status should become "flying"
describe Plane do
 
  let(:plane) { Plane.new }
  
  it 'has a flying status when created' do
  end
  
  it 'has a flying status when in the air' do
  end
  
  it 'can take off' do
  end
  
  it 'changes its status to flying after taking of' do
  end
end
 
# grand final
# Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have the right status "landed"
# Once all the planes are in the air again, check that they have the status of flying!

describe "The gand finale (last spec)" do
  	it 'all planes can land and all planes can take off' do
	end
end

def fill_airport(airport)
	  	airport.capacity.times do
 			allow(full_airport).to receive(:stormy?).and_return(false)
 			full_airport.land(double :plane) 
 	end
end

