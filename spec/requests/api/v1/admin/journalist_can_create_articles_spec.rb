RSpec.describe "POST /v1/admin/articles", type: :request do
  let(:journalist) { create(:user, role: "journalist") }
  let(:journalist_credentials) { journalist.create_new_auth_token }
  let(:journalist_headers) { { HTTP_ACCEPT: "application/json" }.merge!(journalist_credentials) }

  describe "successfully with vaild params and headers" do
    before do
      post "/api/v1/admin/articles",
           params: {
             article: {
               title: "Trump holds first public event since Covid diagnosis",
               lead: "Donald Trump has delivered a speech in front of cheering",
               content: "The event was officially a 'peaceful protest'",
               category: "news",
             },
           }, headers: journalist_headers
    end

    it "is expected to return 200 response status" do
      expect(response).to have_http_status 200
    end

    it "is expected to return success message" do
      expect(response_json["message"]).to eq "Article successfully created"
    end

    it "is expected to create article" do
      article = Article.last
      expect(article.title).to eq "Trump holds first public event since Covid diagnosis"
    end

    it "article is expected to be associated with journalist" do
      expect(journalist.articles.first.lead).to eq "Donald Trump has delivered a speech in front of cheering"
    end
  end

  describe "unsuccessfully, missing content" do
    before do
      post "/api/v1/admin/articles",
           params: {
             article: {
               title: "Trump holds first public event since Covid diagnosis",
               lead: "Donald Trump has delivered a speech in front of cheering",
               content: "",
               category: "news",
             },
           }, headers: journalist_headers
    end

    it "is expected to return 422 response status" do
      expect(response).to have_http_status 422
    end

    it "is expected to return error message" do
      expect(response_json["message"]).to eq "Content can't be blank"
    end
  end

  describe "unauthorized user" do
    let(:unauthorized_user) { create(:user, role: "registered") }
    let(:unauthorized_user_credentials) { unauthorized_user.create_new_auth_token }
    let(:unauthorized_headers) { { HTTP_ACCEPT: "application/json" }.merge!(unauthorized_user_credentials) }

    before do
      post "/api/v1/admin/articles",
           params: {
             article: {
               title: "Trump holds first public event since Covid diagnosis",
               lead: "Donald Trump has delivered a speech in front of cheering",
               content: "The event was officially a 'peaceful protest'",
               category: "news",
             },
           }, headers: unauthorized_headers
    end

    it "is expected to return 401 response status" do
      expect(response).to have_http_status 401
    end

    it "is expected to return error message" do
      expect(response_json["message"]).to eq "You don't have permission to perform this action"
    end
  end
end
