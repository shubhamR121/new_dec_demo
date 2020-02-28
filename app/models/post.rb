class Post < ApplicationRecord
	# attr_reader :name
	has_many :comments
	accepts_nested_attributes_for :comments
	validates_presence_of :name

	before_create :capitalize_name, if: -> { check_name && check_length }
	before_save :check_object
	def capitalize_name
	  self.name = self.name.capitalize
	end

	def check_name
		print self.name
		self.name == "post 1"
	end

	def check_length
		# byebug
		print self.name.split.count
		self.name.split.count == 2
	end

	def check_object
		# byebug
	end

	# def initialize(attributes={})
	# 	super
	# 	@name = attributes[:name]
	# end
end
