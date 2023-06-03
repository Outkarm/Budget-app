# frozen_string_literal: true

class TradeRecordsController < ApplicationController
  before_action :set_category

  def index
    @trade_records = TradeRecord.includes(:category).where(category_id: @category.id)
  end

  def new
    @trade_record = @category.trade_records.new
  end

  def create
    @user = current_user
    category_ids = trade_record_params[:category_ids]

    if category_ids.blank?
      redirect_to new_category_trade_record_path, notice: 'Please select at least one category.'
      return
    end

    category_ids.each do |category_id|
      @trade_record = TradeRecord.new(trade_record_params)
      @trade_record.author_id = @user.id
      @trade_record.category_id = category_id

      unless @trade_record.valid? && @trade_record.save
        puts @trade_record.errors.full_messages
        return render :new
      end
    end

    redirect_to category_trade_records_path(@category), notice: 'Trade Records created successfully.'
  end

  private

  def trade_record_params
    params.require(:trade_record).permit(:name, :amount, category_ids: [])
  end

  def set_category
    @category = Category.includes(:trade_records).find(params[:category_id])
  end
end
