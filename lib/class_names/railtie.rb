require 'class_names/view_helper'

module ClassNames
  class Railtie < Rails::Railtie
    initializer "class_names.view_helper" do
      ActionView::Base.send :include, ViewHelper
    end
  end
end
