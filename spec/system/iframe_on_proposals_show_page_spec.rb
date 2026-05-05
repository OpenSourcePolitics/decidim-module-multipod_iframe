# frozen_string_literal: true

require "spec_helper"

# rubocop:disable RSpec/DescribeClass
describe "Proposal show page" do
  # rubocop:enable RSpec/DescribeClass
  include_context "with a component"

  let!(:manifest_name) { "proposals" }
  let(:organization) { create(:organization) }
  let(:participatory_process) { create(:participatory_process, organization:) }
  let!(:component) { create(:proposal_component, participatory_space: participatory_process) }
  let!(:proposal) { create(:proposal, :published, component:) }
  let(:proposal_title) { translated(proposal.title) }

  context "when proposal component enables iframe" do
    let!(:string) { decidim_sanitize_translated(proposal.title) + decidim_sanitize_translated(proposal.body) }

    before do
      component.update!(settings: { enable_iframe: true, iframe_url: "https://api.multipod.weblyzard.com" })
      visit_component
      click_on proposal_title
    end

    it "shows the iframe on the proposal show page aside" do
      expect(page).to have_content(proposal_title)
      expect(page).to have_content(strip_tags(translated(proposal.body)).strip)
      within "aside.layout-item__aside" do
        expect(page).to have_css("section.proposal-iframe", count: 1)
        expect(page).to have_css("iframe")
      end
    end
  end

  context "when proposal component does not enable iframe" do
    before do
      visit_component
      click_on proposal_title
    end

    it "does not show the iframe on the proposal show page aside" do
      expect(page).to have_content(proposal_title)
      expect(page).to have_content(strip_tags(translated(proposal.body)).strip)
      within "aside.layout-item__aside" do
        expect(page).to have_no_css("section.proposal-iframe")
        expect(page).to have_no_css("iframe")
      end
    end
  end
end
