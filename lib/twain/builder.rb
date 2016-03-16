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

    def self.placeholders
      raw.scan(/\{\{(\w+)\}\}/).flatten
    end

    def self.params
      raw.scan(/\*\*(\w+)\*\*/).flatten
    end

    def self.conflicts
      params & placeholders
    end

    def self.assert_valid!
      raise "Conflicts: #{conflicts.join(', ')}" unless valid?
    end

    def self.valid?
      conflicts.empty?
    end

    def self.generate_params
      assert_valid!
      hash = {}
      translations.keys.each do |key|
        hash[key] = tr(key)
      end
      hash
    end

    def self.generate_template
      assert_valid!
      raw.gsub(/\*\*(\w*)\*\*/) { |match| "{{#{match[2..-3]}}}" }
    end

    def self.generate
      build(self)
    end

  end
end
