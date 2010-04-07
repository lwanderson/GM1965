class Error
  attr_reader :controller_name, :action, :type, :details
  
  def initialize(controller, exception, details=nil)
    @controller_name = controller.controller_name.singularize.capitalize
    @action = controller.action_name.capitalize
    if exception.respond_to?(:message, false)
      @type = exception.class.to_s.split('::').last
      @details = exception.message
    elsif exception.is_a? String
      @type = exception
      @details = details
    end

    log_self
  end

  def log_self
    Rails.logger.error "***Error*** #{to_s}"
  end

  def to_s
    "#{@controller_name}.#{@action.downcase} error type: #{@type} details: #{@details}"
  end
end
