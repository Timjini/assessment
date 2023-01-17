class VisualsController < ApplicationController
  before_action :set_visual, only: %i[ show edit update destroy ]
  before_action :authenticate_user! , except: [:index, :show]

  # GET /visuals or /visuals.json
  def index
    @visuals = Visual.all
  end

  # GET /visuals/1 or /visuals/1.json
  def show
    @comments = @visual.comments.order("created_at DESC")
  end

  # GET /visuals/new
  def new
    @visual = Visual.new
  end

  # GET /visuals/1/edit
  def edit
  end

  # POST /visuals or /visuals.json
  def create
    @visual = Visual.new(visual_params)
    @visual.user = current_user

    respond_to do |format|
      if @visual.save
        format.html { redirect_to root_path, notice: "Visual was successfully created." }
        format.json { render :show, status: :created, location: @visual }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @visual.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visuals/1 or /visuals/1.json
  def update
    respond_to do |format|
      if @visual.update(visual_params)
        format.html { redirect_to visual_url(@visual), notice: "Visual was successfully updated." }
        format.json { render :show, status: :ok, location: @visual }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @visual.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visuals/1 or /visuals/1.json
  def destroy
    @visual.destroy

    respond_to do |format|
      format.html { redirect_to visuals_url, notice: "Visual was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visual
      @visual = Visual.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def visual_params
      params.require(:visual).permit(:image)
    end
end
