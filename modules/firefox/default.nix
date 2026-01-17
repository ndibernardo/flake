{ ... }:
let
  lock = value: {
    Value = value;
    Status = "locked";
  };
in
{
  programs.firefox = {
    enable = true;
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
        "browser.aboutConfig.showWarning" = lock false;
        "browser.contentblocking.category" = lock "strict";
        "browser.newtabpage.activity-stream.feeds.topsites" = lock false;
        "browser.newtabpage.activity-stream.showSponsored" = lock false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock false;
        "browser.toolbars.bookmarks.visibility" = lock "always";
        "findbar.highlightAll" = lock true;
        "geo.enabled" = lock false;
        "layout.css.prefers-color-scheme.content-override" = lock 0;
        "media.peerconnection.ice.default_address_only" = lock true;
        "media.peerconnection.ice.no_host" = lock true;
        "network.dns.disablePrefetch" = lock true;
        "network.http.referer.XOriginTrimmingPolicy" = lock 2;
        "network.predictor.enabled" = lock false;
        "network.prefetch-next" = lock false;
        "privacy.donottrackheader.enabled" = lock true;
        "privacy.partition.network_state.ocsp_cache" = lock true;
        "privacy.resistFingerprinting" = lock true;
        "privacy.trackingprotection.enabled" = lock true;
        "privacy.trackingprotection.socialtracking.enabled" = lock true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = lock true;
        "trailhead.firstrun.didSeeAboutWelcome" = lock true;
        "webgl.disabled" = lock true;
      };
      PromptForDownloadLocation = false;
      SearchSuggestEnabled = false;
      UserMessaging = {
        ExtensionRecommendations = false;
        SkipOnboarding = true;
      };
    };
    profiles.default = {
      settings = {
        "privacy.userContext.enabled" = true;
        "privacy.userContext.ui.enabled" = true;
      };
    };
  };
}
