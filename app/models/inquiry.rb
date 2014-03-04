class Inquiry < ActiveRecord::Base


	#validates_presence_of :answer, message: ': Please make a choice'
	validates_inclusion_of  :answer, :in => ['yes', 'no', 'abstention'] 	
	#validates_uniqueness_of :question_id, :scope => [:session_id], message: 'has already been answered'


	def self.get_values(active_question_id)
		# active_question_id = Question.active.first.id
		tot = Inquiry.where("question_id = ?", active_question_id).count
		t = Inquiry.where("answer = 'yes'").where("question_id = ?", active_question_id).count
		f = Inquiry.where("answer = 'no'").where("question_id = ?", active_question_id).count
		e = Inquiry.where("answer = 'abstention'").where("question_id = ?",  active_question_id).count
		v = Inquiry.where("answer is not NULL").where("question_id = ?",  active_question_id).count
		{ total: tot, t_answers: t, f_answers: f, e_answers: e, v_answers: v, 
			remarks: Inquiry.where("question_id = ?", active_question_id).collect {|r| r.remark} } # this is the return value : a hash ( including the remarks as array )
	end

	def self.exists?(session_id, active_question_id)
		if Inquiry.where("session_id = ? AND question_id = ?", session_id, active_question_id).exists?
			true
		else
			false
		end
	end



	# This defines a class method :
	# def self.method_name
	# end

	# This defines an instance method :
	# def method_name
	# end


	private
    # Use callbacks to share common setup or constraints between actions.


end
