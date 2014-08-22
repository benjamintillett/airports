# When we create a new plane, it should have a "flying" status, thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status should become "flying"
describe Plane do
 
  let(:plane) { Plane.new }
  let(:landed_plane) { Plane.new.land! }

  it 'is flying when created' do
  	expect(plane).to be_flying
  end

  it 'is not landed when created' do 
  	expect(plane).not_to be_landed
  end
  
  it "can land" do 
  	expect(landed_plane).to be_landed
  end

  it "after landing in not flying" do 
  	expect(landed_plane).not_to be_flying
  end


  it 'has a flying status when in the air' do
  	expect(plane).to be_flying
  end
  
  it 'can take off' do
  	landed_plane.take_off!
  	expect(landed_plane).to be_flying
  end
  
  it 'changes its status to flying after taking of' do

  end
end