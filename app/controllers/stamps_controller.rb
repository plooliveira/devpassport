class StampsController < ApplicationController
  before_action :set_stamp, only: [:payment, :show, :check_payment, :start_test]
  skip_before_action :verify_authenticity_token, only: [:check_payment]

  def create
    @stamp = Stamp.new
    authorize @stamp

    @stamp.user_id = params["user"]
    @stamp.test_id = params["test"]
    @stamp.status = 0
    @stamp.save

    redirect_to payment_path(@stamp)
  end

  def payment
  end

  def check_payment
    @stamp.status = 1
    redirect_to stamp_path(@stamp)
  end

  def show
  end

  def start_test
    @stamp.status = 2
    @stamp.save
    redirect_to stamp_path
  end

  private

  def set_stamp
    @stamp = Stamp.find(params[:id])
    authorize @stamp
  end
end
