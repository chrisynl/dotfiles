return {
  "rmagatti/auto-session",
  lazy = false,

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { "~/", "~/repos", "~/Downloads", "/", "~/sf"},
    -- log_level = 'debug',
  },
}
