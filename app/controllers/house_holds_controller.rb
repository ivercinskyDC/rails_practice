class HouseHoldsController < ApplicationController
  before_action :set_house_hold, only: [:show, :edit, :update, :destroy]

  # GET /house_holds
  # GET /house_holds.json
  def index
    @house_holds_master = HouseHold.where(:master => current_user)
    @house_holds_member = current_user.house_holds
    @house_holds = @house_holds_master.to_a.concat @house_holds_member.to_a
    @house_holds.uniq!
  end

  # GET /house_holds/1
  # GET /house_holds/1.json
  def show
  end

  # GET /house_holds/new
  def new
    @house_hold = HouseHold.new
    @users = User.where.not(:id => current_user    ).to_a.collect { |u| [u.email, u.id]}

  end

  # GET /house_holds/1/edit
  def edit
  end

  # POST /house_holds
  # POST /house_holds.json
  def create
    @house_hold = HouseHold.new(house_hold_params)
    @house_hold.master = current_user
    @house_hold.users << current_user

    respond_to do |format|
      if @house_hold.save
        format.html { redirect_to @house_hold, notice: 'House hold was successfully created.' }
        format.json { render :show, status: :created, location: @house_hold }
      else
        format.html { render :new }
        format.json { render json: @house_hold.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /house_holds/1
  # PATCH/PUT /house_holds/1.json
  def update
    respond_to do |format|
      if @house_hold.update(house_hold_params)
        format.html { redirect_to @house_hold, notice: 'House hold was successfully updated.' }
        format.json { render :show, status: :ok, location: @house_hold }
      else
        format.html { render :edit }
        format.json { render json: @house_hold.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /house_holds/1
  # DELETE /house_holds/1.json
  def destroy
    @house_hold.destroy
    respond_to do |format|
      format.html { redirect_to house_holds_url, notice: 'House hold was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house_hold
      @house_hold = HouseHold.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_hold_params
      params.require(:house_hold).permit(:name, :description, {:user_ids => []})
    end
end
