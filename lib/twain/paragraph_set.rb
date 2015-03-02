module Twain
  class ParagraphSet

    def initialize
      @arr = []
    end

    def write(options = {}, &block)
      @arr << Paragraph.new(block.call, options)
    end

    def compile(subject)
      if match = @arr.first { |para| para.complete?(subject) }
        match.compile(subject)
      end
    end

  end
end
