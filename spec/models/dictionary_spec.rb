require 'rails_helper'

RSpec.describe Dictionary, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  let(:user){User.create(params)}
  let(:params){{name:"idenma",email:"idenma2@gmail.com",password:"tamaco"}}

  it "dictionaryが存在していること" do
    dictionary = user.dictionaries.build(name:"Ruby on rails")
    dictionary.save
    expect(dictionary).to be_valid
  end

  it "nameなしにdictionaryが存在できないこと" do
    dictionary = user.dictionaries.build(name:"　")
    dictionary.save
    expect(dictionary).to_not be_valid
  end

end
