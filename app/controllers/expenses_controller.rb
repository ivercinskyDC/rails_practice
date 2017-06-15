class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show,]

  # GET /expenses
  # GET /expenses.json
  def index
    if params[:user_id].to_i != current_user.id
      redirect_to user_expenses_url(current_user)
    end
    @expenses = current_user.expenses
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
  end

  # GET /expenses/new
  def new
    if params.has_key? :house_hold_id
      @house_hold = HouseHold.find(params[:house_hold_id])
      @expense = @house_hold.expenses.build
    else
      @user = current_user
      @expense = @user.expenses.build
    end
  end

  # GET /expenses/1/edit
  def edit
    if params.has_key? :house_hold_id
      @house_hold = HouseHold.find(params[:house_hold_id])
      @expense = @house_hold.expenses.find(params[:id])
    else
      @user = current_user
      @expense = @user.expenses.find(params[:id])
    end
  end

  # POST /expenses
  # POST /expenses.json
  def create
    if params.has_key? :house_hold_id
      @house_hold = HouseHold.find(params[:house_hold_id])
      @expense = @house_hold.expenses.build(expense_params)
    else
      @user = current_user
      @expense = @user.expenses.build(expense_params)
    end
    respond_to do |format|
      if @expense.save
        if @house_hold.present?
          @parent = @house_hold
        else
          @parent = user_expenses_url(@user)
        end

        format.html { redirect_to @parent, notice: 'Expense was successfully created.' }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update
    if params.has_key? :house_hold_id
      @house_hold = HouseHold.find(params[:house_hold_id])
      @expense = @house_hold.expenses.find(params[:id])
    else
      @user = current_user
      @expense = @user.expenses.find(params[:id])
    end
    respond_to do |format|
      if @expense.update(expense_params)
        if @house_hold.present?
          @parent = @house_hold
        else
          @parent = user_expenses_url(@user)
        end
        format.html { redirect_to @parent, notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    if params.has_key? :house_hold_id
      @house_hold = HouseHold.find(params[:house_hold_id])
      @expense = @house_hold.expenses.find(params[:id])
      @parent = @house_hold
    else
      @user = User.find(params[:user_id])
      @expense = @user.expenses.find(params[:id])
      @parent = user_expenses_url(@user)
    end
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to @parent, notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
      def set_expense
        @expense = Expense.find(params[:id])
        rescue ActiveRecord::RecordNotFound
          flash[:notice] = "Expense not Found"
          redirect_to :action => 'index'
        end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
      params.require(:expense).permit(:expense_date, :name, :amount, :description, :place)
    end

    def get_expense(params)
      #if params has user?
      if params.has_key? :house_hold_id
        @expense = HouseHold.find(params[:house_hold_id]).expenses.build
      else
        @expense = current_user.expenses.build
      end

      #else if params has house_hold
      #else fail bad request
    end
end
