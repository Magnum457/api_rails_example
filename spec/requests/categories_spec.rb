require 'rails_helper'

RSpec.describe "Categories", type: :request do
  # inicializando os dados
  let!(:categories) { create_list(:category, 5) }
  let!(:category_id) { categories.first.id }
  let!(:user) { FactoryBot.create(:user, username: "magno", password: "password") }

  describe "GET /categories" do
    before { get "/api/v1/categories", headers: {
      "Authorization" => AuthenticationTokenService.call(user.id)
    } }
    it "returns categories" do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end
    it "return status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /categories" do
    let(:valid_name) { { name: "Horror" } }
    context "when the request is valid" do
      before { post "/api/v1/categories", params: valid_name, headers: {
        "Authorization" => AuthenticationTokenService.call(user.id)
      } }
      it "creates a category" do
        expect(json["name"]).to eq("Horror")
      end
      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end
    context "when the request is invalid" do
      before { post "/api/v1/categories", params: { name: "" }, headers: {
        "Authorization" => AuthenticationTokenService.call(user.id)
      } }
      it "return a status code 422" do
        expect(response).to have_http_status(422)
      end
      it "returns a validation failure message" do
        expect(response.body).to include("is too short (minimum is 3 characters)")
      end
    end
  end

  describe "DELETE /categories/:id" do
    before { delete "/api/v1/categories/#{category_id}", headers: {
      "Authorization" => AuthenticationTokenService.call(user.id)
    } }
    it "returns status code 204" do
      expect(response).to have_http_status(204)
    end
  end
end
