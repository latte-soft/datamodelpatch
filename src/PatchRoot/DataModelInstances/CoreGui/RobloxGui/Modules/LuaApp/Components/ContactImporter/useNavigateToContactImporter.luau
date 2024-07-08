local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v5 = require(l_Modules_0.LuaApp.Thunks.OpenPhoneVerificationWebview);
local v6 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v7 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v8 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v9 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v10 = require(l_Modules_0.LuaApp.Thunks.OpenContactImporterLearnMoreLink);
local v11 = require(l_Modules_0.LuaApp.Thunks.OpenProfilePeekView);
local l_EnumScreens_0 = require(l_CorePackages_0.Workspace.Packages.SocialModalsCommon).EnumScreens;
local l_getContactImporterParams_0 = require(l_CorePackages_0.Workspace.Packages.ContactImporter).Utils.getContactImporterParams;
local v14 = require(l_Modules_0.LuaApp.Components.AmpUpsell.OpenAmpWizardContainer);
return function()
    local v15 = l_useSelector_0(l_getContactImporterParams_0);
    local l_isDiscoverabilityUnset_0 = v15.isDiscoverabilityUnset;
    local l_isPhoneVerified_0 = v15.isPhoneVerified;
    local v18 = l_useDispatch_0();
    local function v20(v19)
        v18(v9({
            toastMessage = v19
        }));
    end;
    local function v21()
        v18(v10());
    end;
    local function _(v22)
        v18(v5(v22));
    end;
    local function v26(v24, v25)
        v18(v11(v24, v25));
    end;
    local function v29(v27, v28)
        v18(v14(v27, v28));
    end;
    local v30 = l_useNavigation_0();
    local v31 = v6(v7);
    local v32 = v6(v8);
    return function()
        v30.navigate(l_EnumScreens_0.ContactImporter, {
            showToast = v20, 
            openLearnMoreLink = v21, 
            isFromAddFriendsPage = false, 
            diagService = if not v32 then nil else v32.Diag, 
            eventIngestService = v31, 
            closeModal = v30.pop, 
            isDiscoverabilityUnset = l_isDiscoverabilityUnset_0, 
            isPhoneVerified = l_isPhoneVerified_0, 
            openProfilePeekView = v26, 
            openAmpUpsell = v29
        });
    end;
end;
