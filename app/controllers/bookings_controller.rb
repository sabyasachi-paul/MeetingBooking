class BookingsController < ApplicationController
  def create
    @booking = Booking.new
    room = Room.find(params["room"])
    startDate = (params["date"] + " " +  params["startTime"]).in_time_zone
    endDate = (params["date"] + " " +  params["endTime"]).in_time_zone
    @booking.start = startDate
    @booking.end = endDate
    @booking.room = room
    @booking.user = current_user
    @booking.type = "Booking"
    bCount = Booking.where("(? > start AND ? < end) OR (end > ? AND ? > start) OR (? < start AND ? > end)",startDate,startDate,endDate,endDate,startDate,endDate).count
    respond_to do |format|
      if bCount == 0
        if @booking.save
          flash[:success] = 'Room was successfully booked.'
          format.html { redirect_to "/"}
        else
          flash[:notice] = 'There was some error in booking the room'
          format.html { redirect_to "/"}
        end
      else
        flash[:notice] = 'Please check the booking status again... It seems the room has already been booked for the timeslot!!!'
        format.html { redirect_to "/"}
      end
    end
  end
end
