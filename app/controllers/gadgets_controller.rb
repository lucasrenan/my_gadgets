class GadgetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @gadgets = GadgetSearch.new(current_user.id, params[:q]).search
  end

  def show
    @gadget = find_gadget
  end

  def new
    @gadget = Gadget.new
  end

  def edit
    @gadget = find_gadget
  end

  def create
    @gadget = Gadget.new(gadget_params)
    @gadget.user = current_user

    respond_to do |format|
      if @gadget.save
        format.html { redirect_to @gadget, notice: 'Gadget was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    @gadget = find_gadget

    respond_to do |format|
      if @gadget.update(gadget_params)
        format.html { redirect_to @gadget, notice: 'Gadget was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @gadget = find_gadget
    @gadget.destroy

    respond_to do |format|
      format.html { redirect_to gadgets_url }
    end
  end

  private
    def find_gadget
      Gadget.find(params[:id])
    end

    def gadget_params
      params.require(:gadget).permit(:name, :description, photos_attributes: [:id, :image, :_destroy])
    end
end
