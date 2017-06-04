class AnswersController < ApplicationController
  def new
    # @collection=Collection.find[params:id]
    @answer=Answer.new

  end
end
