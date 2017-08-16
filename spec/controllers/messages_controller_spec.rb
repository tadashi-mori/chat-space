  require 'rails_helper'

  RSpec.describe MessagesController, type: :controller do
    let(:user) {create(:user)}
    let(:group) {create(:group)}
    let(:message) {build(:message)}
    let(:create_params) { {group_id: group, message: attributes_for(:message) } }

    describe 'GET #index' do
      context "ログインしている場合" do
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

      context "ログインしていない場合" do

        it "意図した画面にリダイレクトできているか" do
          get :index, params: { group_id: group }
          expect(response).to redirect_to new_user_session_path

        end
      end
    end

    describe 'POST #create' do
      context "ログインしている場合" do

        before do
          login_user user
        end

        context "メッセージの保存に成功" do
          it "メッセージの保存はできたのか" do
            expect{post :create, params: {group_id: group, message: attributes_for(:message)}}.to change(Message, :count).by(1)
          end

          it "意図した画面に遷移しているか" do
            post :create, params: { group_id: group, message: attributes_for(:message) }
            expect(response).to redirect_to group_messages_path
          end
        end
      end
    end

    describe 'POST #create' do
      context "ログインしている場合" do

        before do
          login_user user
        end

          it "メッセージの保存に失敗した場合" do
            subject{ post :create, params: { group_id: group, message: attributes_for(:message, body: nil, image: nil) }}
            expect{subject}.not_to change(Message, :count)
          end

          it "意図したビューが描写されているか" do
            post :create, params: { group_id: group, message: attributes_for(:message) }
            expect(response).to redirect_to group_messages_path
          end
      end

      context "ログインしていない場合" do
        it "意図した画面にリダイレクトできているか" do

          post :create, params: { group_id: group, message: attributes_for(:message) }
          expect(response).to redirect_to new_user_session_path
        end
      end
    end
  end

