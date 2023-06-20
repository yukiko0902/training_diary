class DiariesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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
end
