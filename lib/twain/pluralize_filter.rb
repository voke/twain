module Twain
  module PluralizeFilter

    def pluralize(number, singular, plural="#{signular}s", include_number=true)
      output = number == 1 ? singular : plural
      output.insert(0, "#{number} ") if include_number
      output.to_s
    end

  end
end
