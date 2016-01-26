class HomeController < ApplicationController
  def index
    if user_signed_in?
      if current_user.libraries.empty?
        redirect_to new_library_url
      else
        redirect_to libraries_url
      end
    end
  end
end
