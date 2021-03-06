class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_plant, only: [:show, :edit, :update, :destroy]

  def index
    # @plants = Plant.all
    @plants = policy_scope(Plant) #this line handles the index through authorization.
    # see plant policy -scope
    @search = params["search"]
    if @search.present?
      @adress = @search[:query]
      @plants = Plant.where("address ILIKE ?", "%#{@search[:query]}%")
    else
      @plants = policy_scope(Plant)
    end
  end

  def show
    @plant = Plant.find(params[:id])
    authorize @plant
    @plants = Plant.geocoded #returns plants with coordinates
    @markers = @plants.map do |plant|
      {
        lat: plant.latitude,
        lng: plant.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { plant: plant })
      }
    end
    @number_days = @plant.avail_to - @plant.avail_from
  end

  def new
    @plant = Plant.new
    authorize @plant
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.user = current_user
    authorize @plant
    if @plant.save
      redirect_to plant_path(@plant), notice: 'Plant was saved'
    else
      render :new
    end
  end

  def edit
    @plant = Plant.find(params[:id])
    authorize @plant
  end

  def update
    @plant = Plant.find(params[:id])
    if @plant.update(plant_params)
      @plant.save
      authorize @plant
      redirect_to @plant, notice: 'Plant was updated'
    else
      render :edit
    end
  end

  def destroy
    @plant = Plant.find(params[:id])
    authorize @plant
    @plant.destroy
    redirect_to plants_url, notice: 'Plant was removed'
  end

  private

  def set_plant
    @plant = Plant.find(params[:id])
    authorize @plant
  end

  def plant_params
    params.require(:plant).permit(:name, :description, :price,
                                  :care_instructions, :user_id, :photo, :photo_cache, :address, :search, :avail_from, :avail_to)
  end
end
