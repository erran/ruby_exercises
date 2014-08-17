module GeoJSON
  module Geometry
    class Point
      def self.from_json(json)
        attributes = JSON.parse(json)
        coordinates = attributes['coordinates']
        # TODO: fail if there are more than one pair of coordinates

        new(*coordinates.values_at(0, 1))
      end

      def initialize(x, y)
        self.coordinates = x, y
      end

      def coordinates
        [@x, @y]
      end

      def coordinates=(x, y)
        @x, @y = x, y
      end

      def to_geojson
        {
          coordinates: coordinates,
          type: 'Point'
        }.to_json
      end

      alias_method :to_json, :to_geojson
    end
  end
end
