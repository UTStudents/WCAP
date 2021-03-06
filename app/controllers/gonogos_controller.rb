class GonogosController < ApplicationController
  before_action :set_gonogo, only: [:show, :edit, :update, :destroy, :restart, :finish]
  before_filter :authenticate_user!
  layout false , except: [:index, :new, :show]  
  respond_to :html

  def index
    @gonogos = Gonogo.all
    respond_with(@gonogos)
  end

  def show
    respond_with(@gonogo)
  end

  def new
    @gonogo = Gonogo.new
    respond_with(@gonogo)
  end

  def edit
  end

  def finish
    @gonogo.finished = true
    @gonogo.save
    respond_with(@gonogo)
  end
  def restart
    @gonogo.finished = false 
    @gonogo.save
    respond_with(@gonogo)
  end
  def create
    @gonogo = Gonogo.new(gonogo_params)
    @gonogo.save
    respond_with(@gonogo)
  end

  def update
    @gonogo.update(gonogo_params)
    respond_with(@gonogo)
  end

  def destroy
    @gonogo.destroy
    respond_with(@gonogo)
  end

  private
    def set_gonogo
      @gonogo = Gonogo.find(params[:id])
    end

    def gonogo_params
      params[:gonogo]
    end
end
