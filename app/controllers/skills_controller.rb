class SkillsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @skill = current_user.skills.build(skill_params)

    if @skill.save
      render :skill_created, status: :created
    else
      render :skill_not_created, status: :unprocessable_entity
    end
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :years_of_experience, :number_of_projects, :self_rating)
  end
end
