# frozen_string_literal: true

require "decidim/dev"

ENV["ENGINE_ROOT"] = File.dirname(__dir__)

Decidim::Dev.dummy_app_path = File.expand_path(File.join("spec", "decidim_dummy_app"))

require "decidim/dev/test/base_spec_helper"

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by(:selenium_chrome_headless)

    domain = (try(:organization) || try(:current_organization))&.host
    if domain
      # JavaScript sets the cookie also for all subdomains but localhost is a special case
      domain = ".#{domain}" unless domain == "localhost"

      page.driver.browser.execute_cdp(
        "Network.setCookie",
        domain:,
        name: Decidim.consent_cookie_name,
        value: { essential: true, analytics: true, marketing: true, preferences: true }.to_json,
        path: "/",
        expires: 1.day.from_now.to_i,
        same_site: "Lax"
      )
    end
  end
end
