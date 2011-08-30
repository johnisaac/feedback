class AnswersController < ApplicationController
  respond_to :html, :json, :xml
  
  def new
    @answer = Answer.new
    respond_with(@answer)
  end

  def create
    @answer = Answer.new(params[:answer])
    if @answer.save
      respond_with(@answer)
    else
      render :new
    end
  end
  
  def edit
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update_attributes(params[:answer])
      respond_with(@answer)
    else
      render :edit
    end
  end
  
  def show
    @answer = Answer.find(params[:id])
    respond_with(@answer)
  end
  
  def index
    @answers = Answer.all
    respond_with(@answers)
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to answers_url
  end

end
