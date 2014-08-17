require_relative './spec_helper'

describe GeoJSON::Feature do
  describe '.from_json' do
    let(:geometry_json) do
      {
        type: 'Point',
        coordinates: [123.4, 45.6]
      }.to_json
    end

    let(:feature_json) do
      {
        type: 'Feature',
        geometry: geometry_json,
        properties: {
          name: 'Example Feature'
        }
      }.to_json
    end

    it 'serializes a GeoJSON::Feature from a GeoJSON string' do
      feature = GeoJSON::Feature.from_json(feature_json)
      expect(feature.geometry).to eq(geometry_json)
      expect(feature.properties).to include('name')
      expect(feature.properties['name']).to eq('Example Feature')
    end
  end
end
