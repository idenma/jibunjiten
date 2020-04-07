require 'rails_helper'

RSpec.describe Post, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  let(:user){User.create(params)}
  let(:params){{name:"idenma",email:"idenma2@gmail.com",password:"tamaco"}}

  let(:dictionary){Dictionary.create(params)}
  let(:params){{name:"Ruby on rails"}}

  it "postが存在していること" do
    post = dictionary.posts.build(heading:"こんにちは")
    post.save
    expect(post).to be_valid
  end

  it "headingなしにpostが存在できないこと" do
    post = dictionary.posts.build(heading:"　")
    post.save
    expect(post).to_not be_valid
  end


end
