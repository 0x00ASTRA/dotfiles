local term = require("toggleterm.terminal").Terminal
local socket = require("socket.core")
local async = require("plenary.async")

local KOS = {}

-- Function to try to connect to the IP and port
local function try_connect(ip, port, timeout)
  -- Debugging: Print the IP and Port to ensure they are correct
  local message = "Attempting to connect to IP: " .. tostring(ip) .. " on Port: " .. tostring(port)
  show_message(message)  -- Show the message in a floating terminal

  -- Check if the IP is empty or nil
  if not ip or ip == "" then
    message = "Error: IP is blank or nil!"
    show_message(message)
    return false, "IP is blank"
  end

  local client = socket.tcp()
  client:settimeout(timeout)  -- Set the timeout

  -- Attempt connection
  local success, error = client:connect(ip, port)

  -- Debugging: Check the connection result
  if success then
    message = "Connection successful!"
    show_message(message)
    client:close()  -- Close the client only after a successful connection
    return true, nil
  else
    message = "Connection failed: " .. error
    show_message(message)
    client:close()  -- Close the client after a failed attempt as well
    return false, error
  end
end

-- Function to open the terminal with the telnet command
local function open_terminal(telnet)
  telnet:toggle()
end

-- Function to handle retry logic for the connection
local function retry_connection(ip, port, position, retries, timeout)
  local attempt = 1
  while attempt <= retries do
    local message = "Attempting connection (Attempt " .. attempt .. " of " .. retries .. ")"
    show_message(message)  -- Show retry attempt in a floating terminal

    local success, error = try_connect(ip, port, timeout)

    if success then
      message = "Connection succeeded to " .. ip .. ":" .. port
      show_message(message)

      local telnet_cmd = "telnet " .. ip .. " " .. port
      message = "Starting KOS Telnet with command: " .. telnet_cmd
      show_message(message)

      local telnet = term:new({
        cmd = telnet_cmd,
        hidden = true,
        direction = position,  -- Use the position argument
        close_on_exit = true,
      })
      KOS.telnet = telnet
      open_terminal(telnet)
      return  -- Exit once the terminal is opened
    else
      message = "Attempt " .. attempt .. " failed: " .. error
      show_message(message)

      -- Provide more detailed error info
      if string.find(error, "timeout") then
        show_message("Error: Connection timed out.")
      elseif string.find(error, "refused") then
        show_message("Error: Connection refused.")
      elseif string.find(error, "no route to host") then
        show_message("Error: No route to host (network issue).")
      elseif string.find(error, "host not found") then
        show_message("Error: Host not found (check IP or DNS resolution).")
      else
        show_message("Error: " .. error)
      end

      attempt = attempt + 1
      if attempt <= retries then
        show_message("Retrying in " .. timeout .. " seconds...")
        async.util.sleep(timeout)  -- Wait before retrying
      else
        show_message("Failed to connect after " .. retries .. " attempts.")
      end
    end
  end
end

-- Function to show a floating terminal with the message
function show_message(message)
  local floating_terminal = term:new({
    cmd = "echo '" .. message .. "'",  -- Use echo to show the message in the terminal
    hidden = false,
    direction = "float",  -- This makes the terminal floating
    close_on_exit = true,
  })

  -- Open the floating terminal with the message
  floating_terminal:toggle()
end

-- Main function that calls retry_connection
function KOS.open_kos_telnet(ip, port, position, retries, timeout)
  ip = ip or "127.0.0.1"  -- Default IP
  port = port or "5410"   -- Default port
  position = position or "float" -- Options: "horizontal", "vertical", "float"
  retries = retries or 5   -- Number of retries before giving up
  timeout = timeout or 5   -- Timeout for each connection attempt in seconds
  if KOS.telnet then
      KOS.telnet:toggle()
      return
  end
  async.run(function()
    retry_connection(ip, port, position, retries, timeout)
  end)
end

return KOS


