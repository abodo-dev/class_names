require "class_names/helper"

module ClassNames
  module ViewHelpers
    def class_names(*args)
      puts "testsetestsetset"
      ::ClassNames::Helper.new(*args).to_s
    end
  end
end
