PrimeOnRails::Application.routes.draw do
  resource :primes, only: [:show, :create]

  root :to => 'primes#show'
end
