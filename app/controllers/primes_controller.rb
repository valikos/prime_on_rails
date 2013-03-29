class PrimesController < ApplicationController
  
  before_filter :init_prime, except: :show

  def show
    @prime = Prime.new
  end

  def create
    if @prime.valid?
      @primes = @prime.generate
      render :show
    else
      redirect_to :root, alert: 'Invalid input data!!!'
    end
  end

  def is_prime
    @status = @prime.is_prime?
  end

private
  
  def init_prime
    @prime = Prime.new(params[:prime])
  end

end