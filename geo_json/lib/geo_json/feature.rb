require 'json'

module GeoJSON
  class Feature
    attr_reader :properties

    def self.from_json(json)
      result = JSON.parse(json)

      new(result)
    end

    def initialize(attributes)
      @properties, @type = attributes.fetch('properties', 'type')
    end
  end
end
