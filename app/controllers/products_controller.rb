class ProductsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid do |error|
    flash[:alert] = error.message
    redirect_to products_path
  end

  def index
    @products = Product.order(:created_at => :desc)
    @product = Product.new
  end

  def show
  end

  def create
    product = Product.create!(product_params)

    flash[:notice] = "Se creo el producto '#{product.name}'"
    redirect_to products_path
  end

  def update
    @product = Product.find(params[:id])
    @product.update!(product_params)

    flash[:notice] = "Se actualizo el producto '#{@product.name}'"
    redirect_to products_path
  end

  def edit
    @product = Product.find(params[:id])
    render partial: 'products/form', locals: { modal_id: "editProductModal-#{@product.id}" }
  end

  def destroy
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :price,
      characteristics_attributes: [
        :characteristic_id,
        :name,
        :_destroy
      ]
    )
  end
end
