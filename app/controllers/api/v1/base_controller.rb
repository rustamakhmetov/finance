require "errors/rescue_error"

class Api::V1::BaseController < ApplicationController
  include Errors::RescueError

  respond_to :json
end
