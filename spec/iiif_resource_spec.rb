require 'spec_helper'
require 'uri'

module IIIF

  describe "Manifest" do
    describe "#new" do
      it "type is sc:Manifest" do
        r = Manifest.new()
        expect(r.type).to eq("sc:Manifest")
      end

      it "has a label" do
        r = Manifest.new()
        expect(r.label).not_to be_empty
      end

      it "keeps the label" do
        r = Manifest.new(label="foo")
        expect(r.label).to eq("foo")
      end

      it "has an id" do
        r = Manifest.new()
        expect(r.id).not_to be_empty
      end

      it "the id is a URI" do
        r = Manifest.new()
        expect(r.id =~ URI::regexp).to be_truthy
      end
    end
  end
end
