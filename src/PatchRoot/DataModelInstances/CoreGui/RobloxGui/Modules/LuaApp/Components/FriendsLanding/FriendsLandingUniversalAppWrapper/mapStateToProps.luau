local l_CorePackages_0 = game:GetService("CorePackages");
local _ = script:FindFirstAncestor("Modules");
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_getFFlagSoothsayerCheckForContactImporter_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFFlagSoothsayerCheckForContactImporter;
return function(v4, _)
    local v6 = v4.Navigation.history[#v4.Navigation.history];
    return {
        currentAppPage = v6[#v6].name, 
        wideMode = v4.FormFactor == l_FormFactor_0.WIDE, 
        isLocalUserSoothsayer = not not l_getFFlagSoothsayerCheckForContactImporter_0() and v4.IsLocalUserSoothsayer
    };
end;
