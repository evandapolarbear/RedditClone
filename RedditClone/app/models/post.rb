class Post < ActiveRecord::Base
  validates :title, presence:true
  validates :author_id, presence:true

  has_many :post_subs, :dependent => :destroy, inverse_of: :post

  has_many :subs,
    through: :post_subs,
    source: :sub


  belongs_to :author,
    foreign_key: :author_id,
    primary_key: :id,
    class_name: "User"
end
