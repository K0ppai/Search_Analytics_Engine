module SearchesHelper
  def search_valid?(input)
    words = input.strip.split

    return false unless words.length >= 3

    words[-1].length > 2 && words[0].length >= 2
  end

  def update_or_create_search(query, user)
    existing_search = Search.find_by(query: query.strip, user_id: user.id)

    if existing_search
      existing_search.update(count: existing_search.count + 1)
    else
      Search.create(query:, user:)
    end
  end
end
