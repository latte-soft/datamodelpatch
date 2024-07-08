local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ShareGame_0 = l_CoreGui_0.RobloxGui.Modules.Settings.Pages.ShareGame;
local l_Immutable_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Immutable;
local v4 = require(l_ShareGame_0.Actions.ClosePage);
local v5 = require(l_ShareGame_0.Actions.SetSearchAreaActive);
local v6 = require(l_ShareGame_0.Actions.SetSearchText);
local v7 = {
    SearchAreaActive = false, 
    SearchText = ""
};
return function(v8, v9)
    v8 = v8 or v7;
    if v9.type == v5.name then
        return (l_Immutable_0.Set(v8, "SearchAreaActive", v9.isActive));
    elseif v9.type == v6.name then
        return (l_Immutable_0.Set(v8, "SearchText", v9.searchText));
    else
        if v9.type == v4.name then
            v8 = v7;
        end;
        return v8;
    end;
end;
