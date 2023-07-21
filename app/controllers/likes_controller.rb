class LikesController < ApplicationController
  before_action :set_diary

  def create
    like = current_user.likes.build(diary_id: params[:diary_id])
    like.save
    render 'create.js.erb'
  end

  def destroy
    like = Like.find_by(diary_id: params[:diary_id], user_id: current_user.id)
    like.destroy
    render 'destroy.js.erb'
  end

  def set_diary
    @diary = Diary.find(params[:diary_id])
  end
end