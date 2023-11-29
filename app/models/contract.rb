class Contract < ApplicationRecord
  def initialize(...)
    super(...)
    self.signature_date ||= Date.today
  end
end
