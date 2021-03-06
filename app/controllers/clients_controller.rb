class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :require_login

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all.order("name")
  end

  def show
    @clients = Client.all
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to clients_path, notice: 'Cliente criado com sucesso.' }
        format.json { render action: 'index' }
      else
        format.html { render action: 'new' }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to clients_path, notice: 'Cliente atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url }
      format.json { head :no_content }
    end
  end

  def sort
    clients = Client.all
    last_sorted = session[:last_sorted].blank? ? [] : session[:last_sorted]

    if last_sorted.size < clients.size
      client = clients.delete_if{ |client| last_sorted.include? client.id }.shuffle.first
    else
      client = clients.shuffle.first
      last_sorted = []
    end
    session[:last_sorted] = last_sorted.blank? ? [client.id] : last_sorted + [client.id]

    ##ClientMailer.sorted(client).deliver

    redirect_to clients_path, notice: "Cliente sorteado #{client.name}."
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:name, :phone_number, :email, :birthday)
    end
end
