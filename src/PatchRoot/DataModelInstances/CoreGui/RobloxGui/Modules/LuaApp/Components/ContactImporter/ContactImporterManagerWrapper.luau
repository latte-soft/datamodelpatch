local l_CorePackages_0 = game:GetService("CorePackages");
local l_IXPService_0 = game:GetService("IXPService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.Components.AmpUpsell.OpenAmpWizardContainer);
local v4 = require(l_Modules_0.LuaApp.Thunks.NavigateToRoute);
local v5 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v6 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForDiscoverabilityUpsell);
local v7 = require(l_Modules_0.LuaApp.Thunks.Verification.OpenPhoneUpsellModal);
local v8 = require(l_Modules_0.LuaApp.Thunks.OpenContactImporterLearnMoreLink);
local v9 = require(l_Modules_0.LuaApp.Thunks.OpenProfilePeekView);
local v10 = require(l_CorePackages_0.Packages.React);
local v11 = require(l_CorePackages_0.Packages.Dash);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_ContactImporterManager_0 = require(l_CorePackages_0.Workspace.Packages.ContactImporter).ContactImporterManager;
local v14 = require(l_Modules_0.LuaApp.Actions.SetHomePageUpsellCardVariation);
local v15 = require(l_Modules_0.LuaApp.Thunks.WaitUntilIXPUserInit);
local l_FFlagContactImporterPhoneAndContactsAfterSignupFixes_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagContactImporterPhoneAndContactsAfterSignupFixes;
return function()
    local v17 = l_useDispatch_0();
    return v10.createElement(l_ContactImporterManager_0, {
        openAmpUpsell = function(v18, v19)
            v17(v3(v18, v19));
        end, 
        navigate = function(v20, v21)
            v17(v4({
                v11.join({
                    name = v20
                }, v21)
            }));
        end, 
        openDiscoverabilityModal = function(v22)
            v17(v6(v22));
        end, 
        onCloseDiscoverabilityModal = function()
            v17(v5());
        end, 
        openPhoneUpsellModal = v7, 
        closeCentralOverlay = v5, 
        openContactImporterLearnMoreLink = v8, 
        openProfilePeekView = v9, 
        hideUpsellCard = if not l_FFlagContactImporterPhoneAndContactsAfterSignupFixes_0 then nil else function()
            v17(v14("", "", ""));
        end, 
        waitUntilIXPUserInit = function(v23)
            return v17(v15(l_IXPService_0, v23));
        end
    });
end;
