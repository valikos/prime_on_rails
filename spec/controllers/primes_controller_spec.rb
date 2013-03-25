require 'spec_helper'

describe PrimesController do
  describe "GET 'show'" do
    before do
      get :show
    end
    it { should respond_with(:success) }
    it { should render_template(:show) }
  end
  describe "Post 'create'" do
    describe "success" do
      context "direct range" do
        before do
          post :create, prime: { first: 1, last: 10 }
        end
        it { should respond_with(:success) }
        it { should render_template(:show) }
        it { should assign_to(:primes) }
      end
      context "inverse range" do
        before do
          post :create, prime: { first: 10, last: 1 }
        end
        it { should respond_with(:success) }
        it { should render_template(:show) }
        it { should assign_to(:primes) }
      end
    end
    describe "failure" do
      before do
        post :create, prime: { first: '', last: '' }
      end
      it { should respond_with(:redirect) }
      it { should redirect_to(:root) }
    end
  end
end