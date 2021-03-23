module Api
  module V1
    class WeeksController < ApplicationController
      skip_before_action :verify_authenticity_token

      # GET /weeks
      def index
        weeks = Week.all.order("created_at DESC")
        render json: weeks, status: :ok
      end

      # GET /weeks/1
      def show
        week = Week.find(params[:id])
        if !week.nil?
            render json: week, status: :ok
        else
            render json: {errors: week.errors.full_messages}, status: :unprocessable_entity
        end
      end

      # POST /weeks
      def create
        @week = Week.new(week_params)
        if @week.save
          render json: @week, status: :created
        else
          render json: { errors: @week.errors.full_messages },
                  status: :unprocessable_entity
        end
      end

      # PATCH/PUT /weeks/1
      def update
        week = Week.find(params[:id])
        if week.update(week_params)
          render json: week, status: :created
        else
          render json: { errors: week.errors.full_messages },
                  status: :unprocessable_entity
        end
      end

      # DELETE /weeks/1
      def destroy
        week = Week.find(params[:id])
        if week.destroy
            render json: {success: "deleted successfully"}, status: :ok
        else
            render json: {errors: week.errors.full_messages}, status: :not_acceptable
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def role_params
          params.permit(:week)
        end
    end
  end
end
