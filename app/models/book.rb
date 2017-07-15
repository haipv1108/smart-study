class Book
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  field :title, type: String
  field :description, type: String
  field :author, type: String
  field :page_number, type: Integer
  field :private, type: Boolean, default: false

  belongs_to :user, inverse_of: :books
  belongs_to :category, inverse_of: :books
  has_many :comments, dependent: :destroy, inverse_of: :book

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 5 }
  validates :author, presence: true
  validates :page_number, presence: true
  validates :user_id, presence: true
  validates :category_id, presence: true

  has_mongoid_attached_file :image, styles: { medium: '200x300#', large: '400x600' }
  validates_attachment :image, presence: true,
                               content_type: { :content_type => /\Aimage\/.*\Z/ },
                               size: { in: 0..500.kilobytes }
  has_mongoid_attached_file :document
  validates_attachment :document, presence: true,
                                content_type: { :content_type => ["application/pdf", "application/x-pdf"] },
                                size: { in: 0..50000.kilobytes }

end
