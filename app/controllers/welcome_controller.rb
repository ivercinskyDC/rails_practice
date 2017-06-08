class WelcomeController < ApplicationController
  def index
    @houses = HouseHold.where(:master_id => current_user)
    @services = Service.where(:asignee_id => current_user)
    @expenses = Expense.where(:users_id => current_user)
    @house_expenses = []
    @houses.each do |house|
      expense = Expense.where(:house_holds_id => house.id).first
      @house_expenses << expense unless expense.nil?
    end
  end
end
