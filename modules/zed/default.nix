{ pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor;
    extensions = [
      "html"
      "nix"
      "toml"
      "tomorrow-min-theme"
    ];
    userSettings = {
      autosave = {
        after_delay = {
          milliseconds = 1000;
        };
      };
      buffer_font_family = "Berkeley Mono";
      buffer_font_size = 16;
      cursor_blink = false;
      inlay_hints = {
        enabled = true;
      };
      load_direnv = "shell_hook";
      theme = "Tomorrow Night Min";
      ui_font_family = "Inter";
      ui_font_size = 15;
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
