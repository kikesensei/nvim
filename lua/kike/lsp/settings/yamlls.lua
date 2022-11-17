return {
  settings = {
    yaml = {
      redhat = {
        telemetry = {
          enabled = false
        }
      },
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["../path/relative/to/file.yml"] = "/.github/workflows/*",
        ["/path/from/root/of/project"] = "/.github/workflows/*"
      }
    }
  }
}
