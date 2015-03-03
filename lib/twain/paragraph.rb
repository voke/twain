module Twain
  class Paragraph

    attr_accessor :text, :subject

    def initialize(text, subject)
      self.text = text
      self.subject = text
    end

    def compile(subject)
      text.gsub(/\*\*(\w*)\*\*/) { |match| subject.tr(match[2..-3]) }
    end

  end
end
