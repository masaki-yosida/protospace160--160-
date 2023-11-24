class PrototypesController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :destroy]

  def index
    @prototypes = Prototype.all
    logger.debug "Prototypes: #{@prototypes.inspect}"
  end

  def show
    @prototype = Prototype.find(params[:id])
  end

  def new
    @prototype = Prototype.new
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path, notice: 'プロトタイプが削除されました'
  end

  def create
    @prototype = current_user.prototypes.new(prototype_params)

    if @prototype.save
      redirect_to prototypes_path, notice: 'プロトタイプが正常に作成されました。'
    else
      render :new
    end
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in? && (params[:action] == 'new' || params[:action] == 'create' || params[:action] == 'edit' || params[:action] == 'update')
      redirect_to action: :index
    end
  end
end
