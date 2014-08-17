require 'json'

module GeoJSON
  module Geometry
    module_function

    def from_json(json)
      attributes = JSON.parse(json)
      type = attributes.fetch('type')

      geometry_class = self.const_get(type)
      geometry_class.from_json(json)
    end
  end
end
