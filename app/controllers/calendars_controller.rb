class CalendarsController < ApplicationController

  # １週間のカレンダーと予定が表示されるページ
  def index
    get＿week
    @Plan = Plan.new
  end

  # 予定の保存
  def create
    # binding.pry
    Plan.create(plan_params)
    redirect_to action: :index
  end

  private

  def plan_params
    params.require(:plan).permit(:date, :plan)
  end

  def get＿week
    Wdays = ['(日)','(月)','(火)','(水)','(木)','(金)','(土)']

    # Dateオブジェクトは、日付を保持しています。下記のように`.today.day`とすると、今日の日付を取得できます。
    @todays_date = Date.today
    # 例)　今日が2月1日の場合・・・ Date.today.day => 1日

    @week_days = []

    Plans = Plan.where(date: @Todays_date..@Todays_date + 6)

    7.times do |x|
      today_plans = []
      Plan = plans.map do |plan|
        today_plans.push(plan.plan) if Plan.date == @todays_date + x
      end

      # require 'date'
      wday_num = Date.today.wday + x
      if wday_num >= 7  
        wday_num = wday_num -7
      end

      days = { :month => (@todays_date + x).month, :date => (@todays_date+x).day, :plans => today_plans, :wday => wdays[wday_num] }
                        # (Date.today + X).month      (Data.today + X).day   (Plans.today + X).plans

     
      

      @week_days.push(days)
    end

  end
end
