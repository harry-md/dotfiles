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
local extendedClientCapabilities = jdtls.extendedClientCapabilities
local config = {
  -- !IMPORTANT make javadoc visible when typing completion
  capabilities = require("blink-cmp").get_lsp_capabilities(),

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
    "-javaagent:" .. home .. "/jdtls/lombok.jar",
    "-jar",
    vim.fn.glob(home .. "/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
    "-configuration",
    home .. "/jdtls/config_linux",
    "-data",
    workspace_dir,
  },
  root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),

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
        includeDecompiledSources = false,
      },
      completion = {
        importOrder = {
          "java",
          "javax",
          "lombok",
          "org",
          "com",
          "", -- Everything else
          "#", -- Static imports last
        },
        maxResults = 50,
        -- remove these in completion
        filteredTypes = {
          "java.awt.*",
          "com.sun.*",
          "sun.*",
          "jdk.*",
          -- "org.graalvm.*",
          "io.micrometer.shaded.*",
        },
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
  on_attach = function(client, bufnr)
    require("jdtls").setup_dap({ hotcodereplace = "auto" })
  end,
  init_options = {
    bundles = {},
    usePlaceholders = true,
    -- extendedClientCapabilities = extendedClientCapabilities,
  },
}
require("jdtls").start_or_attach(config)
