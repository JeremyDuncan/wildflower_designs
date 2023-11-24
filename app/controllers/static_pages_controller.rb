class StaticPagesController < ApplicationController
  def about_me
    @pages = Page.where(title: "About Me Page").where.not(hidden: true)
  end

  def contact
    @pages = Page.where(title: "Contact Me Page").where.not(hidden: true)
  end
end
