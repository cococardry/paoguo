class AnswersController < ApplicationController
  def new
    # @collection=Collection.find[params:id]
    # @answer=Answer.new
    @collection=Collection.find(params[:collection_id])
    @questions=@collection.questions
    # byebug
  end
  def updateAnswer
    puts "start:"
    puts $i
    puts $content
    # byebug
    c=0
    for j in $i-3..$i-1
      @answer=Answer.find(j)
      @answer.update(answer_params)
      c+=1
    end
    # byebug
    # if @answer.save
    #   redirect_to root_path
    # else
    #   render :new
    # end
  end

  # private

  def answer_params
    byebug
    params.require(:answer).permit(:content, :question_id)
  end
end
