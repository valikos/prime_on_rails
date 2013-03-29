PrimeOnRails::Application.routes.draw do
  resource :primes, only: [:show, :create]

  get '/is-prime', to: 'primes#is_prime', as: :is_prime

  root :to => 'primes#show'
end
