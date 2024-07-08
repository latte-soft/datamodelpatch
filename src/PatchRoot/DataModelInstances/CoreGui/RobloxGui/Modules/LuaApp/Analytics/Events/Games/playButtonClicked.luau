local l_LocalizationService_0 = game:GetService("LocalizationService");
local v1 = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck);
return function(v2, v3, v4, v5)
    v1.isType(v4, "string", "playSource");
    v1.isType(v5, "string", "response");
    v2:setRBXEventStream(v3, "playButtonClicked", {
        locale = l_LocalizationService_0.RobloxLocaleId, 
        playSource = v4, 
        response = v5
    });
end;
