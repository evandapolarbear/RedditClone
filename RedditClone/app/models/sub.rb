class Sub < ActiveRecord::Base
  validates :title, :description, uniqueness:true, presence:true
  validates :moderator_id, presence:true

  has_many :post_subs, :dependent => :destroy, inverse_of: :sub

  has_many :posts,
    through: :post_subs,
    source: :post

  belongs_to :moderator,
    foreign_key: :moderator_id,
    primary_key: :id,
    class_name: "User"

end
