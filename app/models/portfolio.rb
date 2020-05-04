class Portfolio < ApplicationRecord
	include Placeholder
	validates_presence_of :title, :body, :main_image, :thumb_image
	has_many :technologies
	# accepts_nested_attributes_for :technologies, reject_if: lambda { |attrs| attrs['name'].blank? }
	accepts_nested_attributes_for :technologies,
																reject_if: lambda { |attrs| attrs['name'].blank? }

	mount_uploader :thumb_image, PortfolioUploader
	mount_uploader :main_image, PortfolioUploader

	def self.angular
		where(subtitle: 'Angular')
	end

	def self.by_position
		order("position ASC")
	end

	scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }

	after_initialize :set_defaults

	def set_defaults
		# self.main_image	||= "http://placehold.it/600x400"
		self.main_image	||= Placeholder.image_generator(height: '600', width: '400')
		# self.thumb_image ||= "http://placehold.it/350x200"
		self.thumb_image	||= Placeholder.image_generator(height: '350', width: '200')
	end
end
