{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    profiles.default = {
      search = {
        default = "HTMLDuckDuckGo";
        engines = {
          "bing".metaData.hidden = true;
          "ddg".metaData.hidden = true;

          "HTMLDuckDuckGo" = {
            urls = [
              {
                template = "https://html.duckduckgo.com/html";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.fetchurl {
              url = "https://duckduckgo.com/assets/logo_header.v109.svg";
              sha256 = "a552810b288ab1511f5ad547957de90d44b4245c364b60a2a90a437532e16f21";
            }}";
          };
        };
        force = true;
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
        "{d634138d-c276-4fc8-924b-40a0ea21d284}" = {
          "installation_mode" = "normal_installed";
          "install_url" =
            "https://addons.mozilla.org/firefox/downloads/latest/1password-x-password-manager/latest.xpi";
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
