local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization);
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return function(v5, v6, v7, v8, v9, v10)
    v4.isNotNil(v7, "keyword");
    local v11 = v1.user.search({
        keyword = v7
    });
    v5.reportTouchSearchInsteadForPlayerNamed(v7);
    v8(v11, not not v3() and v10 or v9:Format(v10), v6);
end;
