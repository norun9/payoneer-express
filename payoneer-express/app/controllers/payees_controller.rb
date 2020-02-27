class PayeesController < ApplicationController
  before_action :set_payee, only: [:show, :edit, :update, :destroy, :pay,
    :confirm]

  def index
    @payees = Payee.all
  end

  def show
  end

  def new
    @payee = Payee.new
    @payee.balance = 20
  end

  def edit
  end

  def create
    @payee = Payee.new(payee_params)

    if @payee.save
      redirect_to @payee, notice: 'Payee was successfully created.'
    else
      render :new
    end
  end

  def update
    if @payee.update(payee_params)
      resirect_to @payee, notice: 'Payee was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @payee.destroy
    redirect_to payees_url, notice: 'Payee was successfully destroyed.'
  end

  def pay

  end

  private

  def set_payee
    @payee = Payee.find(params[:id])
  end

  def payee_params
    params.require(:payee).permit(:email, :balance, :currency_id)
  end
end
