local l_status_0, l_result_0 = pcall(function()
    return game:GetService("StudioService");
end);
local v2 = if not l_status_0 then nil else l_result_0;
local _ = require(script.Parent.Parent.util.Types);
return function()
    if not v2 then
        return {};
    else
        return {
            {
                creatorType = "User", 
                id = v2:GetUserId()
            }
        };
    end;
end;
