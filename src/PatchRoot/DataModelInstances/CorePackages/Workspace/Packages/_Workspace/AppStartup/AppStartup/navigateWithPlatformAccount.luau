local l_Parent_0 = script:FindFirstAncestor("AppStartup").Parent;
local v1 = game:DefineFastFlag("DebugTenFootForceShowAuthScreen", false);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
return function(v3, v4)
    if not v3 then
        if not v1 then
            v4(l_AppPage_0.Startup);
            return ;
        else
            v4(l_AppPage_0.Authentication);
            return ;
        end;
    else
        v4(l_AppPage_0.SingleSignOnContainer);
        return ;
    end;
end;
