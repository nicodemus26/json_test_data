require_relative "./helpers/number_helper"

module JsonTestData
  class Number
    extend NumberHelper

    class << self
      def create(schema)
        factor = schema.fetch(:multipleOf, nil)
        minimum, maximum = schema.fetch(:minimum, -infinity), schema.fetch(:maximum, infinity)

        num = factor || 1
        step_size = schema.fetch(:type) == "integer" ? 1 : 0.5

        num = adjust_for_maximum(number: num, maximum: maximum, step_size: factor || step_size)
        adjust_for_minimum(number: num, minimum: minimum, step_size: factor || step_size)
      end
    end
  end
end
