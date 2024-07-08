local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v4 = require(l_Modules_0.AvatarExperience.Common.Context.NamedRefsContext);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
return function()
    local v6 = v2.useContext(v4)[v3.SortAndFilters .. "-closeSignal"];
    if v6.current == nil then
        v6.current = l_Signal_0.new();
    end;
    return v6.current;
end;
