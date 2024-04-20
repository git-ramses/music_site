class ApplicationController < ActionController::Base
  def set_page_title(title)
    @page_title = title
  end
end
