class UpdateMetricsService < ApplicationService
    attr_reader :product

    def initialize(product)
        @product = product
    end

    def call
        Metric.create(user_count: 1, revenue: @product.price)
    end
end