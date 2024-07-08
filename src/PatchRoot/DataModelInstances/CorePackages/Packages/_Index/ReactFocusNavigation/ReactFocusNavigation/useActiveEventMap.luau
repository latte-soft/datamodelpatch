local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.React);
local _ = require(l_Parent_0.FocusNavigation);
local v3 = require(script.Parent.FocusNavigationContext);
return function()
    local v4 = v1.useContext(v3);
    local v5 = if not v4 then {} else v4.activeEventMap:getValue();
    local v6, v7 = v1.useState(v5);
    v1.useEffect(function()
        if v6 ~= v5 then
            v7(v5);
        end;
        if not v4 then
            return nil;
        else
            local v8 = v4.activeEventMap:subscribe(v7);
            return function()
                v8:unsubscribe();
            end;
        end;
    end, {
        v4
    });
    return v6;
end;
