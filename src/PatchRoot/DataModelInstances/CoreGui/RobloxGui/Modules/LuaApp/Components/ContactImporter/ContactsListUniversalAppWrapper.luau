local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Thunks.OpenProfilePeekView);
local v3 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local l_ContactsList_0 = require(l_Modules_0.LuaApp.Components.ContactImporter.api).ContactsList;
local v5 = require(l_Modules_0.LuaApp.Components.AmpUpsell.OpenAmpWizardContainer);
local v6 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled;
local v9 = require(l_CorePackages_0.Packages.React);
local v10 = require(l_CorePackages_0.Packages.Dash);
local v11 = require(l_Modules_0.LuaApp.Thunks.OpenContactImporterLearnMoreLink);
return function(v12)
    local v13 = l_useDispatch_0();
    return v9.createElement(l_ContactsList_0, v10.join(v12, {
        showToast = if not l_getFFlagDiscoverabilityOverlayAmpUpsellFixEnabled_0() then nil else function(v14)
            v13(v6({
                toastMessage = v14
            }));
        end, 
        onClose = function(v15)
            v13(v3(v15));
        end, 
        openProfilePeekView = function(v16, v17)
            v13(v2(v16, v17));
        end, 
        openAmpUpsell = function(v18, v19)
            v13(v5(v18, v19));
        end, 
        openLearnMoreLink = function()
            v13(v11());
        end
    }));
end;
