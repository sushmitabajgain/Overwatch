class Api::V1::SearchController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
      projects = Project.where(project: params[:project])
      if !projects.nil?
          render json: projects, status: :ok
      else
          render json: {errors: "No such project"}, status: :unprocessable_entity
      end
  end
end