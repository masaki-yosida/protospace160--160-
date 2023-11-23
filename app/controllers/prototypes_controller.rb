class PrototypesController < ApplicationController
  def index
    @prototypes = Prototype.all
  end

  def show
    @prototype = Prototype.find(params[:id])

  def new
    @prototype = Prototype.new
  end

  
  def create
    @prototype = Prototype.new(prototype_params)
    # ...
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)

  end

end
