class Gadget
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Search

  field :name
  field :description

  belongs_to :user
  embeds_many :photos, cascade_callbacks: true

  accepts_nested_attributes_for :photos, allow_destroy: true

  validates_presence_of :name, :user

  scope :by_user_id, -> (user_id) { where(user_id: user_id) }

  search_in :name
end
