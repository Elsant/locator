module Api
  module V1
    class CashMachinesController < Api::V1::ApplicationController
      before_action :validate_params

      def search
        render json: nearest_five_poi
      end

      private

      def base_resources
        @_base_resources ||= CashMachine.where(nil)
      end

      def nearest_five_poi
        base_resources.nearest 5, [params['lat'], params['long']]
      end

      def validate_params
        point = ::Point.new(params)
        if !point.valid?
          render json: { error: point.errors }, status: :unprocessable_entity and return
        end
      end

    end
  end
end
