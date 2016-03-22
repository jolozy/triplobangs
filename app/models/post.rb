class Post < ActiveRecord::Base
  has_many :activities
  belongs_to :user

  include PgSearch
  pg_search_scope :search_country, :against => [:country]

  validates :image, presence: true
  has_attached_file :image, styles: { :medium => "640x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def country_name
     c = ISO3166::Country[self.country]
     return c.translations[I18n.locale.to_s] || c.name
  end

end
