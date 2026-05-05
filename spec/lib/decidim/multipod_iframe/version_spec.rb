# frozen_string_literal: true

require "spec_helper"

module Decidim
  describe MultipodIframe do
    subject { described_class }

    it "has decidim version" do
      expect(subject.decidim_version).to eq("~> 0.29")
    end

    it "has version" do
      expect(subject.version).to eq("1.0.0")
    end
  end
end
