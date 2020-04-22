class Portfolio < ApplicationRecord
	validates_presenece_of :title, :body, :main_image, :thumb_image
end
