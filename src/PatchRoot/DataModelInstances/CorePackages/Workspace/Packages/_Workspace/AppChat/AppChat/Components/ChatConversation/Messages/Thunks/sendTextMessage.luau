local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Conversations.Thunks.SendTextMessage);
local v2 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
return function(...)
    v2:info("Sending text message");
    return v1(...);
end;
