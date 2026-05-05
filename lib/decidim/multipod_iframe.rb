# frozen_string_literal: true

require "decidim/multipod_iframe/admin"
require "decidim/multipod_iframe/engine"
require "decidim/multipod_iframe/admin_engine"

module Decidim
  # This namespace holds the logic of the `MultipodIframe` component. This component
  # allows users to create multipod_iframe in a participatory space.
  module MultipodIframe
    include ActiveSupport::Configurable

    config_accessor :deface_enabled do
      ENV.fetch("DEFACE_ENABLED", nil) == "true" || Rails.env.test?
    end
  end
end
