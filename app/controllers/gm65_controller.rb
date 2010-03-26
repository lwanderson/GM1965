class Gm65Controller < ApplicationController

  def index
  end

  def gm65index
  end

  def register
    if @registration.nil?
      @registration = Registration.new
    end
  end

  def reg_error
    error_msgs = []
    errors = params[:errors]
    if errors.is_a?(String)
      error_msgs << errors
    elsif errors.is_a?(Array)
      error_msgs = errors
    end
    @error_messages = "<div class='errors'>"
    @error_messages << error_msgs.join(".<br>")
    @error_messages << "</div>"
  end

  def members
  end

  def reunions
  end

  def signin
  end

  def memoriam
  end

  def thanks
  end

  def member_randr
  end

end

