class SkillsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def create
    @skill = current_user.skills.build(skill_params)

    if @skill.save
      render :skill_created, status: :created
    else
      render :skill_not_created, status: :unprocessable_entity
    end
  end

  def index
    @skills = current_user.skills

    render :index, status: :ok
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :years_of_experience, :number_of_projects, :self_rating)
  end
end
