class IUpdateMetrics
  include Interactor

  def call
    Metric.create(user_count: 1, revenue: context.product.price)
  end
end
