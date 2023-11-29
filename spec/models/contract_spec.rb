require "rails_helper"

RSpec.describe Contract, type: :model do
  describe "creation" do
    it "can be created with today as the signature date" do
      contract = Contract.create!
      expect(contract.signature_date).to eq(Date.today)
    end

    it "can be created with a custom signature date" do
      contract = Contract.create!(signature_date: Date.yesterday)
      expect(contract.signature_date).to eq(Date.yesterday)
    end
  end
end
