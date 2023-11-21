class StaticPagesController < ApplicationController
  def about_me
    @about_me_page = Page.find_by(title: "About Me")
  end

  def contact
  end
end
