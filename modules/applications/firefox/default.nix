{
  flake.nixosModules.applications-firefox =
    { config, lib, ... }:
    let
      cfg = config.applications.firefox;
    in
    {
      options.applications.firefox.enable = lib.mkEnableOption "Firefox with hardened defaults";

      config = lib.mkIf cfg.enable {
        programs.firefox = {
          enable = true;
          policies = {
            AutofillAddressEnabled = false;
            AutofillCreditCardEnabled = false;
            CaptivePortal = false;

            Containers.Default = [
              {
                name = "Google";
                icon = "fence";
                color = "blue";
              }
              {
                name = "YouTube";
                icon = "fence";
                color = "red";
              }
              {
                name = "X";
                icon = "fence";
                color = "blue";
              }
            ];

            Cookies = {
              Behavior = "reject-tracker-and-partition-foreign";
              BehaviorPrivateBrowsing = "reject-tracker-and-partition-foreign";
              Locked = true;
            };

            DisableFirefoxAccounts = false;
            DisableFirefoxStudies = true;
            DisableFormHistory = true;
            DisablePocket = true;
            DisableRemoteImprovements = true;
            DisableSecurityBypass = {
              InvalidCertificate = false;
              SafeBrowsing = true;
            };
            DisableSetDesktopBackground = true;
            DisableTelemetry = true;
            DontCheckDefaultBrowser = true;

            EnableTrackingProtection = {
              Category = "strict";
              Locked = true;
              BaselineExceptions = true;
              ConvenienceExceptions = false;
            };

            ExtensionSettings = {
              "{d634138d-c276-4fc8-924b-40a0ea21d284}" = {
                installation_mode = "normal_installed";
                install_url = "https://addons.mozilla.org/firefox/downloads/latest/1password-x-password-manager/latest.xpi";
              };
              "uBlock0@raymondhill.net" = {
                installation_mode = "normal_installed";
                install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
              };
            };

            FirefoxHome = {
              Search = true;
              TopSites = false;
              SponsoredTopSites = false;
              Highlights = false;
              Pocket = false;
              Stories = false;
              SponsoredPocket = false;
              SponsoredStories = false;
              Snippets = false;
              Locked = true;
            };

            FirefoxSuggest = {
              WebSuggestions = false;
              SponsoredSuggestions = false;
              ImproveSuggest = false;
              Locked = true;
            };

            GenerativeAI = {
              Enabled = false;
              Chatbot = false;
              LinkPreviews = false;
              TabGroups = false;
              Locked = true;
            };

            HttpsOnlyMode = "force_enabled";
            IPProtectionAvailable = false;
            NetworkPrediction = false;
            OfferToSaveLogins = false;
            PostQuantumKeyAgreementEnabled = true;
            SearchSuggestEnabled = false;

            UserMessaging = {
              ExtensionRecommendations = false;
              FeatureRecommendations = false;
              UrlbarInterventions = false;
              SkipOnboarding = true;
              MoreFromMozilla = false;
              FirefoxLabs = false;
              Locked = true;
            };

            VisualSearchEnabled = false;
          };

          preferencesStatus = "locked";
          preferences = {
            "accessibility.typeaheadfind.flashBar" = 0;
            "browser.cache.disk.enable" = false;
            "browser.contentanalysis.enabled" = false;
            "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
            "browser.discovery.enabled" = false;
            "browser.newtabpage.activity-stream.system.showWeatherOptIn" = false;
            "browser.newtabpage.activity-stream.widgets.weather.enabled" = false;
            "browser.places.speculativeConnect.enabled" = false;
            "browser.privatebrowsing.forceMediaMemoryCache" = true;
            "browser.search.separatePrivateDefault" = true;
            "browser.search.separatePrivateDefault.ui.enabled" = true;
            "browser.sessionstore.privacy_level" = 2;
            "browser.tabs.crashReporting.sendReport" = false;
            "browser.tabs.searchclipboardfor.middleclick" = false;
            "browser.translations.enable" = false;
            "browser.uitour.enabled" = false;
            "browser.urlbar.speculativeConnect.enabled" = false;
            "devtools.debugger.remote-enabled" = false;
            "dom.disable_window_move_resize" = true;
            "dom.security.https_only_mode_send_http_background_request" = false;
            "extensions.getAddons.showPane" = false;
            "extensions.htmlaboutaddons.recommendations.enabled" = false;
            "geo.provider.use_geoclue" = false;
            "media.memory_cache_max_size" = 65536;
            "media.peerconnection.ice.default_address_only" = true;
            "media.peerconnection.ice.proxy_only_if_behind_proxy" = true;
            "network.auth.subresource-http-auth-allow" = 1;
            "network.connectivity-service.enabled" = false;
            "network.dns.disablePrefetch" = true;
            "network.dns.disablePrefetchFromHTTPS" = true;
            "network.file.disable_unc_paths" = true;
            "network.gio.supported-protocols" = "";
            "network.http.referer.XOriginTrimmingPolicy" = 2;
            "network.http.speculative-parallel-limit" = 0;
            "network.prefetch-next" = false;
            "network.proxy.socks_remote_dns" = true;
            "pdfjs.enableAltText" = false;
            "pdfjs.enableScripting" = false;
            "privacy.globalprivacycontrol.enabled" = true;
            "privacy.userContext.enabled" = true;
            "privacy.userContext.ui.enabled" = true;
            "security.csp.reporting.enabled" = false;
            "security.OCSP.enabled" = 1;
            "security.OCSP.require" = true;
            "services.sync.engine.prefs" = true;
            "services.sync.prefs.dangerously_allow_arbitrary" = false;
            "sidebar.verticalTabs" = false;
            "signon.autofillForms" = false;
            "signon.formlessCapture.enabled" = false;
            "widget.use-xdg-desktop-portal.settings" = 1;
          };

          autoConfig = ''
            lockPref("security.cert_pinning.enforcement_level", 2);
            lockPref("security.pki.crlite_mode", 2);
            lockPref("security.remote_settings.crlite_filters.enabled", true);
            lockPref("security.ssl.require_safe_negotiation", true);
            lockPref("security.ssl.treat_unsafe_negotiation_as_broken", true);
            lockPref("security.tls.enable_0rtt_data", false);
          '';
        };
      };
    };
}
