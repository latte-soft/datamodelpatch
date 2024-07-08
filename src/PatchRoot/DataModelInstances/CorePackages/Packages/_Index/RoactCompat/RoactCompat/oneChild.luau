local v0 = require(script.Parent.Parent.React);
local v1 = require(script.Parent.warnOnce);
return function(v2)
    if not (not _G.__DEV__ or not _G.__COMPAT_WARNINGS__) then
        v1("oneChild", "You likely don't need this at all If you were assigning children " .. "via `React.oneChild(someChildren)`, you can simply use " .. "`someChildren` directly.");
    end;
    if v2 then
        local v3, v4 = next(v2);
        if v4 then
            if next(v2, v3) then
                error("Expected at most one child, had more than one child.", 2);
            end;
            return v0.Children.only(v4);
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
