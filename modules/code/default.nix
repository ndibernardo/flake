{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    profiles.default.extensions =
      with pkgs.vscode-extensions;
      [
        anthropic.claude-code
        bbenoist.nix
        ms-azuretools.vscode-containers
        ms-vscode.remote-explorer
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-containers
        ms-vscode.powershell
        rust-lang.rust-analyzer
        vscodevim.vim
        shd101wyy.markdown-preview-enhanced
        tamasfe.even-better-toml
        zxh404.vscode-proto3
      ];

    profiles.default.userSettings = {
      "breadcrumbs.enabled" = false;
      "claudeCode.useTerminal" = true;
      "editor.bracketPairColorization.enabled" = false;
      "editor.cursorBlinking" = "solid";
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
      "explorer.decorations.colors" = false;
      "telemetry.telemetryLevel" = "off";
      "terminal.integrated.fontSize" = 13;
      "window.commandCenter" = false;
      "window.zoomLevel" = 1.1;
      "workbench.activityBar.location" = "top";
      "workbench.layoutControl.type" = "menu";
      "workbench.secondarySideBar.defaultVisibility" = "hidden";
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
