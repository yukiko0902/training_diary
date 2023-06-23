class DiariesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_diary, only: [:show, :edit, :update, :destroy]

  def index
    @diaries = Diary.all.order(created_at: :DESC)
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @diary = Diary.find(params[:id])
    @comment = Comment.new
    @comments = @diary.comments.includes(:user)
  end

  def edit
    if @diary.user_id == current_user.id
    else
      redirect_to root_path
    end
  end

  def update
    if @diary.update(diary_params)
      redirect_to diary_path(@diary)
    else
      render 'edit'
    end
  end

  def destroy
    if @diary.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def diary_params
    params.require(:diary).permit(:image, :day_date, :training_part1_id, :training_menu_1, :weight_1, :times_1,
                                             :training_part2_id, :training_menu_2, :weight_2, :times_2,
                                             :training_part3_id, :training_menu_3, :weight_3, :times_3,
                                             :training_part4_id, :training_menu_4, :weight_4, :times_4,
                                             :training_part5_id, :training_menu_5, :weight_5, :times_5, 
                                             :training_diary ).merge(user_id: current_user.id)
  end

  def set_diary
    @diary = Diary.find(params[:id])
  end
end
