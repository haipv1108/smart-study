class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content, type: String

  belongs_to :book, inverse_of: :comments
  belongs_to :user, inverse_of: :users

  validates :content, presence: true, length: { minimum: 5 }
  validates :user_id, presence: true
  validates :book_id, presence: true
end
