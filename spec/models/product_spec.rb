require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    it 'saves a product when all information is given' do
      @category = Category.create(name: "Flowers")
      @product = Product.create(name: "Rose", price: 2000, quantity: 10, category: @category)
      @product.save!
      expect(@product.id).to be_present
    end

    it 'returns an error when name is not present' do
      @category = Category.create(name: "Flowers")
      @product = Product.create(name: nil, price: 2000, quantity: 10, category: @category)
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end

    it 'returns an error when quantity is not present' do
      @category = Category.create(name: "Flowers")
      @product = Product.create(name: "Rose", price: 2000, quantity: nil, category: @category)
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end

    it 'returns an error when category is not present' do
      @category = Category.create(name: "Flowers")
      @product = Product.create(name: "Rose", price: 2000, quantity: 10, category: nil)
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end

    it 'returns an error when price is not a number' do
      @category = Category.create(name: "Flowers")
      @product = Product.create(name: "Rose", price: "nil", quantity: 10, category: @category)
      expect(@product.errors.full_messages).to include "Price is not a number"
    end

  end
end
