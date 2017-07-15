class Category
  include Mongoid::Document
  field :name, type: String

  has_many :books, dependent: :destroy, inverse_of: :category

  validates :name, presence: true, length: { minimum: 3, maximum: 30 }
end
