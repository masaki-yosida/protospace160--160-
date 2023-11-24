class PrototypesController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :destroy, :new, :create]


  def index
    @prototypes = Prototype.all
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
  
    # 追加: 現在のユーザーがプロトタイプの投稿者でない場合、トップページにリダイレクト
    unless user_signed_in? && @prototype.user == current_user
      redirect_to root_path, alert: '他のユーザーのプロトタイプは編集できません。'
    end
  end

  def update
    @prototype = Prototype.find(params[:id])

    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype), notice: 'プロトタイプが正常に更新されました。'
    else
      render :edit
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image)
  end

  def move_to_index
    unless user_signed_in? && (params[:action] == 'edit' || params[:action] == 'update' || params[:action] == 'new' || params[:action] == 'create')
      redirect_to action: :index
    end
  end
end
