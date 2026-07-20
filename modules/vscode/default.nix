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
              "window.zoomLevel" = 0.8;
              "editor.fontFamily" = "Jetbrains Mono, Fira Code, Menlo, Monaco, 'Courier New', monospace";
              "claudeCode.preferredLocation" = "panel";
              "window.autoDetectColorScheme" = true;
              "workbench.preferredDarkColorTheme" = "Dark 2026";
              "workbench.preferredLightColorTheme" = "Light 2026";
              "extensions.autoUpdate" = "off";
              "extensions.autoCheckUpdates" = false;
              "telemetry.telemetryLevel" = "off";
              "gitlens.telemetry.enabled" = false;
              "python.analysis.typeCheckingMode" = "strict";
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
            ];
          };
        };
      };
    }
  );
}
