require 'ostruct'

module Twain
  class Builder

    @@translations = {}
    @@paras = []

    def self.write(options = {}, &block)
      @@paras << Paragraph.new(block.call, options) # TODO: Pass whole block and call it later
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
      @@translations.fetch(key.to_sym).sample
    end

    def get(key)
      respond_to?(key) ? public_send(key) : payload[key.to_sym]
    end

    def tr(key)
      self.class.get_translation(key)
    end

    def generate
      self.class.build(self)
    end

  end
end
