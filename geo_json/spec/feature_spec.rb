require_relative './spec_helper'

describe GeoJSON::Feature do
  describe '.from_json' do
    let(:example_geometry) do
      { type: 'Point', coordinates: [125.6, 10.1] }
    end

    let(:example_feature) do
      { type: 'Feature', geometry: example_geometry, properties: { name: 'Dinagat Islands' } }
    end

    subject { GeoJSON::Feature.from_json(example_feature.to_json) }

    it 'serializes a GeoJSON::Feature from a GeoJSON string' do
      expect(subject.properties).to include('name')
      expect(subject.properties).to match('name' => 'Dinagat Islands')

      expected_geometry = GeoJSON::Geometry::Point.from_json(example_geometry.to_json)
      expect(subject.geometry).to eq(expected_geometry)
    end
  end
end
