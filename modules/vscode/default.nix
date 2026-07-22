{ ... }:
{
  flake.nixosModules.vscode = (
    {
      pkgs,
      user,
      ...
    }:
    {
      home-manager.users.${user.name} = {
        home.file = builtins.listToAttrs (
          map
            (size: {
              name = ".local/share/icons/hicolor/${size}x${size}/apps/vscode.png";
              value.source = "${pkgs.vscode}/share/icons/hicolor/1024x1024/apps/vscode.png";
            })
            [
              "16"
              "24"
              "32"
              "48"
              "64"
              "128"
              "256"
              "512"
            ]
        );

        programs.vscode = {
          enable = true;
          profiles.default = {
            userSettings = {
              "editor.fontSize" = 13;
              "editor.fontFamily" = "Jetbrains Mono, Fira Code, Menlo, Monaco, 'Courier New', monospace";
              "editor.minimap.enabled" = false;
              "editor.lineNumbers" = "relative";
              "editor.cursorBlinking" = "solid";
              "claudeCode.preferredLocation" = "panel";
              "window.autoDetectColorScheme" = true;
              "workbench.preferredDarkColorTheme" = "Dark 2026";
              "workbench.preferredLightColorTheme" = "Light 2026";
              "extensions.autoUpdate" = "off";
              "extensions.autoCheckUpdates" = false;
              "telemetry.telemetryLevel" = "off";
              "gitlens.telemetry.enabled" = false;
              "python.analysis.typeCheckingMode" = "strict";
              "workbench.editor.editorActionsLocation" = "titleBar";
              "workbench.activityBar.location" = "hidden";
              "workbench.tree.enableStickyScroll" = true;
              "editor.stickyScroll.enabled" = true;
              "breadcrumbs.enabled" = false;
              "gitlens.graph.statusBar.enabled" = false;
              "gitlens.launchpad.indicator.enabled" = false;
              "gitlens.statusBar.enabled" = false;
              "chat.viewSessions.enabled" = false;
              "chat.agentsControl.enabled" = "hidden";
            };
            extensions = with pkgs.vscode-extensions; [
              anthropic.claude-code
              bbenoist.nix
              charliermarsh.ruff
              eamodio.gitlens
              jnoortheen.nix-ide
              mkhl.direnv
              ms-azuretools.vscode-containers
              ms-python.debugpy
              ms-python.python
              ms-python.vscode-pylance
              ms-vscode.makefile-tools
              rust-lang.rust-analyzer
              vscodevim.vim
            ];
          };
        };
      };
    }
  );
}
