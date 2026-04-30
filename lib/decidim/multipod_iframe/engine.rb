# frozen_string_literal: true

require "rails"
require "decidim/core"

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

      initializer "MultipodIframe.webpacker.assets_path" do
        Decidim.register_assets_path File.expand_path("app/packs", root)
      end
    end
  end
end
