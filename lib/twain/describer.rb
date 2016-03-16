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

    def compile(text)
      template = Liquid::Template.parse(text)
      template.render(Proxy.new(self))
    end

    def render(text)
      compile(text).gsub("\n",'').squeeze(" ").strip
    end

  end
end
