require 'ostruct'

module Twain
  class Builder

    @@translations = {}
    @@paras = []

    attr_accessor :payload

    def initialize(payload)
      self.payload = payload.is_a?(Hash) ? OpenStruct.new(payload) : payload
    end

    def self.write(options = {}, &block)
      @@paras << Paragraph.new(block.call, options) # TODO: Pass whole block and call it later
    end

    def self.any_of(tag: nil, &block)
      set = ParagraphSet.new
      set.instance_eval(&block)
      @@paras << set
    end

    def self.translate(key, *variations)
      @@translations[key] = variations
    end

    def self.build(subject)
      output = []
      @@paras.each do |para|
        output << para.compile(subject)
      end
      output.join
    end

    def self.get_translation(key)
      if match = @@translations[key.to_sym]
        match.sample
      end
    end

    def get(key)
      respond_to?(key) ? public_send(key) : payload[key.to_sym]
    end

    def attr_value(key)
      payload[key.to_sym]
    end

    # NOTE: Look in translations hash and fallback to payload/subject
    def tr(key)
      self.class.get_translation(key) || self.class.get_translation(attr_value(key))
    end

    def generate
      self.class.build(self)
    end

  end
end
