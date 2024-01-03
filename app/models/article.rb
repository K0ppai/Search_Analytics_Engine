class Article < ApplicationRecord
  include PgSearch::Model
  belongs_to :user

  pg_search_scope :search,
                  against: { title: "A", content: "C" },
                  using: {
                    tsearch: { prefix: true },
                  }
end
