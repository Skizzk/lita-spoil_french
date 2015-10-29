require "spec_helper"

describe Lita::Handlers::SpoilFrench, lita_handler: true do
  it { is_expected.to route_command("spoil").to (:spoil) }

  subject do
    send_command("spoil")
  end

  before do
    subject
  end

  it "gives a random spoil" do
    expect(replies.last).to match(/en fait à la fin/)
  end

  describe "with title" do
    subject do
      send_command("spoil -t")
    end

    it "gives a spoil with its title" do
      expect(replies.last).to match(/.*\s-\s.*en fait à la fin/)
    end
  end

  describe "with id" do
    subject do
      send_command("spoil fc4")
    end

    it "recalls the right spoil" do
      expect(replies.last).to include("Et en fait à la fin, Tyler Durden c'est le narrateur.")
      expect(replies.last).to include("fc4")
    end
  end
end
