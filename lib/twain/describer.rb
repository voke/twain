require 'forwardable'

module Twain
  class Describer

    attr_reader :subject
    extend Forwardable

    def initialize(subject, view_template)
      @subject = subject
      @view_template = view_template
    end

    def __attr(name)
      if respond_to?(name)
        public_send(name)
      elsif subject.is_a?(Hash)
        subject[name.to_sym]
      else
        nil
      end
    end

    def t
      @view_template
    end

    def __output
      @__output ||= Liquid::Template.parse(text).render(Proxy.new(self))
    end

    def compile(text)
      __output.gsub("\n",'').squeeze(" ").strip # NOTE: Clean up
    end

  end
end
