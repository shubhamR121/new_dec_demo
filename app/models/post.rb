class Post < ApplicationRecord
	# attr_reader :name
	has_many :comments

	before_create :capitalize_name, if: -> { check_name && check_length }
	before_save :check_object
	def capitalize_name
	  self.name = self.name.capitalize
	end

	def check_name
		byebug
		self.name == "post 1"
	end

	def check_length
		byebug
		 self.name.split.count == 2
	end

	def check_object
		byebug
	end

	# def initialize(attributes={})
	# 	super
	# 	@name = attributes[:name]
	# end
end
