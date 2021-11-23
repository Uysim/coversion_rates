require "spec_helper"

describe ConversionRatesApp do
  let(:app) { ConversionRatesApp.new }

  context "GET to /" do
    let(:response) { get "/" }
    it "returns status 200 OK" do 
      expect(response).to be_ok
    end
  end
end