require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  let(:user) {create(:user)}
  let(:group) {create(:group)}

  describe 'GET #index' do
    before do
      login_user user
    end

    it "アクション内で定義しているインスタンス変数はあるか" do
      get :index, params: { group_id: group }
      expect(assigns(:group)).to eq group
    end

    it "該当するビューが描写されているか" do
      get :index, params: { group_id: group }
      expect(response).to render_template :index
    end

  end
end
