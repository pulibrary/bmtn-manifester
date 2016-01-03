require 'json'
require 'securerandom'

module IIIF
  class IIIFResource
    attr_accessor :type, :label, :identifier, :metadata

    def context
      "http://iiif.io/api/presentation/2/context.json"
    end

    def metadata_add(label, value)
      metadata.push({ label: label, value: value })
    end
  end

  class Manifest < IIIFResource
    
    def initialize(label="unlabeled",
                   identifier=SecureRandom.uuid
                  )
      @label = label
      @type   = "sc:Manifest"
      @identifier = identifier
    end

    def id
      "http://localhost/iiif/#{identifier}/manifest"
    end

    def to_json
      hash = {}
      hash[:@context] = context
      hash[:@type]    = type
      hash[:@id]      = id
      hash[:label]    = label
      hash[:metadata] = metadata
      hash.to_json
    end


  end                           # class Manifest
end
