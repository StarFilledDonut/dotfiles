{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
      vscodevim.vim
      jnoortheen.nix-ide
      ms-vscode.cpptools-extension-pack
      llvm-vs-code-extensions.vscode-clangd
      formulahendry.code-runner
    ];
    userSettings = {
      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.iconTheme" = "catppuccin-mocha";
      "workbench.sideBar.location" = "right"; 
      "editor.fontFamily" = "'FiraCode Nerd Font', 'monospace', monospace";
      "editor.fontLigatures" = true;
      "editor.suggestSelection" = "first";
      "editor.autoIndent" = "advanced";
      "editor.lineNumbers" = "relative";
      "editor.comments.insertSpace" = true;
      "editor.insertSpaces" = true;
      "editor.minimap.enabled" = false;
      "explorer.confirmDragAndDrop" = false;
      "breadcrumbs.enabled" = false;
      "catppuccin.boldKeywords" = false;
      "catppuccin.italicKeywords" = false;
      "catppuccin.italicComments" = false;
      "catppuccin.accentColor" = "mauve";
      "code-runner.runInTerminal" = true;
    };
  };
}
