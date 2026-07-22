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

              "vim.leader" = "<space>";
              "vim.hlsearch" = false;
              "vim.useSystemClipboard" = true;

              "vim.normalModeKeyBindingsNonRecursive" = [
                { before = [ "<leader>" "p" "v" ]; commands = [ "workbench.view.explorer" ]; }
                { before = [ "<leader>" "p" "t" ]; commands = [ "workbench.action.toggleSidebarVisibility" ]; }
                { before = [ "J" ]; after = [ "m" "z" "J" "`" "z" ]; }
                { before = [ "<C-d>" ]; after = [ "<C-d>" "z" "z" ]; }
                { before = [ "<C-u>" ]; after = [ "<C-u>" "z" "z" ]; }
                { before = [ "n" ]; after = [ "n" "z" "z" "z" "v" ]; }
                { before = [ "N" ]; after = [ "N" "z" "z" "z" "v" ]; }
                { before = [ "<leader>" "y" ]; after = [ "\"" "+" "y" ]; }
                { before = [ "<leader>" "Y" ]; after = [ "\"" "+" "Y" ]; }
                { before = [ "<leader>" "d" ]; after = [ "\"" "_" "d" ]; }
                { before = [ "Q" ]; after = [ ]; }
                { before = [ "<C-k>" ]; commands = [ "editor.action.marker.next" ]; }
                { before = [ "<C-j>" ]; commands = [ "editor.action.marker.prev" ]; }
                { before = [ "<leader>" "k" ]; commands = [ "editor.action.marker.next" ]; }
                { before = [ "<leader>" "j" ]; commands = [ "editor.action.marker.prev" ]; }
                { before = [ "g" "d" ]; commands = [ "editor.action.revealDefinition" ]; }
                { before = [ "g" "r" ]; commands = [ "editor.action.goToReferences" ]; }
                { before = [ "g" "I" ]; commands = [ "editor.action.goToImplementation" ]; }
                { before = [ "g" "D" ]; commands = [ "editor.action.revealDeclaration" ]; }
                { before = [ "<leader>" "D" ]; commands = [ "editor.action.goToTypeDefinition" ]; }
                { before = [ "<leader>" "d" "s" ]; commands = [ "workbench.action.gotoSymbol" ]; }
                { before = [ "<leader>" "w" "s" ]; commands = [ "workbench.action.showAllSymbols" ]; }
                { before = [ "<leader>" "r" "r" ]; commands = [ "editor.action.rename" ]; }
                { before = [ "<leader>" "c" "a" ]; commands = [ "editor.action.quickFix" ]; }
                { before = [ "K" ]; commands = [ "editor.action.showHover" ]; }
                { before = [ "<leader>" "f" ]; commands = [ "editor.action.formatDocument" ]; }
                { before = [ "<leader>" "s" "f" ]; commands = [ "workbench.action.quickOpen" ]; }
                { before = [ "<leader>" "s" "s" ]; commands = [ "workbench.action.showCommands" ]; }
                { before = [ "<leader>" "s" "g" ]; commands = [ "workbench.action.findInFiles" ]; }
                { before = [ "<leader>" "s" "w" ]; commands = [ "editor.action.addSelectionToNextFindMatch" ]; }
                { before = [ "<leader>" "s" "d" ]; commands = [ "workbench.actions.view.problems" ]; }
                { before = [ "<leader>" "s" "." ]; commands = [ "workbench.action.openRecent" ]; }
                { before = [ "<leader>" "s" "k" ]; commands = [ "workbench.action.openGlobalKeybindings" ]; }
                { before = [ "<leader>" "<leader>" ]; commands = [ "workbench.action.showAllEditors" ]; }
                { before = [ "<leader>" "/" ]; commands = [ "actions.find" ]; }
              ];

              "vim.visualModeKeyBindingsNonRecursive" = [
                { before = [ "J" ]; commands = [ "editor.action.moveLinesDownAction" ]; }
                { before = [ "K" ]; commands = [ "editor.action.moveLinesUpAction" ]; }
                { before = [ "<leader>" "p" ]; after = [ "\"" "_" "d" "P" ]; }
                { before = [ "<leader>" "y" ]; after = [ "\"" "+" "y" ]; }
                { before = [ "<leader>" "d" ]; after = [ "\"" "_" "d" ]; }
              ];

              "vim.insertModeKeyBindingsNonRecursive" = [
                { before = [ "<C-c>" ]; after = [ "<Esc>" ]; }
              ];
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
