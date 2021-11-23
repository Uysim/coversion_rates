require "spec_helper"

describe RootController do
  let(:app) { RootController.new }

  context "GET to /" do
    let(:response) { get "/" }
    it "returns status 200 OK" do 
      expect(response).to be_ok
    end
  end
end