# frozen_string_literal: true

require "rails"
require "decidim/core"
require "deface"

module Decidim
  module MultipodIframe
    # This is the engine that runs on the public interface of multipod_iframe.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::MultipodIframe

      routes do
        # Add engine routes here
        # resources :multipod_iframe
        # root to: "multipod_iframe#index"
      end

      initializer "decidim-multipod_iframe.views" do
        Rails.application.configure do
          config.deface.enabled = Decidim::MultipodIframe.deface_enabled
        end
      end

      initializer "decidim-multipod_iframe.add_customizations" do
        config.to_prepare do
          # Helper
          Decidim::Proposals::ProposalsHelper.class_eval do
            include Decidim::MultipodIframe::IframeProposalHelper
          end
        end
      end

      initializer "MultipodIframe.webpacker.assets_path" do
        Decidim.register_assets_path File.expand_path("app/packs", root)
      end
    end
  end
end
