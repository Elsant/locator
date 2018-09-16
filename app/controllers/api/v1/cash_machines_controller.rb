module Api
  module V1
    class CashMachinesController < ApplicationController
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
    end
  end
end