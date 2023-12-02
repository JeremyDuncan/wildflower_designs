class CartItemsController < ApplicationController
  before_action :authenticate_user!


  def index
    @cart_items = current_user.cart_items.includes(:product).order('products.id')
    @products = @cart_items.map { |item| item.product }
  end

  def create
    product = Product.find(params[:product_id])
    @cart_item = current_user.cart_items.find_or_initialize_by(product: product)

    # Correctly handle the initialization and increment of quantity
    if @cart_item.new_record?
      @cart_item.quantity = 1 # If it's a new cart item, set quantity to 1
    else
      @cart_item.quantity += 1 # If it already exists, increment by 1
    end

    respond_to do |format|
      if @cart_item.save
        format.js   # Responds to AJAX request with JavaScript
        format.html { redirect_to product_path(product), notice: 'Product added to cart!' } # Fallback for non-JS requests
      else
        format.js
        format.html { redirect_to product_path(product), alert: 'Unable to add product to cart.' }
      end
    end
  end


  def update_cart
    params[:cart_items].each do |cart_item_id, cart_item_params|
      cart_item = current_user.cart_items.find_by(id: cart_item_id)
      next unless cart_item.present?

      quantity = cart_item_params[:quantity].to_i
      cart_item.update(quantity: quantity) if quantity > 0
    end

    redirect_to cart_items_path, notice: 'Cart updated successfully'
  end

  def destroy
    cart_item = current_user.cart_items.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path, notice: 'Item removed from cart'
  end



  def request_invoice
    @cart_items = current_user.cart_items
    if @cart_items.any?
      UserMailer.invoice_email(current_user, @cart_items).deliver_now

      # Clear the cart after sending the invoice
      current_user.cart_items.destroy_all

      # Redirect to the products page with a notice
      redirect_to root_path, notice: 'Invoice requested successfully. Check your email!'
    else
      redirect_to root_path, alert: 'Your cart is empty.'
    end
  end
end

