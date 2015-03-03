require "twain/version"

require 'liquid'

require 'twain/pluralize_filter'
Liquid::Template.register_filter(Twain::PluralizeFilter)

require 'twain/fetch_filter'
Liquid::Template.register_filter(Twain::FetchFilter)

require 'twain/pretty_join_filter'
Liquid::Template.register_filter(Twain::PrettyJoinFilter)

require 'twain/describer'
require 'twain/paragraph'
require 'twain/builder'
require 'twain/proxy'

module Twain
  # Your code goes here...
end
