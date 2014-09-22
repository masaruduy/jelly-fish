require "spec_helper"

describe Task do
  describe "new" do
    let(:mail) { Task.new }

    it "renders the headers" do
      mail.subject.should eq("New")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "drop" do
    let(:mail) { Task.drop }

    it "renders the headers" do
      mail.subject.should eq("Drop")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "replace" do
    let(:mail) { Task.replace }

    it "renders the headers" do
      mail.subject.should eq("Replace")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "modify" do
    let(:mail) { Task.modify }

    it "renders the headers" do
      mail.subject.should eq("Modify")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
