class V1::EveningEntriesController < ApplicationController
  def index
    @evening_entries = @current_user.evening_entries
    render json: @evening_entries, status: :ok
  end

  def create
    @evening_entry = @current_user.evening_entries.create!(evening_entry_params)
    render json: @evening_entry, status: :created
  end

  def show
    @evening_entry = EveningEntry.find(params[:id])
    if @evening_entry
      render json: @evening_entry, status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  def update
    @evening_entry = EveningEntry.find(params[:id])
    if @evening_entry.update(evening_entry_params)
      render json: @evening_entry, status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  def destroy
    @evening_entry = EveningEntry.find(params[:id])
    if @evening_entry.destroy
      render status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  def e_entry_by_date
    date =  Date.parse(params[:date])
    @evening_entry = @current_user.evening_entries.where(updated_at: date.beginning_of_day...date.end_of_day)
    render json: @evening_entry, status: :ok
  end

  def evening_entry_params
    params.require(:evening_entry).permit(:caffeine_morning, :caffeine_afternoon, :caffeine_evening, :nap_morning,
    :nap_afternoon, :nap_evening)
  end
end