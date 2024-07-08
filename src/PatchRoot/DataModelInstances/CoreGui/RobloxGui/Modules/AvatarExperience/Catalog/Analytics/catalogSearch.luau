local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
return function(v5, v6, v7, v8, v9, v10, v11)
    v3.isType(v6, "string", "catalogSearch event expects eventContext");
    v3.isType(v7, "string", "catalogSearch event expects keyword");
    v3.isType(v8, "table", "catalogSearch event expects assetsReturned");
    v3.isType(v9, "number", "catalogSearch event expects pageNumber");
    v3.isTypeOrNil(v10, "string", "catalogSearch event expects sortType");
    v3.isTypeOrNil(v11, "table", "catalogSearch event expects filters");
    v5:setRBXEventStream(v6, "catalogSearch", {
        feature = v4.AnalyticsTag, 
        keyword = v7, 
        page = v9, 
        sort = v10, 
        filters = v11 and l_HttpService_0:JSONEncode(v11), 
        assetsReturned = table.concat(v8, ",")
    });
end;
