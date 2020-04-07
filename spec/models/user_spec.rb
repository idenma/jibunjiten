require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  let(:user){User.new(params)}
  let(:params){{name:"idenma",email:"idenma2@gmail.com", password:"tamaco"}}

 it "userが存在していること" do
   expect(user).to be_valid
 end

 it "passwordなしにuserが存在できないこと" do
   params.merge!(password:"　")
   expect(user).to_not be_valid
 end

 it "emailなしにuserが存在できないこと" do
   params.merge!(email:" ")
   expect(user).to_not be_valid
 end

 it "nameが長すぎないこと" do
   user.name = "a" * 51
   expect(user).to_not be_valid
 end

 it "emailが長すぎないこと" do
   user.email = "a" * 244 + "@example.com"
   expect(user).to_not be_valid
 end

  it "emailのアドレスがフォーマットとして有効か" do
    user.email = "user@example.com"
    expect(user).to be_valid
    user.email = "USER@foo.COM"
    expect(user).to be_valid
    user.email = "A_US-ER@foo.bar.org"
    expect(user).to be_valid
    user.email = "first.last@foo.jp"
    expect(user).to be_valid
    user.email = "alice+bob@baz.cn"
    expect(user).to be_valid
  end

  it "emailのアドレスがフォーマットとして無効か" do
    user.email = "user@example,com"
    expect(user).to_not be_valid
    user.email = "user_at_foo.org"
    expect(user).to_not be_valid
    user.email = "user.name@example.foo@bar_baz.com"
    expect(user).to_not be_valid
  end

  it "emailに一意性があるか" do
    duplicate_user = user.dup
    duplicate_user.email = user.email.upcase
    user.save
    expect(duplicate_user).to_not be_valid
   end


end
