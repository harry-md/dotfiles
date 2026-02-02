vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt.colorcolumn = "100"
local home = os.getenv("HOME")
local workspace_path = home .. "/.local/share/nvim/jdtls-workspace/"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = workspace_path .. project_name

local status, jdtls = pcall(require, "jdtls")
if not status then
  return
end

-- 1. Define the cleaner function
local function filter_jdt_links(result)
  if not result or not result.contents then
    return
  end

  local function strip_links(text)
    -- %b() matches balanced parentheses.
    -- We capture [Label] and then the (Link) part separately.
    return text:gsub("%[([^%]]*)%](%b())", function(label, link)
      -- Check if the captured link starts with (jdt://
      if link:match("^%(jdt://") then
        -- Return just the label (wrapped in backticks for clarity)
        return "`" .. label .. "`"
      end
      -- If it's a normal web link, return nil (no change)
      return nil
    end)
  end

  if type(result.contents) == "table" and result.contents.value then
    result.contents.value = strip_links(result.contents.value)
  elseif type(result.contents) == "string" then
    result.contents = strip_links(result.contents)
  end
end

-- 2. Define the custom handler for JDTLS specifically
local function jdtls_hover(err, result, ctx, config)
  if result then
    filter_jdt_links(result)
  end
  -- Fallback to the default Neovim handler (or Noice/Lspsaga if installed)
  vim.lsp.handlers["textDocument/hover"](err, result, ctx, config)
end

local extendedClientCapabilities = jdtls.extendedClientCapabilities
local config = {
  -- !IMPORTANT make javadoc visible when typing completion
  capabilities = require("blink-cmp").get_lsp_capabilities(),

  -- 3. Register the handler HERE in the config
  handlers = {
    ["textDocument/hover"] = jdtls_hover,
  },

  cmd = {
    "java",
    "-XX:+UseG1GC",
    "-Xms512m",
    "-Xmx2g",
    "-XX:+UseStringDeduplication",
    "-XX:+TieredCompilation",
    "-XX:MaxGCPauseMillis=150",
    "-Dsun.zip.disableMemoryMapping=true",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=WARN",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "--add-opens",
    "java.base/sun.nio.ch=ALL-UNNAMED",
    "--add-opens",
    "java.management/sun.management=ALL-UNNAMED",
    "--add-opens",
    "jdk.management/com.sun.management.internal=ALL-UNNAMED",
    "-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
    "-jar",
    vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
    "-configuration",
    home .. "/.local/share/nvim/mason/packages/jdtls/config_linux",
    "-data",
    workspace_dir,
  },
  -- root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
  root_dir = vim.fs.root(0, { "gradlew", ".git", "mvnw", "pom.xml", "build.gradle" }),

  settings = {
    diagnostic = {
      refreshAfterSave = true,
    },
    java = {
      signatureHelp = { enabled = true },
      extendedClientCapabilities = extendedClientCapabilities,
      eclipse = {
        downloadSources = true,
      },
      maven = {
        downloadSources = true,
      },
      referencesCodeLens = {
        enabled = false,
      },
      references = {
        includeDecompiledSources = true,
      },
      completion = {
        maxResults = 50,
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.stream.Collectors.*",
          "org.mockito.Mockito.*",
        },
        guessMethodArguments = false,
      },
      inlayHints = {
        parameterNames = {
          enabled = "none", -- literals, all, none
        },
      },
      format = {
        enabled = false,
        settings = {
          url = vim.fn.expand("~/eclipse-java-google-style.xml"),
          profile = "GoogleStyle",
        },
      },
    },
  },

  init_options = {
    bundles = {},
    usePlaceholders = true,
    extendedClientCapabilities = extendedClientCapabilities,
  },
}

require("jdtls").start_or_attach(config)
