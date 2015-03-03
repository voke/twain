module Twain
  module PrettyJoinFilter
    
    def pjoin(array, trail)
      array.join(', ').sub(/(.*),/, '\1 '+trail)
    end

  end
end
