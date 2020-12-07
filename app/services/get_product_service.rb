class GetProductService < ApplicationService
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def call
    product = Product.find_by name: @name
      raise StandardError, "Product doesn't exist" unless product.present?

      product
  end
end
