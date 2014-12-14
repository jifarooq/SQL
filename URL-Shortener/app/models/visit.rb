class Visit < ActiveRecord::Base
  validates :user_id, presence: true
  validates :short_url_id, presence: true
  
  belongs_to(
    :user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )
  
  belongs_to(
    :shortened_url,
    class_name: "ShortenedUrl",
    foreign_key: :short_url_id,
    primary_key: :id
  )
  
  def self.record_visit!(user, short_url)
    Visit.create!(user_id: user.id, short_url_id: short_url.id)
  end

end
