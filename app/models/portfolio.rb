class Portfolio < ApplicationRecord
  include Placeholder

  validates_presence_of :title, :body, :main_image , :thumb_image 
  # custom scopes
  def self.angular
  	where(subtitle: 'Angular')
  end

  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }

  after_initialize :set_defaults
  
  # callback
  def set_defaults
  	# if not setup then setup otherwise leave
  	self.main_image ||= Placeholder.image_generator(height: 600,width: 400)
  	self.thumb_image ||= Placeholder.image_generator(height: 350,width: 200)

  end


end
