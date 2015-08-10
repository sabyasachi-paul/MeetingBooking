class HolidaysController < ApplicationController
  def create
    @holiday = Holiday.new
    @holiday.date = params["date"].to_date
    @holiday.is_enabled = params["is_enabled"]

    respond_to do |format|
      if @holiday.valid?
        if @holiday.save
          flash[:success] = 'Holiday was successfully created.'
          format.html { redirect_to "/welcome/admin"}
        else
          flash[:danger] = 'Holiday creation failed!!!'
          format.html { redirect_to "/welcome/admin" }
        end
      else
        flash[:notice] = 'Holiday creation failed!!! Date already declared as holiday'
        format.html { redirect_to "/welcome/admin" }
      end
    end
  end

  def edit
    @holiday = Holiday.find(params["id"])
    @holiday.date = params["date"]
    @holiday.is_enabled = params["is_enabled"]
    respond_to do |format|
      if @holiday.valid?
        if @holiday.save
          flash[:success] = 'Holiday was successfully updated.'
          format.html { redirect_to "/welcome/admin"}
        else
          flash[:danger] = 'Holiday updation failed!!!'
          format.html { redirect_to "/welcome/admin" }
        end
      else
        flash[:notice] = 'Holiday updation failed!!! Date already declared as holiday'
        format.html { redirect_to "/welcome/admin" }
      end
    end
  end
end
