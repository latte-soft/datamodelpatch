local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Promise);
local v1 = require(script.Parent.SetNetworkingErrorToast);
return function(v2)
    return function(v3)
        return v3:dispatch(v2):andThen(function(v4)
            return v0.resolve(v4);
        end, function(v5)
            v3:dispatch(v1(v5));
            return v0.reject(v5);
        end);
    end;
end;
