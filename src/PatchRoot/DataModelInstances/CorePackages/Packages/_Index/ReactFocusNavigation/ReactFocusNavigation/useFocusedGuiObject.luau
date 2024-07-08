local v0 = require(script.Parent.Parent.React);
local v1 = require(script.Parent.FocusNavigationContext);
return function()
    local v2 = v0.useContext(v1);
    local v3 = if not v2 then nil else v2.focusedGuiObject:getValue();
    local v4, v5 = v0.useState(v3);
    v0.useEffect(function()
        if v4 ~= v3 then
            v5(v3);
        end;
        if not v2 then
            return nil;
        else
            local v6 = v2.focusedGuiObject:subscribe(v5);
            return function()
                v6:unsubscribe();
            end;
        end;
    end, {
        v2
    });
    return v4;
end;
