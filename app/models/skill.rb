class Skill < ApplicationRecord
	validates_presenece_of :title, :percent_utilized		
end
