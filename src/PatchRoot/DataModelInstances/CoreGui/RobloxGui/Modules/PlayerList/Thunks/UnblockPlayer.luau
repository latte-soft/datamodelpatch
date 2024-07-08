local v0 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.BlockingUtility);
local v1 = require(script.Parent.Parent.Actions.SetPlayerIsBlocked);
return function(v2)
    return function(v3)
        coroutine.wrap(function()
            if v0:UnblockPlayerAsync(v2) then
                v3:dispatch(v1(v2, false));
            end;
        end)();
    end;
end;
