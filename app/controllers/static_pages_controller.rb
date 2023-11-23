class StaticPagesController < ApplicationController
  def about_me
    @pages = Page.where(title: "About Me Page")
  end

  def contact
    @pages = Page.where(title: "Contact Me Page")
  end
end
