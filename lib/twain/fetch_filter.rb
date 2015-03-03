module Twain
  module FetchFilter

    def fetch(key, hash = {})
      hash.fetch(key, hash['_default'])
    end

  end
end
