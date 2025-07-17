class CheckInsController < ApplicationController
  # Require login for all actions except index and show
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_check_in, only: %i[show edit update destroy]

  # GET /check_ins
  def index
    # Get only the check-ins for the logged-in user
    @check_ins = current_user.check_ins.order(created_at: :desc)
  end

  # GET /check_ins/1
  def show
  end

  # GET /check_ins/new
  def new
    @check_in = CheckIn.new
  end

  # GET /check_ins/1/edit
  def edit
  end

  # POST /check_ins
  def create
    @check_in = current_user.check_ins.new(check_in_params)

    respond_to do |format|
      if @check_in.save
        format.html { redirect_to check_ins_path, notice: "Check-in was successfully created." }
        format.json { render :show, status: :created, location: @check_in }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @check_in.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /check_ins/1
  def update
    respond_to do |format|
      if @check_in.update(check_in_params)
        format.html { redirect_to check_ins_path, notice: "Check-in was successfully updated." }
        format.json { render :show, status: :ok, location: @check_in }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @check_in.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /check_ins/1
  def destroy
    @check_in.destroy!

    respond_to do |format|
      format.html { redirect_to check_ins_path, notice: "Check-in was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private

    def set_check_in
      # Ensure that the check-in belongs to the current user
      @check_in = current_user.check_ins.find(params[:id])
    end

    def check_in_params
      # Permit the necessary parameters
      params.require(:check_in).permit(:content, :location, :mood, :note)
    end
end
