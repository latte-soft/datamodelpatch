local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Promise);
return function(v1, v2)
    return function(v3)
        if v3 == v2 then
            return v0.resolve(nil);
        else
            return v0.resolve(v1);
        end;
    end;
end;
