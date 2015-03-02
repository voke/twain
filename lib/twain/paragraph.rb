module Twain
  class Paragraph

    attr_accessor :text, :options

    def initialize(text, options)
      self.text = text
      self.options = options
    end

    def complete?(subject)
      text.scan(/\{\{(\w*)\}\}/).all? do |match|
        subject.get(match.flatten.join) # TODO: Check for blank? not nil
      end
    end

    def compile(subject)
      output = text.gsub(/\{\{(\w*)\}\}/) { |match| subject.get(match[2..-3]) }
      output = output.gsub(/\*\*(\w*)\*\*/) { |match| subject.tr(match[2..-3]) }
      output
    end

  end
end
