local l_LocalizationService_0 = game:GetService("LocalizationService");
local v1 = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck);
return function(v2, v3, v4, v5)
    v1.isType(v3, "string", "eventContext");
    v1.isType(v4, "string", "kwd");
    v1.isType(v5, "string", "searchType");
    v2:setRBXEventStream(v3, "searchClear", {
        locale = l_LocalizationService_0.RobloxLocaleId, 
        kwd = v4, 
        searchType = v5
    });
end;
