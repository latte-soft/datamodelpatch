local _ = require(script.Parent.NavigationTypes);
local v1 = require(script.Parent.getCurrentRouteState);
return function(v2)
    local v3 = v1(v2);
    if not v3 then
        return nil;
    else
        return v3.key;
    end;
end;
