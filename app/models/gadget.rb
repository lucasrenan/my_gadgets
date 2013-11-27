class Gadget
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :description

  belongs_to :user

  validates_presence_of :name, :user

  scope :by_user_id, -> (user_id) { where(user_id: user_id) }
end
