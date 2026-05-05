# frozen_string_literal: true

module Decidim
  module MultipodIframe
    module IframeProposalHelper
      def iframe_src(proposal)
        content = decidim_sanitize_translated(proposal.title) + decidim_sanitize_translated(proposal.body)
        content = CGI.escape(content).first(1000)
        url = current_component.settings.iframe_url
        url.include?("?") ? url + "&similarto=#{content}" : url + "?similarto=#{content}"
      end
    end
  end
end
