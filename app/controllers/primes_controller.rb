class PrimesController < ApplicationController
  
  def show
    @prime = Prime.new
  end

  def create
    @prime = Prime.new(params[:prime])
    if @prime.valid?
      @primes = @prime.generate
      render :show, notice: 'Ok'
    else
      redirect_to :root, alert: 'False'
    end
  end
end