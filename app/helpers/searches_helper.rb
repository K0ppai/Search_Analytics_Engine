module SearchesHelper
  def search_valid?(input)
    words = input.strip.split(" ")

    if words.length >= 3
      words.each do |word|
        return false if word.length < 2
      end
      return true
    end
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
