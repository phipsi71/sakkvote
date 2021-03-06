class Question < ActiveRecord::Base
  has_many :inquiries, dependent: :destroy

	scope :active, -> {where("is_active = 't'")}

	validates_inclusion_of :is_active, :in => [true, false]


	# Class Method:
	def self.set_false
		Question.update_all({:is_active => false})
	end

	def self.nofAnswers(active_question_id)
		Inquiry.where("question_id = ?", active_question_id).count
	end



	# This defines a class method :
	# def self.method_name
	# end


	# This defines an instance method :
	# def method_name
	# end

end
