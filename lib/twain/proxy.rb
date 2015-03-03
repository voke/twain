module Twain
  class Proxy < Liquid::Drop

    def initialize(proxy)
      @proxy = proxy
    end

    # TODO: Rewrite this!
    # maybe it's better to override invoke_drop/invokable?
    def before_method(name)
      @proxy.__attr(name)
    end

  end
end
