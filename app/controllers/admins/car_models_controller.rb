class Admins::CarModelsController < Admins::AdminsController
  before_action :set_admins_car_model, only: [:show, :edit, :update, :destroy]

  def index
    @admins_car_models = CarModel.all
  end

  def show
  end

  def new
    @admins_car_model = CarModel.new
  end

  def create
    @admins_car_model = CarModel.new(admins_car_model_params)

    respond_to do |format|
      if @admins_car_model.save
        format.html { redirect_to admins_car_model_path(@admins_car_model), notice: 'Car model was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admins_car_model }
      else
        format.html { render action: 'new' }
        format.json { render json: @admins_car_model.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @admins_car_model.update(admins_car_model_params)
      redirect_to admins_car_model_path(@admins_car_model), notice: 'Car model was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @admins_car_model.destroy
    respond_to do |format|
      format.html { redirect_to admins_car_models_path, notice: 'Car model was successfully deleted.' }
    end
  end

  private

  def admins_car_model_params
    params.require(:car_model).permit!
  end

  def set_admins_car_model
    @admins_car_model = CarModel.find(params[:id])
  end

end