local l_CorePackages_0 = game:GetService("CorePackages");
return function(v1, _)
    local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
    local v4 = v1.Navigation.history[#v1.Navigation.history];
    local v5 = v4[#v4];
    return {
        currentAppPageName = not not v5 and v5.name or nil, 
        currentAppPageDetail = not not v5 and v5.detail or nil, 
        localUserId = v1.LocalUserId, 
        wideMode = v1.FormFactor == l_FormFactor_0.WIDE
    };
end;
