{ ... }:
{
  flake.nixosModules.firefox = (
    { user, ... }:
    {
      home-manager.users.${user.name} =
        { config, ... }:
        {
          programs.firefox = {
            enable = true;

            configPath = "${config.xdg.configHome}/mozilla/firefox";

            profiles.default = {
              settings = {
                "sidebar.revamp" = true;
                "sidebar.verticalTabs" = true;
                "sidebar.position_start" = false;
              };
            };

            policies = {
              AutofillAddressEnabled = false;
              AutofillCreditCardEnabled = false;
              DisableFirefoxAccounts = true;
              DisableFirefoxStudies = true;
              DisablePocket = true;
              DisableSetDesktopBackground = true;
              DisableTelemetry = true;
              DontCheckDefaultBrowser = true;

              ExtensionSettings = {
                "@testpilot-containers" = {
                  "installation_mode" = "normal_installed";
                  "install_url" =
                    "https://addons.mozilla.org/firefox/downloads/latest/multi-account-containers/latest.xpi";
                };
                "uBlock0@raymondhill.net" = {
                  "installation_mode" = "normal_installed";
                  "install_url" =
                    "https://addons.mozilla.org/firefox/downloads/latest/uBlock0@raymondhill.net/latest.xpi";
                };
              };

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
                "browser.contentblocking.category" = "strict";
                "network.trr.mode" = 3;
                "network.trr.uri" = "https://base.dns.mullvad.net/dns-query";
                "network.trr.bootstrapAddress" = "194.242.2.4";
                "privacy.antitracking.enableWebcompat" = true;
                "browser.aboutConfig.showWarning" = false;
                "browser.newtabpage.activity-stream.feeds.topsites" = false;
                "browser.toolbars.bookmarks.visibility" = "always";
                "findbar.highlightAll" = true;
                "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
                "trailhead.firstrun.didSeeAboutWelcome" = true;
              };
              PromptForDownloadLocation = false;
              SearchSuggestEnabled = false;
              UserMessaging = {
                ExtensionRecommendations = false;
                FeatureRecommendations = false;
                FirefoxLabs = false;
                Locked = false;
                MoreFromMozilla = false;
                SkipOnboarding = true;
              };
            };
          };
        };
    }
  );
}
