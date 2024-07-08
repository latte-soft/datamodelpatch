local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.Models.GamesApi.GameSearchEntry);
local v3 = require(l_CorePackages_0.tutils);
local v4 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppOmniApiSearchResultDupFix);
local v5 = {
    new = function()
        return {};
    end
};
v5.mock = function()
    local v6 = v5.new();
    v6.keyword = "Meepcity";
    v6.entries = {
        v2.mock()
    };
    v6.emphasis = true;
    v6.hasMoreRows = false;
    v6.nextPageToken = nil;
    return v6;
end;
v5.fromOmniSearch = function(v7, v8, v9, v10)
    local v11 = v5.new();
    v11.keyword = v7;
    v11.entries = v8;
    v11.emphasis = v9;
    if not v4() then
        v11.nextPageToken = v10;
        v11.hasMoreRows = not not v10 or false;
        return v11;
    elseif v10 and v10 ~= "" then
        v11.nextPageToken = v10;
        v11.hasMoreRows = true;
        return v11;
    else
        v11.nextPageToken = nil;
        v11.hasMoreRows = false;
        return v11;
    end;
end;
v5.IsEqual = function(v12, v13)
    if v3.shallowEqual(v12.entries, v13.entries) then
        return v3.shallowEqual(v12, v13, {
            entries = true
        });
    else
        return false;
    end;
end;
return v5;
