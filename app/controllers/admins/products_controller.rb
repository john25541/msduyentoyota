class Admins::ProductsController < Admins::AdminsController
  before_action :set_admins_product, only: [:show, :edit, :update, :destroy]

  def index
    @admins_products = Product.all
  end

  def show
  end

  def new
    @admins_product = Product.new
  end

  def create
    @admins_product = Product.new(admins_product_params)

    respond_to do |format|
      if @admins_product.save
        format.html { redirect_to admins_product_path(@admins_product), notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admins_product }
      else
        format.html { render action: 'new' }
        format.json { render json: @admins_product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @admins_product.update(admins_product_params)
      redirect_to admins_product_path(@admins_product), notice: 'Product was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @admins_product.destroy
    respond_to do |format|
      format.html { redirect_to admins_products_path, notice: 'Product was successfully deleted.' }
    end
  end

  private
    def set_admins_product
      @admins_product = Product.find_by(id: params[:id])
    end

    def admins_product_params
      params.require(:product).permit!
    end
end