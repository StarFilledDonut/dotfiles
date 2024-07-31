{
  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        # transparent_background = true;
        flavor = "mocha";
      };
    };
    globals.mapleader = " ";
    opts = {
      updatetime = 50;

      number = true;
      relativenumber = true;

      autoindent = true;
      clipboard = "unnamed,unnamedplus";

      expandtab = true;
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      smartindent = true;
      breakindent = true;

      wrap = false;
      signcolumn = "yes";
    };
    plugins = {
      bufferline.enable = true;
      lualine.enable = true;
      treesitter.enable = true;
      todo-comments.enable = true;

      ts-autotag.enable = true;
      nvim-autopairs.enable = true;
      comment.enable = true;

      telescope = {
        enable = true;
        extensions = {
          fzf-native.enable = true;
          media-files.enable = true;
        };
      };
      harpoon = {
        enable = true;
        enableTelescope = true;
      };

      lsp = {
        enable = true;
        servers = {
          bashls.enable = true;
          clangd.enable = true;
          nixd.enable = true;
          html.enable = true;
          tailwindcss.enable = true;
          cssls.enable = true;
          tsserver.enable = true;
        };
      };
      lspsaga.enable = true;
      lspkind = {
        enable = true;
        cmp = {
          maxWidth = 20;
          ellipsisChar = "...";
          after = ''
            function(_, item)
              if item.menu and string.len(item.menu) > 10 then
                item.menu = ""
              end
              return item
            end
          '';
        };
      };

      luasnip.enable = true;
      cmp-buffer.enable = true;
      cmp-emoji.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-path.enable = true;
      cmp_luasnip.enable = true;
      cmp = {
        enable = true;
        settings = {
          performance = {
            debounce = 120;
            max_view_entries = 15;
          };
          sources = [
            { name = "nvim_lsp"; }
            { name = "luasnip"; }
            { name = "buffer"; }
            { name = "nvim_lua"; }
            { name = "path"; }
          ];
          window = {
            completion = {
              winhighlight = "FloatBorder:CmpBorder,Normal:CmpPmenu,Search:PmenuSel";
              scrollbar = true;
              sidePadding = 0;
              border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ];
            };
            documentation = {
              winhighlight = "FloatBorder:CmpBorder,Normal:CmpPmenu,Search:PmenuSel";
              border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ];
            };
          };
          mapping = {
            "<C-j>" = "cmp.mapping.select_next_item()";
            "<C-k>" = "cmp.mapping.select_prev_item()";
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.close()";
            "<CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })";
          };
        };
      };
    };
  };
}
