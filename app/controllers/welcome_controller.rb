class WelcomeController < ApplicationController
  def index
    # flash[:notice] = "欢迎来到 跑者世界 ！"
  @collections=Collection.all
  end


end
