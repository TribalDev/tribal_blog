require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  it "lists an index of posts" do
    10.times { post = create(:post) }

    get :index
    posts_present = Post.count

    expect(response).to have_http_status(:success)
    expect(posts_present).to eq(10)
  end

  it "returns a specific post" do
    post = create(:post, title: "a very specific post")

    get :show, id: post.id
    post_returned = Post.find(post.id)

    expect(response).to render_template(:show)
    expect(response).to have_http_status(:success)
    expect(post_returned.title).to eq("a very specific post")
  end

  it "returns a specific post" do
    post = create(:post, title: "a very specific post")

    get :show, id: post.id
    post_returned = Post.find(post.id)

    expect(response).to render_template(:show)
    expect(response).to have_http_status(:success)
    expect(post_returned.title).to eq("a very specific post")
  end

  it "creates a new post" do
    post_params = {post: {title: "great title", text: "lorem ipsum blah, blah, blah, lorem ipsum, more blah..."}}

    post :create, post_params
    post_created = Post.last

    expect(post_created.title).to eq("great title")
  end
end
