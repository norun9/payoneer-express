class PayeesController < ApplicationController
  def index
    @payees = Payee.all
  end

  def show
  end

  def new
    
  end
end
