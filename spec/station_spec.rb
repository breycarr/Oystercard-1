require 'station'

describe Station do
  let(:station) { Station.new(name, zone) }
  let(:name) { double(:name) }
  let(:zone) { double(:zone) }

  describe "creation" do
    it "creates a station" do
      expect(station).to be_an_instance_of(Station)
    end

    # it "accepts 2 arguments" do
    #   expect(Station).to receive(:new).with(name, zone)
    # end

    it "returns a station name" do
      expect(station.name).to eq(name)
    end

    it "returns a zone" do
      expect(station.zone).to eq(zone)
    end

  end
end
