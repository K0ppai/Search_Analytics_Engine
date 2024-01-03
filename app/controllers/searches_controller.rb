class SearchesController < ApplicationController
  def index
    @searches = Search.all.includes(:user).where(user_id: current_user.id).order(count: :desc)
    p @searches
  end
end
