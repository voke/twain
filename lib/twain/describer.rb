require 'forwardable'

module Twain
  class Describer

    extend Forwardable

    attr_reader :subject

    def initialize(subject, template)
      @subject = subject
      @template = template
    end

    def self.render(subject, template)
      new(subject, template).compile
    end

    def t
      @template
    end

    def compile(text)
      text.gsub(/%\{(\w*)\}/) { |match| get_attribute(match[2..-2]) }
    end

    def get_attribute(attr_name)
      if subject.respond_to?(attr_name)
        subject.attr_name
      elsif subject.is_a?(Hash)
        subject[attr_name.to_sym]
      else
        public_send(attr_name)
      end
    end

  end
end
