class EgrupalsController < ApplicationController
  before_action :set_egrupal, only: [:show, :edit, :update, :destroy]

  # GET /egrupals
  # GET /egrupals.json
  def index
    @egrupals = Egrupal.all
  end

  # GET /egrupals/1
  # GET /egrupals/1.json
  def show
  end

  # GET /egrupals/new
  def new
    @egrupal = Egrupal.new
  end

  # GET /egrupals/1/edit
  def edit
  end

  # POST /egrupals
  # POST /egrupals.json
  def create
    @egrupal = Egrupal.new(egrupal_params)

    respond_to do |format|
      if @egrupal.save
        format.html { redirect_to @egrupal, notice: 'Egrupal was successfully created.' }
        format.json { render :show, status: :created, location: @egrupal }
      else
        format.html { render :new }
        format.json { render json: @egrupal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /egrupals/1
  # PATCH/PUT /egrupals/1.json
  def update
    respond_to do |format|
      if @egrupal.update(egrupal_params)
        format.html { redirect_to @egrupal, notice: 'Egrupal was successfully updated.' }
        format.json { render :show, status: :ok, location: @egrupal }
      else
        format.html { render :edit }
        format.json { render json: @egrupal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /egrupals/1
  # DELETE /egrupals/1.json
  def destroy
    @egrupal.destroy
    respond_to do |format|
      format.html { redirect_to egrupals_url, notice: 'Egrupal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_egrupal
      @egrupal = Egrupal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def egrupal_params
      params.require(:egrupal).permit(:persona_id, :impreso_id)
    end
end
