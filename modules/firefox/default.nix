{ ... }:
{
  flake.nixosModules.firefox = (
    { pkgs, user, ... }:
    let
      userContent = pkgs.writeText "firefox-userContent.css" ''
        @-moz-document url("about:home"), url("about:newtab") {
          body {
            background-color: #fafafa !important;
          }
          @media (prefers-color-scheme: dark) {
            body {
              background-color: #2e2e32 !important;
            }
          }
        }
      '';
    in
    {
      programs.firefox = {
        enable = true;
        preferences = {
          "widget.use-xdg-desktop-portal.settings" = 1;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

          "browser.contentblocking.category" = "strict";
          "dom.security.https_only_mode" = true;
          "privacy.fingerprintingProtection" = true;
          "privacy.bounceTrackingProtection.mode" = 1;
          "signon.rememberSignons" = false;
          "network.dns.disablePrefetch" = true;
          "network.dns.disablePrefetchFromHTTPS" = true;
          "network.prefetch-next" = false;
          "network.predictor.enabled" = false;
          "network.predictor.enable-prefetch" = false;
          "network.http.speculative-parallel-limit" = 0;
          "browser.places.speculativeConnect.enabled" = false;
          "network.proxy.socks_remote_dns" = true;
          "network.file.disable_unc_paths" = true;
          "network.gio.supported-protocols" = "";
          "network.captive-portal-service.enabled" = false;
          "network.connectivity-service.enabled" = false;
          "captivedetect.canonicalURL" = "";

          "app.shield.optoutstudies.enabled" = false;
          "app.normandy.enabled" = false;
          "app.normandy.api_url" = "";
          "breakpad.reportURL" = "";
          "browser.tabs.crashReporting.sendReport" = false;
          "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
          "browser.safebrowsing.downloads.remote.enabled" = false;

          "browser.ai.control.default" = "blocked";
          "browser.ai.control.linkPreviewKeyPoints" = "blocked";
          "browser.ai.control.pdfjsAltText" = "blocked";
          "browser.ai.control.sidebarChatbot" = "blocked";
          "browser.ai.control.smartTabGroups" = "blocked";
          "browser.ai.control.smartWindow" = "blocked";
          "browser.ai.control.translations" = "blocked";
          "browser.ml.chat.enabled" = false;
          "browser.ml.chat.page" = false;
          "browser.ml.linkPreview.enabled" = false;
          "browser.translations.enable" = false;
          "browser.tabs.groups.smart.enabled" = false;
          "browser.tabs.groups.smart.userEnabled" = false;
          "browser.smartwindow.memories.generateFromConversation" = false;
          "browser.smartwindow.memories.generateFromHistory" = false;
          "extensions.ml.enabled" = false;
          "pdfjs.enableAltText" = false;

          "browser.newtabpage.activity-stream.showSponsored" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;
          "browser.newtabpage.activity-stream.default.sites" = "";
          "browser.newtabpage.activity-stream.system.showWeatherOptIn" = false;
          "browser.newtabpage.activity-stream.widgets.weather.enabled" = false;
          "browser.newtabpage.activity-stream.feeds.telemetry" = false;
          "browser.newtabpage.activity-stream.telemetry" = false;

          "sidebar.verticalTabs" = true;
          "accessibility.typeaheadfind.flashBar" = 0;

          "browser.urlbar.speculativeConnect.enabled" = false;
          "browser.urlbar.quicksuggest.enabled" = false;
          "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
          "browser.urlbar.suggest.quicksuggest.sponsored" = false;
          "browser.urlbar.suggest.searches" = false;
          "browser.search.suggest.enabled" = false;
          "browser.urlbar.trending.featureGate" = false;
          "browser.urlbar.addons.featureGate" = false;
          "browser.urlbar.amp.featureGate" = false;
          "browser.urlbar.fakespot.featureGate" = false;
          "browser.urlbar.mdn.featureGate" = false;
          "browser.urlbar.weather.featureGate" = false;
          "browser.urlbar.wikipedia.featureGate" = false;
          "browser.urlbar.yelp.featureGate" = false;

          "browser.formfill.enable" = false;
          "browser.search.separatePrivateDefault" = true;
          "browser.search.separatePrivateDefault.ui.enabled" = true;
          "signon.autofillForms" = false;
          "signon.formlessCapture.enabled" = false;

          "network.auth.subresource-http-auth-allow" = 1;
          "browser.cache.disk.enable" = false;
          "browser.privatebrowsing.forceMediaMemoryCache" = true;
          "media.memory_cache_max_size" = 65536;
          "browser.sessionstore.privacy_level" = 2;
          "toolkit.winRegisterApplicationRestart" = false;
          "browser.shell.shortcutFavicons" = false;

          "security.ssl.require_safe_negotiation" = true;
          "security.tls.enable_0rtt_data" = false;
          "security.OCSP.enabled" = 1;
          "security.OCSP.require" = true;
          "security.cert_pinning.enforcement_level" = 2;
          "security.remote_settings.crlite_filters.enabled" = true;
          "security.pki.crlite_mode" = 2;
          "dom.security.https_only_mode_send_http_background_request" = false;
          "security.ssl.treat_unsafe_negotiation_as_broken" = true;
          "browser.xul.error_pages.expert_bad_cert" = true;
          "network.http.referer.XOriginTrimmingPolicy" = 2;

          "privacy.userContext.enabled" = true;
          "privacy.userContext.ui.enabled" = true;
          "media.peerconnection.ice.proxy_only_if_behind_proxy" = true;
          "media.peerconnection.ice.default_address_only" = true;
          "dom.disable_window_move_resize" = true;
          "browser.uitour.enabled" = false;
          "devtools.debugger.remote-enabled" = false;
          "permissions.manager.defaultsUrl" = "";
          "network.IDN_show_punycode" = true;
          "pdfjs.disabled" = false;
          "pdfjs.enableScripting" = false;
          "browser.tabs.searchclipboardfor.middleclick" = false;
          "browser.contentanalysis.enabled" = false;
          "browser.contentanalysis.default_result" = 0;
          "security.csp.reporting.enabled" = false;

          "datareporting.policy.dataSubmissionEnabled" = false;
          "datareporting.healthreport.uploadEnabled" = false;
          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.server" = "data:,";
          "toolkit.telemetry.archive.enabled" = false;
          "toolkit.telemetry.newProfilePing.enabled" = false;
          "toolkit.telemetry.shutdownPingSender.enabled" = false;
          "toolkit.telemetry.updatePing.enabled" = false;
          "toolkit.telemetry.bhrPing.enabled" = false;
          "toolkit.telemetry.firstShutdownPing.enabled" = false;
          "toolkit.telemetry.coverage.opt-out" = true;
          "toolkit.coverage.opt-out" = true;
          "toolkit.coverage.endpoint.base" = "";
          "browser.discovery.enabled" = false;
          "extensions.getAddons.showPane" = false;
          "extensions.htmlaboutaddons.recommendations.enabled" = false;

          "geo.provider.ms-windows-location" = false;
          "geo.provider.use_corelocation" = false;
          "geo.provider.use_geoclue" = false;
        };
      };

      home-manager.users.${user.name} = (
        { lib, ... }:
        {
          home.activation.firefoxUserContent = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
            for dir in "${user.homeDirectory}/.config/mozilla/firefox"/*/; do
              [ -f "$dir/prefs.js" ] || continue
              run mkdir -p "$dir/chrome"
              run install -m 644 ${userContent} "$dir/chrome/userContent.css"
            done
          '';
        }
      );
    }
  );
}
