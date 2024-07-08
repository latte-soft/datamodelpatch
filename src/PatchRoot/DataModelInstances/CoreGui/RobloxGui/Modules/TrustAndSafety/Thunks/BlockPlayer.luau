local v0 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.BlockingUtility);
local v1 = require(script.Parent.Parent.Actions.ShowToast);
return function(v2, v3, v4)
    return function(v5)
        coroutine.wrap(function()
            if v0:BlockPlayerAsync(v2) then
                v5:dispatch(v1(v3, v4));
            end;
        end)();
    end;
end;
