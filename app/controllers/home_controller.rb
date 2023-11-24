class HomeController < ApplicationController
  def index
    # ===========================================================================
    # Fetches all pages with the title "Main Page"
    # --------------------------------------------------------------------------
    @pages = Page.where(title: "Main Page").where.not(hidden: true)

  end
end
