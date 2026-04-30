# frozen_string_literal: true

base_path = File.expand_path("..", __dir__)

Decidim::Webpacker.register_path("#{base_path}/app/packs")
Decidim::Webpacker.register_entrypoints(
  decidim_multipod_iframe: "#{base_path}/app/packs/entrypoints/decidim_multipod_iframe.js"
)
Decidim::Webpacker.register_stylesheet_import("stylesheets/decidim/multipod_iframe/multipod_iframe")
