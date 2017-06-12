class QuestionsController < ApplicationController
  def index
    @questions=Question.all
  end
  def new
    @question=Question.new
  end

  def create
    @question=Question.new(question_params)
    if @question.save
      @collection=Collection.find(@question.collection_id)
      @question.join!(@collection)
      redirect_to questions_path
    else
      render :new
    end
  end

  def edit
    @question=Question.find(params[:id])
    @collections=Collection.all
  end

  def update
    @question=Question.find(params[:id])

    if @question.update(question_params)

      # redirect_to questions_path
      render :js => "alert('ok');"
    else
      render :edit
    end

  end
  def destroy
    @question=Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  def join

    @question=Question.find(params[:id])
    # byebug
    @collection=Collection.find(params[:collection_id])
    if !@question.is_member_of?(@collection)
    @question.join!(@collection)
    # flash[:notice] = "成功加入" + @collection.title
    end
    redirect_to edit_collection_path(@collection)
  end

  def quit

    @question=Question.find(params[:id])
    # byebug
    @collection=Collection.find(params[:collection_id])
    if @question.is_member_of?(@collection)
      @question.quit!(@collection)

    end
    redirect_to edit_collection_path(@collection)
  end

  def input
    @collection=Collection.find(params[:collection_id])
    @questions=@collection.questions

  end

  def update_temp
    @question=Question.first
    puts @question.temp_answer
  end




  private

  def question_params
    params.require(:question).permit(:content, :collection_id, :is_included, :temp_answer)
  end
end
