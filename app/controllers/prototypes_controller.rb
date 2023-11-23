class PrototypesController < ApplicationController
  def index
    @prototypes = Prototype.all
  end
  def show
    @prototype = Prototype.find(params[:id])
  end

end
