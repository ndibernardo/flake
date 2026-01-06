{ ... }:
{
  programs.firefox = {
    enable = true;
    profiles.default = {
      settings = {
        "privacy.userContext.enabled" = true;
        "privacy.userContext.ui.enabled" = true;
      };
    };

    policies = {
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableSetDesktopBackground = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      FirefoxHome = {
        Highlights = false;
        Pocket = false;
        Search = true;
        Snippets = false;
      };
      GenerativeAI = {
        Chatbot = false;
        Enabled = false;
        LinkPreviews = false;
        Locked = true;
        TabGroups = false;
      };
      HttpsOnlyMode = "force_enabled";
      NetworkPrediction = false;
      NewTabPage = false;
      OfferToSaveLogins = false;
      Preferences = {
        "browser.aboutConfig.showWarning" = {
          Value = false;
          Status = "locked";
        };
        "browser.newtabpage.activity-stream.feeds.topsites" = {
          Value = false;
          Status = "locked";
        };
        "browser.toolbars.bookmarks.visibility" = {
          Value = "always";
          Status = "locked";
        };
        "findbar.highlightAll" = {
          Value = true;
          Status = "locked";
        };
        "toolkit.legacyUserProfileCustomizations.stylesheets" = {
          Value = true;
          Status = "locked";
        };
        "trailhead.firstrun.didSeeAboutWelcome" = {
          Value = true;
          Status = "locked";
        };
        "ui.systemUsesDarkTheme" = {
          Value = 1;
          Status = "locked";
        };
        "layout.css.prefers-color-scheme.content-override" = {
          Value = 0;
          Status = "locked";
        };
        "privacy.resistFingerprinting" = {
          Value = true;
          Status = "locked";
        };
        "privacy.trackingprotection.enabled" = {
          Value = true;
          Status = "locked";
        };
        "privacy.trackingprotection.socialtracking.enabled" = {
          Value = true;
          Status = "locked";
        };
        "privacy.donottrackheader.enabled" = {
          Value = true;
          Status = "locked";
        };
        "privacy.partition.network_state.ocsp_cache" = {
          Value = true;
          Status = "locked";
        };
        "media.peerconnection.ice.default_address_only" = {
          Value = true;
          Status = "locked";
        };
        "media.peerconnection.ice.no_host" = {
          Value = true;
          Status = "locked";
        };
        "geo.enabled" = {
          Value = false;
          Status = "locked";
        };
        "webgl.disabled" = {
          Value = true;
          Status = "locked";
        };
        "network.dns.disablePrefetch" = {
          Value = true;
          Status = "locked";
        };
        "network.prefetch-next" = {
          Value = false;
          Status = "locked";
        };
        "network.predictor.enabled" = {
          Value = false;
          Status = "locked";
        };
        "network.http.referer.XOriginTrimmingPolicy" = {
          Value = 2;
          Status = "locked";
        };
        "browser.newtabpage.activity-stream.showSponsored" = {
          Value = false;
          Status = "locked";
        };
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = {
          Value = false;
          Status = "locked";
        };
        "browser.contentblocking.category" = {
          Value = "strict";
          Status = "locked";
        };
      };
      PromptForDownloadLocation = false;
      SearchSuggestEnabled = false;
      UserMessaging = {
        ExtensionRecommendations = false;
        SkipOnboarding = true;
      };
    };
  };
}
