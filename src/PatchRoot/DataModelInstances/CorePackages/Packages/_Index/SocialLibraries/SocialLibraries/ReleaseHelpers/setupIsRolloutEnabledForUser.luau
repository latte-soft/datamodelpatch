local v0 = require(script.Parent.Parent.dependencies);
local v1 = require(script.Parent.throttleUserId);
return function(v2)
    return function()
        local l_LocalPlayer_0 = v0.Players.LocalPlayer;
        if l_LocalPlayer_0 and l_LocalPlayer_0.UserId then
            return v1({
                throttle = v2(), 
                userId = l_LocalPlayer_0.UserId
            });
        else
            return false;
        end;
    end;
end;
