class WelcomeController < ApplicationController

  def index
    @rooms = Room.where(:is_enabled=>true)
    @holidays = Holiday.where(:is_enabled=>true)
  end

  def fetchBookings
    date = params["date"]
    room = Room.find(params["room_id"])
    h = Holiday.where("date LIKE ? AND is_enabled = ?", "%#{date}%", true)
    if h.present?
      json_data = {:type=> "Holiday", :room=> room.name, :data_object=>"Its a Holiday"}
    else
      bookings = Booking.where("start LIKE ? AND room_id=?","%#{date}%",room.id)
      x = []
      bookings.each do |b|
        u = User.find(b.user)
        x.push({:user=>u.email, :date=> b.start.strftime("%Y-%m-%d"), :start_time=>b.start.strftime("%H:%M:%S"), :end_time=>b.end.strftime("%H:%M:%S")})
      end
      json_data = {:type=> "Booking", :room=> room.name, :data_object=>x}
    end
    respond_to do |format|
      format.json { render json: json_data}
    end
  end

  def admin
    @rooms = Room.all
    @holidays = Holiday.all
    @date_array = []
    @holidays.each do |h|
      @date_array << h.date
    end
    render :admin
  end
end
