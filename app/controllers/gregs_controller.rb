class GregsController < ApplicationController
  before_action :set_greg, only: %i[ show edit update destroy ]

  # GET /gregs or /gregs.json
  def index
    @gregs = Greg.all
  end

  # GET /gregs/1 or /gregs/1.json
  def show
  end

  # GET /gregs/new
  def new
    @greg = Greg.new
  end

  # GET /gregs/1/edit
  def edit
  end

  # POST /gregs or /gregs.json
  def create
    @greg = Greg.new(greg_params)

    respond_to do |format|
      if @greg.save
        ContactMailer.say_hello_to(@greg).deliver_now
        redirect_to @greg, notice: 'User was successfully created.'
        format.html { redirect_to @greg, notice: "Greg was successfully created." }
        format.json { render :show, status: :created, location: @greg }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @greg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gregs/1 or /gregs/1.json
  def update
    respond_to do |format|
      if @greg.update(greg_params)
        format.html { redirect_to @greg, notice: "Greg was successfully updated." }
        format.json { render :show, status: :ok, location: @greg }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @greg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gregs/1 or /gregs/1.json
  def destroy
    @greg.destroy!

    respond_to do |format|
      format.html { redirect_to gregs_path, status: :see_other, notice: "Greg was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_greg
      @greg = Greg.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def greg_params
      params.require(:greg).permit(:name, :email, :tel)
    end
end
