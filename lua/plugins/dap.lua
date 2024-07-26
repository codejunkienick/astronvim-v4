return {
  "mfussenegger/nvim-dap",
  optional = true,
  opts = function()
    local dap = require "dap"
    if not dap.adapters["pwa-chrome"] then
      dap.adapters["pwa-chrome"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          args = {
            require("mason-registry").get_package("js-debug-adapter"):get_install_path()
              .. "/js-debug/src/dapDebugServer.js",
            "${port}",
          },
        },
      }
    end
    if not dap.adapters["pwa-node"] then
      require("dap").adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          -- 💀 Make sure to update this path to point to your installation
          args = {
            require("mason-registry").get_package("js-debug-adapter"):get_install_path()
              .. "/js-debug/src/dapDebugServer.js",
            "${port}",
          },
        },
      }
    end
    if not dap.adapters["node"] then
      dap.adapters["node"] = function(cb, config)
        if config.type == "node" then config.type = "pwa-node" end
        local nativeAdapter = dap.adapters["pwa-node"]
        if type(nativeAdapter) == "function" then
          nativeAdapter(cb, config)
        else
          cb(nativeAdapter)
        end
      end
    end

    local js_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }

    for _, lang in ipairs(js_filetypes) do
      dap.configurations[lang] = dap.configurations[lang] or {}

      table.insert(dap.configurations[lang], {
        type = "pwa-chrome",
        request = "attach",
        name = "Attach Chrome remote-staging IMDF",
        -- processId = require("dap.utils").pick_process,
        protocol = "inspector",
        program = "${file}",
        -- cwd = "${workspaceFolder}",
        cwd = vim.fn.getcwd(),
        port = 9222,
        webRoot = "${workspaceFolder}/apps/imdfront",
        outFiles = {
          "${workspaceFolder}/apps/*/dist/remote-staging/*.js",
          "!**/node_modules/**",
        },
        sourceMaps = true,
      })
      table.insert(dap.configurations[lang], {
        type = "pwa-chrome",
        request = "launch",
        name = "Launch Chrome",
        url = "http://localhost:3000",
        sourceMaps = true,
      })

      table.insert(dap.configurations[lang], {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
      })
      table.insert(dap.configurations[lang], {
        type = "pwa-node",
        request = "attach",
        name = "Attach",
        processId = require("dap.utils").pick_process,
        cwd = "${workspaceFolder}",
      })
    end

    local vscode = require "dap.ext.vscode"
    vscode.type_to_filetypes["node"] = js_filetypes
    vscode.type_to_filetypes["pwa-node"] = js_filetypes
  end,
}
