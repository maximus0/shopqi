#encoding: utf-8
require 'spec_helper'

describe ProductDrop do

  let(:shop) { Factory(:user).shop }

  let(:iphone4) { Factory :iphone4, shop: shop }

  let(:product_drop) { ProductDrop.new iphone4 }

  it 'should get url' do
    product_drop.url.should eql "/products/#{iphone4.handle}"
  end

=begin
  it 'should get featured_image' do
    product_drop.send('featured_image').should eql "/products/"
  end
=end

  it 'should get title' do
    product_drop.title.should eql "iphone4"
  end

  it 'should get price' do
    product_drop.price.should eql 0.0
  end

  it 'should get description' do
    product_drop.description.should eql iphone4.body_html
  end

  it 'should get available' do
    product_drop.available.should eql true
  end

  it 'should get variants' do
    product_drop.variants.size().should eql 1
  end

  it 'should get options' do
    product_drop.options.size().should eql 1
  end

  describe ProductOptionDrop do

    it 'should get json' do
      result = '标题'
      product_drop.options.first.as_json.should eql result
    end

  end

end