require 'rails_helper'

RSpec.describe Micropost, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

 let(:user){User.new(params1)}
 let(:params1){{name:"idenma",email:"idenma2@gmail.com", password:"tamaco"}}
 let(:dictionary){Dictionary.create(params2)}
 let(:params2){{name:"Ruby on rails"}}
 let(:posts){Post.create(params3)}
 let(:params3){{heading:"hello"}}





  it "micropostが存在していること" do
    mpost = dictionary.posts.microposts.build(subheading:"world")
    mpost.save
    expect(mpost).to be_valid
  end
end
