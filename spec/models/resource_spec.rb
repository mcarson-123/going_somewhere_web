require "rails_helper"

RSpec.describe Resource do

  class FakeKlass < Resource
    attr_accessor :animal
  end

  let(:conn) { double(:conn) }

  before do
    allow(FakeKlass).to receive(:conn) { conn }
  end

  describe "#get_all" do
    before do
      response_json = double(:json, body: { "data" => [{ "animal" => "cat" },
                                                        { "animal" => "dog" }] }.to_json)
      allow(conn).to receive(:get).with("/fakeklasses") { response_json }
    end

    it "returns an array with the requested objects" do
      objects = FakeKlass.get_all
      expect(objects.size).to eql(2)
      expect(objects.first).to be_instance_of(FakeKlass)
      expect(objects.second).to be_instance_of(FakeKlass)

      expect(objects.first.animal).to eql("cat")
      expect(objects.second.animal).to eql("dog")
    end
  end

  describe "#get_by_id" do
    before do
      response_json = double(:json, body: { "animal" => "cat" }.to_json)
      allow(conn).to receive(:get).with("/fakeklasses/1") { response_json }
    end

    it "returns the requested object" do
      obj = FakeKlass.find_by_id(1)
      expect(obj).to be_instance_of(FakeKlass)
      expect(obj.animal).to eql("cat")
    end
  end

  describe "#create" do
    before do
      response_json = double(:json, body: { "animal" => "cat" }.to_json)
      allow(conn).to receive(:post).with("/fakeklasses", { data: { animal: "cat" } })
        .and_return(response_json)
    end

    it "creates the requested object" do
      obj = FakeKlass.create({animal: "cat"})
      expect(obj).to be_instance_of(FakeKlass)
      expect(obj.animal).to eql("cat")
    end
  end

end
