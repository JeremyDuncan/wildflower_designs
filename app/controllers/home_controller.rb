class HomeController < ApplicationController
  def index
    @main_page = Page.find_by(title: "Main Page")

  end
end
