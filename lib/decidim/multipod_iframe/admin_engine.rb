# frozen_string_literal: true

module Decidim
  module MultipodIframe
    # This is the engine that runs on the public interface of `MultipodIframe`.
    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::MultipodIframe::Admin

      paths["db/migrate"] = nil
      paths["lib/tasks"] = nil

      routes do
        # Add admin engine routes here
        # resources :multipod_iframe do
        #   collection do
        #     resources :exports, only: [:create]
        #   end
        # end
        # root to: "multipod_iframe#index"
      end
      initializer "decidim-dataspace.add_proposal_component_settings" do
        manifest = Decidim.find_component_manifest("proposals")
        manifest.settings(:global) do |settings|
          settings.attribute :enable_iframe, type: :boolean, default: false
          settings.attribute :iframe_url, type: :string
        end
      end

      def load_seed
        nil
      end
    end
  end
end
