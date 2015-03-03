require "twain/version"

require 'liquid'

require 'twain/pluralize_filter'
Liquid::Template.register_filter(Twain::PluralizeFilter)

require 'twain/fetch_filter'
Liquid::Template.register_filter(Twain::FetchFilter)

require 'twain/describer'
require 'twain/paragraph'
require 'twain/paragraph_set'
require 'twain/builder'
require 'twain/proxy'

module Twain
  # Your code goes here...
end

require_relative '._with_liquid.rb'
