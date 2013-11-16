class ShiftsController < ApplicationController

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
      redirect_to members_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private

  def shift_params
    params.require(:shift).permit!
  end

end