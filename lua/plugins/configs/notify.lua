return function(_, opts)
  local notify = require "notify"
  local banned_messages = { "No information available" }
  notify.setup(opts)
  -- vim.notify = notify
  vim.notify = function(msg, ...)
    for _, banned in ipairs(banned_messages) do
      if msg == banned then return end
    end
    return notify(msg, ...)
  end
end
