class WelcomeController < ApplicationController
  def index
    @houses = current_user.house_holds

    @services = current_user.services
    @expenses = current_user.expenses
    @house_expenses = current_user.admin_houses.first.expenses
    current_user.admin_houses.each do |ah|
      @house_expenses << ah.expenses
    end

    current_user.house_holds.each do |ah|
      @house_expenses << ah.expenses
    end
  end
end
