local _ = require(script.Parent.NavigationTypes);
local v1 = require(script.Parent.getCurrentNavigationState);
return function(v2)
    if v2 then
        if v2.state then
            return (v1(v2.state));
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
