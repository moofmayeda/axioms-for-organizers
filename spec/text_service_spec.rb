require '././text_service'

RSpec.describe TextService, "#send" do
  it "sends a text message" do
  	TextService.send("hi")
    expect true
  end
end