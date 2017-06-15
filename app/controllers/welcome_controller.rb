class WelcomeController < ApplicationController
  def index
    @houses = current_user.house_holds rescue nil

    @services = current_user.services rescue nil
    @expenses = current_user.expenses rescue nil
    @house_expenses = current_user.admin_houses.first.expenses rescue nil
    begin
      current_user.admin_houses.each do |ah|
      @house_expenses << ah.expenses
      end
    rescue nil
    end
    begin
      current_user.house_holds.each do |ah|
        @house_expenses << ah.expenses
      end
    rescue nil
    end
  end
end