require "class_names/helper"

module ClassNames
  module ViewHelper
    def class_names(*args)
      ::ClassNames::Helper.new(*args).to_s
    end
  end
end
