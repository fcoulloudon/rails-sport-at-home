class Equipment < ApplicationRecord
  belongs_to :user
  has_many :rents

  validates :title, presence: true
  # validates :title, uniqueness: { scope: :rents, message: "We accept only unique title" }

  validates :description, presence: true
  validates :description, length: { minimum: 20 }

  validates :daily_rate, presence: true
  validates :daily_rate, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0, less_than: 1000 }

  include PgSearch::Model

  pg_search_scope :search_by_title_and_description,
    against: [ :title, :description ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
