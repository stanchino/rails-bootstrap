require 'rails_helper'

describe DashboardController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET #admin" do
    describe "for unauthenticated" do
      it "blocks access" do
        get :admin
        expect(response).to redirect_to new_admin_session_url
      end
    end
    describe "for authenticated user" do
      login_user
      it "blocks access" do
        get :admin
        expect(response).to redirect_to new_admin_session_url
      end
    end
    describe "for authenticated admin" do
      login_admin
      it "allows access" do
        get :admin
        expect(response).to be_success
        expect(response).to render_template "dashboard/admin", layout: "admin"
      end
    end
  end

  describe "GET #user" do
    describe "for unauthenticated" do
      it "blocks access" do
        get :user
        expect(response).to redirect_to new_user_session_url
      end
    end
    describe "for authenticated user" do
      login_user
      it "allows access" do
        get :user
        expect(response).to be_success
        expect(response).to render_template "dashboard/user", layout: "user"
      end
    end
    describe "for authenticated admin" do
      login_admin
      it "allows access" do
        get :user
        expect(response).to be_success
        expect(response).to render_template "dashboard/user", layout: "user"
      end
    end
    describe "for unauthorized admin" do
      login_admin
      before { allow(subject).to receive(:current_ability).and_return(Ability.new) }
      it "blocks access for HTML format" do
        get :user
        expect(response).to be_forbidden
        expect(response).not_to render_template "dashboard/user", layout: "user"
      end
      it 'blocks access for JSON format' do
        get :user, format: :json
        expect(response).to be_forbidden
      end
    end
  end
end
