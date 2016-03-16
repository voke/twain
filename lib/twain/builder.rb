require 'ostruct'

module Twain
  class Builder

    def self.translations
      @translations ||= {}
    end

    def self.paragraphs
      @paragraphs ||= []
    end

    def self.write(options = {}, &block)
      paragraphs << Paragraph.new(block.call, options) # TODO: Pass whole block and call it later
    end

    def self.translate(key, *variations)
      translations[key] = variations
    end

    def self.build(subject)
      output = []
      paragraphs.each do |para|
        output << para.compile(subject)
      end
      output.join
    end

    def self.raw
      paragraphs.map(&:text).join
    end

    def self.tr(key)
      translations.fetch(key.to_sym).sample
    end

    def self.generate
      build(self)
    end

  end
end
