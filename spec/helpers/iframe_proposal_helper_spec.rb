# frozen_string_literal: true

require "spec_helper"

module Decidim
  module MultipodIframe
    describe IframeProposalHelper do
      let(:component) { create(:proposal_component) }
      let!(:proposal) { create(:proposal, :published, component:) }

      before do
        helper.class.include Decidim::SanitizeHelper
        allow(helper).to receive(:current_component).and_return(component)
      end

      describe "iframe_src" do
        let!(:string) { decidim_sanitize_translated(proposal.title) + decidim_sanitize_translated(proposal.body) }

        context "when there is no query_params added in the iframe url" do
          before do
            component.update!(settings: { enable_iframe: true, iframe_url: "https://api.multipod.weblyzard.com" })
          end

          it "returns the url with similarto as query_params" do
            expect(helper.iframe_src(proposal)).to eq("https://api.multipod.weblyzard.com?similarto=#{CGI.escape(string)}")
          end
        end

        context "when there is a query_params added in the iframe url" do
          before do
            component.update!(settings: { enable_iframe: true, iframe_url: "https://api.multipod.weblyzard.com?date=2026-01-01,2026-04-30" })
          end

          it "adds similarto to the query_params list" do
            expect(helper.iframe_src(proposal)).to eq("https://api.multipod.weblyzard.com?date=2026-01-01,2026-04-30&similarto=#{CGI.escape(string)}")
          end
        end
      end
    end
  end
end
