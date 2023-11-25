# app/controllers/comments_controller.rb
class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = @prototype.comments.create(comment_params.merge(user: current_user))
    respond_to do |format|
      format.html { redirect_to @prototype }
      format.js
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
