class MenController < ApplicationController
  before_action :set_man, only: %i[ show edit update destroy ]

  # GET /men or /men.json
  def index
    @men = Man.all
  end

  # GET /men/1 or /men/1.json
  def show
  end

  # GET /men/new
  def new
    @man = Man.new
  end

  # GET /men/1/edit
  def edit
  end

  # POST /men or /men.json
  def create
    @man = Man.new(man_params)

    respond_to do |format|
      if @man.save
        format.html { redirect_to man_url(@man), notice: "Man was successfully created." }
        format.json { render :show, status: :created, location: @man }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @man.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /men/1 or /men/1.json
  def update
    respond_to do |format|
      if @man.update(man_params)
        format.html { redirect_to man_url(@man), notice: "Man was successfully updated." }
        format.json { render :show, status: :ok, location: @man }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @man.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /men/1 or /men/1.json
  def destroy
    @man.destroy

    respond_to do |format|
      format.html { redirect_to men_url, notice: "Man was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_man
      @man = Man.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def man_params
      params.require(:man).permit(:name, :age)
    end
end
