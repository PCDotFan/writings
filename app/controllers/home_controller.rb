class HomeController < ApplicationController
  layout 'home'
  before_filter :logined_redirect

  private

  def logined_redirect
    if logined?
      #binding.pry
      if space = current_user.spaces.order("created_at ASC").first
        redirect_to dashboard_root_path(space)
      else
        redirect_to new_space_path
      end
    end
  end
end
