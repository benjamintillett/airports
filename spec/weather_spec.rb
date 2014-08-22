require 'weather'



shared_examples "the weather" do 

	let(:weather_holder) { described_class.new }
	
	it 'knows the weather' do 
		expect([:sunny,:stormy]).to include(weather_holder.weather)
	end

	it 'the weather changes' do
		weather_array = []
		100.times { weather_array << weather_holder.weather } 
		expect(weather_array.uniq.length).to eq 2
	end 
	
	it "knows if its stormy" do 
		allow(weather_holder).to receive(:weather).and_return(:stormy)
		expect(weather_holder).to be_stormy
	end

end