# frozen_string_literal: true

class BaseController < ApplicationController
  protect_from_forgery with: :exception, unless: -> { Rails.env.test? }
end
