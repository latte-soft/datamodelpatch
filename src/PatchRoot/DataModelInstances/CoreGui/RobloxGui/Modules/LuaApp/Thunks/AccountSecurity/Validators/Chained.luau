local _ = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Promise);
return function(...)
    local v1 = {
        ...
    };
    return function(v2)
        local v3 = nil;
        for _, v5 in ipairs(v1) do
            if v3 == nil then
                v3 = v5(v2);
            else
                v3 = v3:andThen(function(v6)
                    if v6 ~= nil then
                        return v6;
                    else
                        return v5(v2);
                    end;
                end);
            end;
        end;
        return v3;
    end;
end;
