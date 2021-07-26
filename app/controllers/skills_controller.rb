class SkillsController < ApplicationController
  skip_before_action :verify_authenticity_token

  private

  def skill_params
    params.require(:skill).permit(:name, :years_of_experience, :number_of_projects, :self_rating)
  end
end
