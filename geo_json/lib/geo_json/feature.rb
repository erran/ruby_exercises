require 'json'

module GeoJSON
  class Feature
    attr_reader :geometry
    attr_reader :properties

    def self.from_json(json)
      result = JSON.parse(json)

      new(result)
    end

    def initialize(attributes)
      @properties, @type = attributes.values_at('properties', 'type')
      self.geometry = attributes.fetch('geometry')
    end

    def geometry=(geometry)
      @geometry =
        if GeoJSON::Geometry.constants.include?(geometry.class)
          geometry
        else
          GeoJSON::Geometry.from_json(geometry.to_json)
        end
    end

    def ==(other)
      geometry == other.geometry && properties == other.properties
    end
  end
end
