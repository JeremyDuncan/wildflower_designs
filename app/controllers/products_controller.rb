class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    @product.images.build
  end


  # GET /products/1/edit
  def edit
    debug(params, "EDIT => PARAMS")

    @product = Product.find(params[:id])
    @product.images.build if @product.images.empty?
  end


  # POST /products or /products.json
  # def create
  #   @product = Product.new(product_params)
  #
  #   respond_to do |format|
  #     if @product.save
  #       format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
  #       format.json { render :show, status: :created, location: @product }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @product.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def create
    # @product = Product.new(product_params.except(:images))
    @product = Product.new(product_params.except(:images_attributes))

    respond_to do |format|
      # if @product.save
      #   # Handle image uploads
      #   if params[:product][:images]
      #     params[:product][:images].each do |image|
      #       @product.images.create(image: image)  # Assumes you have an 'image' column in your Image model
      #     end
      #   end

        if @product.save
          if params[:product][:images_attributes]
            params[:product][:images_attributes].values.each do |image_attr|
              @product.images.create(image: image_attr[:image], caption: image_attr[:caption])
            end
          end

        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        debug(params, "UPDATE => PARAMS")
        debug(@product, "UPDATE => @product")

        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    debug(params, "destroy => PARAMS")
    debug(@product, "destroy => @product")

    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :price, :details, images_attributes: [:id, :caption, :image, :_destroy], images: [])
    end
end