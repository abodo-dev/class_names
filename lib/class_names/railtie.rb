require 'view_helper'

module ClassNames
  class Railtie < Rails::Railtie
    initializer "css_class_string.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end