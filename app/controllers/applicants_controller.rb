# frozen_string_literal: true

class ApplicantsController < BaseController
  before_action :set_applicant, only: %i[show edit update destroy]

  def index
    @applicants = Applicant.all
  end

  def show; end

  def new
    @applicant = Applicant.new
  end

  def edit; end

  def create
    @applicant = Applicant.new(applicant_params)
    if save_applicant
      redirect_with_notice(applicant_url(@applicant), 'created_success')
    else
      render_with_errors(:new)
    end
  end

  def update
    if update_applicant
      redirect_with_notice(applicant_url(@applicant), 'updated_success')
    else
      render_with_errors(:edit)
    end
  end

  def destroy
    @applicant.destroy
    redirect_with_notice(applicants_url, 'destroyed_success')
  end

  private

  def set_applicant
    @applicant = Applicant.find(params[:id])
  end

  def applicant_params
    params.require(:applicant).permit(:name, :cpf, :birth_date, :address, :number, :neighborhood, :city, :state,
                                      :zip, :phone, :salary, :inss_contribution_rate, :salary_deduction)
  end

  def save_applicant
    @applicant.save
  end

  def update_applicant
    @applicant.update(applicant_params)
  end

  def redirect_with_notice(path, notice_key)
    redirect_to path, notice: I18n.t("controllers.applicant.#{notice_key}")
  end

  def render_with_errors(action)
    render action, status: :unprocessable_entity
  end
end
