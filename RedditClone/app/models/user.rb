class User < ActiveRecord::Base
  validates :email, :session_token, uniqueness:true, presence:true
  validates :password_digest, presence: true
  validates :password, length:{minimum: 6, allow_nil: true}

  attr_reader :password

  has_many :posts,
    foreign_key: :author_id,
    primary_key: :id,
    class_name: "Post"

    has_many :subs,
      foreign_key: :moderator_id,
      primary_key: :id,
      class_name: "Sub"

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)

  end

  after_initialize :ensure_session_token

  def ensure_session_token
    self.session_token = SecureRandom.urlsafe_base64
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(email, password)
    poss_user = User.find_by_email(email)
    return nil if poss_user.nil?
    poss_user.is_password?(password) ? poss_user : nil
  end
end
