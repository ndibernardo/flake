{ pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor;
    userKeymaps = [
      {
        context = "Editor && vim_mode == normal && !VimWaiting && !menu";
        bindings = {
          "shift-j" = "editor::MoveLineDown";
          "shift-k" = "editor::MoveLineUp";
        };
      }
    ];
    userSettings = {
      autosave = {
        after_delay = {
          milliseconds = 1000;
        };
      };
      buffer_font_family = "Berkeley Mono";
      buffer_font_size = 17;
      cursor_blink = false;
      inlay_hints = {
        enabled = true;
      };
      load_direnv = "shell_hook";
      theme = {
        mode = "system";
        light = "JetBrains Light";
        dark = "Tomorrow Night";
      };
      ui_font_family = "Inter";
      ui_font_size = 15;
      vim_mode = true;
      languages = {
        Clojure = {
          binary = {
            path_lookup = true;
          };
          language_servers = [ "clojure-lsp" ];
        };
        Elixir = {
          binary = {
            path_lookup = true;
          };
          language_servers = [ "elixir-ls" ];
        };
        Java = {
          binary = {
            path_lookup = true;
          };
          language_servers = [ "jdtls" ];
        };
        Rust = {
          binary = {
            path_lookup = true;
          };
          language_servers = [ "rust-analyzer" ];
          formatter = {
            external = {
              command = "rustfmt";
            };
          };
        };
        Nix = {
          binary = {
            path_lookup = true;
          };
          language_servers = [ "nixd" ];
          formatter = {
            external = {
              command = "nixfmt";
            };
          };
        };
        Zig = {
          binary = {
            path_lookup = true;
          };
          language_servers = [ "zls" ];
        };
      };
    };
  };
}
