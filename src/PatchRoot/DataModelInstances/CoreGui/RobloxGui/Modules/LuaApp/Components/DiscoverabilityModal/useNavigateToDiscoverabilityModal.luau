local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local v4 = require(l_CorePackages_0.Workspace.Packages.React);
local v5 = require(l_CorePackages_0.Promise);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v7 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v8 = require(l_Modules_0.LuaApp.Thunks.OpenContactImporterLearnMoreLink);
local l_dependencies_0 = require(l_CorePackages_0.Workspace.Packages.DiscoverabilityModal).dependencies;
local l_getContactImporterParams_0 = require(l_CorePackages_0.Workspace.Packages.ContactImporter).Utils.getContactImporterParams;
local l_EnumScreens_0 = require(l_CorePackages_0.Workspace.Packages.SocialModalsCommon).EnumScreens;
return function()
    local v12 = l_useSelector_0(l_getContactImporterParams_0);
    local l_isDiscoverabilityUnset_0 = v12.isDiscoverabilityUnset;
    local l_isPhoneVerified_0 = v12.isPhoneVerified;
    local v15 = l_useDispatch_0();
    local v16 = l_useNavigation_0();
    local function v18(v17)
        v15(v7({
            toastMessage = v17
        }));
    end;
    local function v19()
        v15(v8());
    end;
    local function _()
        return v15(l_dependencies_0.NetworkingUserSettings.GetUserSettingsMetadata.API());
    end;
    v4.useEffect(function()
        v15(l_dependencies_0.NetworkingUserSettings.GetUserSettingsMetadata.API()):catch(function()
            v5.reject();
        end);
    end, {});
    return function(v21)
        if not l_isDiscoverabilityUnset_0 or not l_isPhoneVerified_0 then
            v21.navigateOnActivated();
            return ;
        else
            v16.navigate(l_EnumScreens_0.DiscoverabilityOverlay, {
                showToast = v18, 
                openLearnMoreLink = v19, 
                isStandaloneDiscoverabilityModal = v21.isStandaloneDiscoverabilityModal, 
                navigateOnActivated = v21.navigateOnActivated, 
                entryPoint = v21.entryPoint
            });
            return ;
        end;
    end;
end;
