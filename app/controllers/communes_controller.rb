class CommunesController < ApplicationController
  def index
    respond_to do |format|
      format.json { render json: '' }
      format.any { render status: 406 }
    end
  end

  def create
    render status: 403
  end

  def show
    @commune = Commune.find_by_code_insee(params[:id])
    @commune.blank? ? render(status: 404) : render(json: @commune)
  end

  def update
    @commune = Commune.find_by_code_insee(params[:id])

    respond_to do |format|
      if @commune.blank?
        format.any { render status: 404 }
      elsif params[:commune].blank?
        format.any { render status: 400 }
      elsif @commune.update!(commune_params)
        format.any { render status: 204 }
      else
        format.json { render json: @commune.errors, status: 409 }
      end
    end
  end

  private

  def commune_params
    params.require(:commune).permit(:name)
  end

end
