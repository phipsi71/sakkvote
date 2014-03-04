class InquiriesController < ApplicationController
  before_action :set_inquiry, only: [:show, :edit, :update, :destroy]
  before_action :get_active_question
  before_action :authenticate
  #rescue_from ActiveRecord::RecordNotFound, with: :no_record_error


  # GET /inquiries
  # GET /inquiries.json
  def index
    @inquiries = Inquiry.all
  end

  # GET /inquiries/1
  # GET /inquiries/1.json
  def show

  end

  # GET /inquiries/new
  def new
    if Inquiry.exists?(session[:current_user_id], @question.id)
      redirect_to '/pages/show', alert: 'Question already answered. Please wait for the next question to be displayed'
    end
    redirect_to '/pages/show', alert: 'No active question' if @question.nil?
    @inquiry  = Inquiry.new
  end

  # GET /inquiries/1/edit
  def edit
  end

  # POST /inquiries
  # POST /inquiries.json
  def create
    @inquiry = Inquiry.new(inquiry_params)
#    if @inquiry.answer = ''
#      redirect_to inquiry_path(params[:id]), alert: 'Please choose Yes/No/Abstent.'
#    end

    @inquiry.session_id = session[:current_user_id]
    @inquiry.question_id = @question.id

    respond_to do |format|
      if @inquiry.save
        format.html { redirect_to pages_path, notice: 'Thanks for your vote.' }
        format.json { render action: 'show', status: :created, location: @inquiry }
      else
        format.html { render action: 'new' }
        format.json { render json: @inquiry.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PATCH/PUT /inquiries/1
  # PATCH/PUT /inquiries/1.json
  def update
    respond_to do |format|
      if @inquiry.update(inquiry_params)
        format.html { redirect_to @inquiry, notice: 'Inquiry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @inquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inquiries/1
  # DELETE /inquiries/1.json
  def destroy
    @inquiry.destroy
    respond_to do |format|
      format.html { redirect_to inquiries_url }
      format.json { head :no_content }
    end
  end


private
# Use callbacks to share common setup or constraints between actions.
  def set_inquiry
    @inquiry = Inquiry.find(params[:id])
  end

  def get_active_question
    @question = Question.active.first
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def inquiry_params
    params.require(:inquiry).permit(:answer, :remark)
  end

end
