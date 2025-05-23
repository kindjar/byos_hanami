# frozen_string_literal: true

require "hanami_helper"

RSpec.describe Terminus::Actions::Devices::Delete, :db do
  subject(:action) { described_class.new }

  describe "#call" do
    let(:device) { Factory[:device] }

    it "answers success with valid parameters" do
      response = action.call id: device.id
      expect(response).to have_attributes(status: 200, body: [""])
    end

    it "answers unprocessable entity with invalid ID" do
      response = action.call Hash.new
      expect(response.status).to eq(422)
    end
  end
end
