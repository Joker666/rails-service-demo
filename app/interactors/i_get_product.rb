class IGetProduct
  include Interactor

  def call
    product = Product.find_by name: context.product_name
      context.fail!(error: "Product doesn't exist") unless product.present?
      context.product = product
  end
end

