class PrimesController < ApplicationController
  
  def show
    @prime = Prime.new
  end

  def create
    @prime = Prime.new(params[:prime])
    if @prime.valid?
      @primes = @prime.generate
      render :show
    else
      redirect_to :root, alert: 'Invalid input data!!!'
    end
  end
end