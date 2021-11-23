require "spec_helper"

describe ApplicationController do
  let(:app) { ApplicationController.new }

  context "GET to /" do
    let(:response) { get "/" }
    it "returns status 200 OK" do 
      expect(response).to be_ok
    end
  end
end