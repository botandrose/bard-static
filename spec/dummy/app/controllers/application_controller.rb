class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def before_bard_static
    @notes = "BEFORE CARPENTRY"
  end
end
