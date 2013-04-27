require 'spec_helper'
def valid_attributes
end

def valid_session 
end

describe "Post create" do
    describe "with valid params" do
      it "creates a new User Memoid" do
        expect {
          post :create, {:memoid => valid_attributes}, valid_session
        }.to change(Memoid, :count).by(1)
      end

      it "assigns a newly created memoid as @memoid" do
        post :create, {:memoid => valid_attributes}, valid_session
        assigns(:memoid).should be_a(Memoid)
        assigns(:memoid).should be_persisted
      end

      it "redirects to the created memoid" do
        post :create, {:memoid => valid_attributes}, valid_session
        response.should redirect_to(Memoid.last)
      end
    end
end