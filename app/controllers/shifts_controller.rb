class ShiftsController < ApplicationController
  before_action :require_member, except: [:show, :index]

  def index
    @shifts = Shift.all
  end

  def new
    @shift = Shift.new
  end

  def create
    @shift = Shift.new(shift_params)
    @shift.creator = current_user
    if @shift.save
      flash[:notice] = "Your shift was saved"
      redirect_to shifts_path
    else
      render :new
    end
  end

  def edit
    @shift = Shift.find(params[:id])
  end

  def update
    @shift = Shift.find(params[:id])
    if @shift.update(shift_params)
      flash[:notice] = "The shift was updated"
      redirect_to shifts_path
    else
      render :edit
    end
  end

  def show
    @shift = Shift.find(params[:id])
  end

  def destroy
    @shift = Shift.find(params[:id])
    @shift.destroy
    flash[:notice] = "The shift was deleted"
    redirect_to shifts_path
  end

  private

  def shift_params
    params.require(:shift).permit!
  end

end