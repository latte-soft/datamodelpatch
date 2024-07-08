local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useRouteName_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useRouteName;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
return function(v4)
    local v5 = v1.useRef(false);
    local v6 = v1.useRef(nil);
    local v7 = l_useRouteName_0();
    local v9 = l_useSelector_0(function(v8)
        return v8.Personalization.PageSessionTimestamp[v4.appPage];
    end);
    v1.useEffect(function()
        if v7 ~= v4.appPage then
            return ;
        elseif v9 == nil then
            return ;
        else
            if v6.current == nil then
                v6.current = v9;
            end;
            if not v5.current or v9 ~= nil and v6.current < v9 then
                v5.current = true;
                if v4.setPageSession then
                    v4.setPageSession();
                end;
                v6.current = v9;
            end;
            return function()
                if v4.clearPageSession then
                    v4.clearPageSession();
                end;
            end;
        end;
    end, {
        v7, 
        v4.appPage, 
        v9, 
        v4.setPageSession, 
        v4.clearPageSession
    });
    return nil;
end;
