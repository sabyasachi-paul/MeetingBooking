class RoomsController < ApplicationController
  def create
    @room = Room.new
    @room.name = params["name"]
    @room.is_enabled = params["is_enabled"]

    respond_to do |format|
      if @room.valid?
        if @room.save
          flash[:success] = 'Room was successfully created.'
          format.html { redirect_to "/welcome/admin"}
        else
          flash[:notice] = 'Room creation failed!!!'
          format.html { redirect_to "/welcome/admin" }
        end
      else
        flash[:notice] = 'Room name has to be unique'
        format.html { redirect_to "/welcome/admin"}
      end
    end
  end

  def edit
    @room = Room.find(params["id"])
    @room.name = params["name"]
    @room.is_enabled = params["is_enabled"]
    respond_to do |format|
      if @room.valid?
        if @room.save
          flash[:success] = 'Room was successfully updated.'
          format.html { redirect_to "/welcome/admin"}
        else
          flash[:notice] = 'Room updation failed!!!'
          format.html { redirect_to "/welcome/admin" }
        end
      else
        flash[:notice] = 'Room updation failed!!! Name has to be unique'
        format.html { redirect_to "/welcome/admin" }
      end
    end
  end
end
