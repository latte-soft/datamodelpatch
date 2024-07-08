local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_CorePackages_0.Roact);
local _ = require(l_CorePackages_0.RoactRodux);
local _ = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).UniversalAppPolicy;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local _ = require(l_CorePackages_0.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies;
local l_AppSessionService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSessionService;
local l_useSocialOnboardingButtons_0 = require(l_CorePackages_0.Workspace.Packages.SocialOnboardingButtons).Hooks.useSocialOnboardingButtons;
local l_NavigateDown_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Thunks.NavigateDown;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local v12 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local _ = require(l_Modules_0.LuaApp.Thunks.NavigateDownToAddFriendsPage);
local v14 = require(l_Modules_0.LuaApp.Actions.SetHomePageUpsellCardVariation);
local v15 = require(l_Modules_0.LuaApp.Thunks.Verification.OpenPhoneUpsellModal);
local v16 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v17 = require(l_Modules_0.LuaApp.Thunks.OpenContactImporterLearnMoreLink);
local v18 = require(l_Modules_0.LuaApp.Components.AmpUpsell.OpenAmpWizardContainer);
local v19 = require(l_Modules_0.LuaApp.Thunks.NavigateDownTo3DQRCodePage);
local v20 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local _ = require(l_Modules_0.LuaApp.Constants);
local _ = require(l_Modules_0.LuaApp.Thunks.ConfirmSearch);
local v23 = require(l_Modules_0.LuaApp.Thunks.OpenProfilePeekView);
local v24 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v25 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForDiscoverabilityUpsell);
local _ = require(l_Modules_0.LuaApp.Thunks.NavigateDownToAddFriendsPage);
local _ = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagCleanPlayerSearchProp;
return function(v28)
    local v29 = l_useDispatch_0();
    local _ = l_useNavigation_0();
    local _ = v12(v20);
    local _ = v12(l_AppSessionService_0);
    return l_useSocialOnboardingButtons_0(v28, {
        openPhoneVerificationModal = function(v33)
            return v29(v15({
                onSuccess = v33, 
                eventContext = "verificationUpsell", 
                origin = "friendsCarousel", 
                shouldAutofillAndroidPhoneNumberAtLaunch = true, 
                addPhoneTitleKey = "Feature.ContactUpsell.Header.UnlockVoiceChat"
            }, true));
        end, 
        openLearnMoreLink = function()
            v29(v17());
        end, 
        openAmpUpsell = function(v34, v35)
            v29(v18(v34, v35));
        end, 
        navigateToQRCodePage = function()
            v29(v19({
                source = v28.entryPoint, 
                onClose = function()
                end
            }));
        end, 
        navigateToSearchFriends = function()
            v29(l_NavigateDown_0({
                name = l_AppPage_0.SearchUsers, 
                extraProps = {
                    entryPoint = v28.entryPoint
                }
            }));
        end, 
        openProfilePeekView = function(v36)
            v29(v23(v36, {}));
        end, 
        hideUpsellCard = function()
            v29(v14("", "", ""));
        end, 
        openDiscoverabilityModal = function(v37)
            v29(v25(v37));
        end, 
        closeCentralOverlay = function()
            v29(v24());
        end, 
        showToast = function(v38)
            v29(v16({
                toastMessage = v38
            }));
        end
    });
end;
