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

      def load_seed
        nil
      end
    end
  end
end
