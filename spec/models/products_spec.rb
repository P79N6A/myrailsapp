require 'rails_helper'


describe Product do
  context "when the product has comments" do
    let(:product) { Product.create!(name: "race bike") }
    let(:user) {User.create!(email: "test@gmail.com", password: "password")}

    before do
      product.comments.create!(rating: 1, user: user, body: "Awful bike!")
      product.comments.create!(rating: 3, user: user, body: "Ok bike!")
      product.comments.create!(rating: 5, user: user, body: "Great bike!")
    end

    it "should return race bike when products has comments" do
      expect(product.name).to eq "race bike"
    end

    it "the average rating of all comments" do
      expect(product.average_rating).to eq 3
    end

    it "is not vaild without name" do
      expect(Product.new(description: "Nice bike")).not_to be_valid
    end
  end
end
