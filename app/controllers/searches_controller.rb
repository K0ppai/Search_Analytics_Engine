class SearchesController < ApplicationController
  include SearchesHelper

  def index
    @user_searches = current_user.searches.where(confirm: false)
    @searches = Search.all.includes(:user).where(user_id: current_user.id, confirm: true).order(count: :desc).limit(10)

    if @user_searches.present?
      queries = convert_queries_to_string(@user_searches)

      ids = filter_valid_queries_ids(queries)

      @user_searches.where(id: ids).update_all(confirm: true) if ids.any?
      @user_searches.where.not(id: ids).delete_all
    else
      @searches
    end
  end
end
