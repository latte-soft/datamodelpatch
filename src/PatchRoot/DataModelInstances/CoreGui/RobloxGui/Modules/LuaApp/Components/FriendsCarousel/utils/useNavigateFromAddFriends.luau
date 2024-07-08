local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_ContactImporter_0 = l_Modules_0.LuaApp.Components.ContactImporter;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v4 = require(l_Modules_0.LuaApp.Thunks.NavigateDownToAddFriendsPage);
local l_useContactImporterConfiguration_0 = require(l_CorePackages_0.Workspace.Packages.ContactImporter).Utils.useContactImporterConfiguration;
local v6 = require(l_ContactImporter_0.useNavigateToContactImporter);
return function(v7)
    local v8 = v6();
    local v9 = l_useContactImporterConfiguration_0(v7);
    local v10 = l_useDispatch_0();
    local function _()
        v10(v4());
    end;
    return function()
        if not v9.shouldShowContactImporterModal then
            v10(v4());
            return ;
        else
            v8();
            return ;
        end;
    end;
end;
