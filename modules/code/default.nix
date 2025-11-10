{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    profiles.default.extensions =
      with pkgs.vscode-extensions;
      [
        anthropic.claude-code
        bbenoist.nix
        ms-azuretools.vscode-containers
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-containers
        ms-vscode.remote-explorer
        ms-vscode-remote.remote-wsl
        ms-vscode.powershell
        rust-lang.rust-analyzer
        vscodevim.vim
        shd101wyy.markdown-preview-enhanced
        tamasfe.even-better-toml
        ziglang.vscode-zig
        zxh404.vscode-proto3
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "theme-irblack";
          publisher = "gerane";
          version = "latest";
          sha256 = "sha256-jd9OHGyBhZCxF35cE1S+eX1ooewbbisqbygqlSI37DQ==";
        }
      ];

    profiles.default.userSettings = {
      "breadcrumbs.enabled" = false;
      "claudeCode.useTerminal" = true;
      "editor.bracketPairColorization.enabled" = false;
      "editor.cursorBlinking" = "solid";
      "editor.fontFamily" = "'JetBrains Mono', 'Fira Code Retina', Consolas, 'Courier New', monospace";
      "editor.fontSize" = 13;
      "editor.formatOnSave" = true;
      "editor.guides.indentation" = false;
      "editor.hideCursorInOverviewRuler" = true;
      "editor.minimap.enabled" = false;
      "editor.overviewRulerBorder" = false;
      "editor.renderLineHighlight" = "none";
      "editor.renderWhitespace" = "all";
      "editor.scrollbar.horizontal" = "hidden";
      "editor.scrollbar.vertical" = "hidden";
      "editor.stickyScroll.enabled" = false;
      "editor.tabSize" = 2;
      "editor.tokenColorCustomizations" = {
        "[IR_Black]" = {
          "textMateRules" = [
            {
              "scope" = "entity.name.type.rust";
              "settings" = {
                "foreground" = "#FFFFB6";
                "fontStyle" = "";
              };
            }
          ];
        };
      };
      "explorer.decorations.colors" = false;
      "files.watcherExclude" = {
        "**/.bloop" = true;
        "**/.metals" = true;
      };
      "telemetry.telemetryLevel" = "off";
      "terminal.integrated.fontSize" = 13;
      "window.commandCenter" = false;
      "window.zoomLevel" = 1.1;
      "workbench.activityBar.location" = "top";
      "workbench.colorCustomizations" = {
        "[IR_Black]" = {
          "editor.background" = "#000000";
          "sideBar.background" = "#000000";
          "sideBar.border" = "#1a1a1a";
          "sideBarTitle.foreground" = "#ffffff";
          "sideBarSectionHeader.background" = "#0a0a0a";
          "sideBarSectionHeader.foreground" = "#ffffff";
          "activityBar.background" = "#000000";
          "activityBar.foreground" = "#ffffff";
          "activityBar.inactiveForeground" = "#666666";
          "activityBar.border" = "#1a1a1a";
          "activityBarBadge.background" = "#ff6c60";
          "statusBar.background" = "#000000";
          "statusBar.foreground" = "#ffffff";
          "statusBar.border" = "#1a1a1a";
          "statusBar.noFolderBackground" = "#000000";
          "statusBar.debuggingBackground" = "#ff6c60";
          "titleBar.activeBackground" = "#000000";
          "titleBar.activeForeground" = "#ffffff";
          "titleBar.inactiveBackground" = "#000000";
          "titleBar.border" = "#1a1a1a";
          "tab.activeBackground" = "#000000";
          "tab.activeForeground" = "#ffffff";
          "tab.activeBorder" = "#000000";
          "tab.activeBorderTop" = "#ff6c60";
          "tab.inactiveBackground" = "#0f0f0f";
          "tab.inactiveForeground" = "#666666";
          "tab.border" = "#1a1a1a";
          "tab.hoverBackground" = "#1a1a1a";
          "tab.unfocusedActiveBackground" = "#000000";
          "tab.unfocusedActiveBorder" = "#000000";
          "tab.unfocusedActiveBorderTop" = "#666666";
          "tab.unfocusedInactiveBackground" = "#0f0f0f";
          "panel.background" = "#000000";
          "panel.border" = "#1a1a1a";
          "panelTitle.activeBorder" = "#ff6c60";
          "panelTitle.activeForeground" = "#ffffff";
          "terminal.background" = "#000000";
          "list.activeSelectionBackground" = "#1a1a1a";
          "list.inactiveSelectionBackground" = "#0f0f0f";
          "list.hoverBackground" = "#0a0a0a";
        };
      };
      "workbench.colorTheme" = "IR_Black";
      "workbench.layoutControl.type" = "menu";
      "workbench.secondarySideBar.defaultVisibility" = "hidden";
      "workbench.sideBar.location" = "right";
      "workbench.tree.indent" = 12;
      "workbench.tree.renderIndentGuides" = "none";
    };
    profiles.default.keybindings = [
      {
        "key" = "shift+enter";
        "command" = "workbench.action.terminal.sendSequence";
        "args" = {
          "text" = "\\\r\n";
        };
        "when" = "terminalFocus";
      }
    ];
  };
}
