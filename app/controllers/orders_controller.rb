class OrdersController < ApplicationController

  def index
    @client = Client.find(params[:client_id])
    @order = Order.new
    @order.client = @client
  end

  def new
    @client = Client.find(params[:client_id])
    @order = @client.orders.create
  end

  def show
    @client = Client.find(params[:client_id])
  end

  def add_product
    puts 'oi'
    @product = Product.find_by_code(params[:product_code])
    @order = Order.find(params[:order_id])

    @order.products << @product

    ##redirect_to client_order_path(@order.client), notice: 'Produto inserido com sucesso.'
  end

  def edit
    @order = Order.find(:order_id)
  end
end
