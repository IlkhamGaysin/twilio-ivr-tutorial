class CallDecorator < ApplicationDecorator
  include ActiveSupport::NumberHelper

  delegate :direction, :duration

  def from
    number_to_phone(object.from, area_code: true)
  end
end
