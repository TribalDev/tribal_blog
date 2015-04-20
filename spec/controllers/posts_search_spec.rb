RSpec.describe PostsController, type: :controller do
  it "searches for posts" do
    post1 = create(:post, {title: 'lovely sushi'})
    post2 = create(:post, {text: 'I was a nice sushi in another life'})
    post3 = create(:post, {title: 'just pizza...'})

    get :search, query: "sushi"

    expect(response.status).to eq(200)
    expect(response).to render_template(:search)
    expect(assigns(:search_results)).to eq([post1, post2])
    expect(assigns(:search_results)).not_to include(post3)    
  end
end
