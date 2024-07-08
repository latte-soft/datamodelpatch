local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Actions.SetNativeRobuxProducts);
local v2 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
return function(v3, v4)
    v3 = v3 or {
        Products = nil, 
        FetchingStatus = v2.NotStarted
    };
    assert(v3, "");
    if v4.type == v1.name then
        return {
            Products = v4.nativeRobuxProducts, 
            FetchingStatus = v2.Done
        };
    else
        return v3;
    end;
end;
