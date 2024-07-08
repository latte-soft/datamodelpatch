local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_NavigateToRoute_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateToRoute;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.UserProfiles);
local v6 = require(l_Parent_0.RoactUtils);
local v7 = require(script.Parent.EditProfileEntryPoint);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useLocalRobuxBalance_0 = require(l_Parent_0.RobloxAppHooks).useLocalRobuxBalance;
local l_useSelector_0 = v6.Hooks.RoactRodux.useSelector;
local l_ProfileScreens_0 = require(l_script_FirstAncestor_0.Common.Constants).ProfileScreens;
local v12 = require(l_script_FirstAncestor_0.Networking.UsersNetworking);
local l_useDispatch_0 = v6.Hooks.RoactRodux.useDispatch;
local l_useEffectOnMount_0 = v6.Hooks.useEffectOnMount;
local l_Images_0 = require(l_Parent_0.UIBlox).App.ImageSet.Images;
local l_getDeepValue_0 = require(l_Parent_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue;
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local v18 = require(l_script_FirstAncestor_0.Flags.FStringEditProfileToAvatarLayerName);
local v19 = require(l_script_FirstAncestor_0.Flags.EditProfileIXP);
local v20 = require(l_script_FirstAncestor_0.Flags.FFlagEditProfileNavigateToAvatar);
local v21 = require(l_script_FirstAncestor_0.Flags.FFlagEditProfileToAvatarIXPEnabled);
local v22 = require(l_script_FirstAncestor_0.Analytics);
local l_EventNames_0 = v22.EventNames;
local l_useAnalytics_0 = v22.useAnalytics;
local v25 = require(l_script_FirstAncestor_0.Flags.FFlagEditProfileFixLogging);
local v26 = require(l_script_FirstAncestor_0.Flags.FFlagEditProfileAddLoggingForEditAvatar);
return function(v27)
    local v28 = l_useDispatch_0();
    local v29 = l_useLocalUserId_0();
    local v30 = "";
    local v31 = "";
    local v32 = true;
    local v33 = v27.navigation.getParam(l_ProfileScreens_0);
    local v34, v35 = v4.useState(false);
    local v37 = l_useSelector_0(function(v36)
        return l_getDeepValue_0(v36, (("Profile.AdditionalUserFields.%*.description"):format(v29)));
    end);
    local v38 = l_useLocalRobuxBalance_0();
    local v39 = v27.navigation.getParam("navigateToEditUsername");
    local v40 = v27.navigation.getParam("navigateDownToPurchaseRobux");
    local v41, v42 = v4.useState(v37);
    local v43 = nil;
    v43 = if not v25 then if v19.useIsExperimentEnabled() then l_useAnalytics_0() else nil else l_useAnalytics_0();
    local v44 = nil;
    if v21 then
        v44 = l_useUserExperiment_0({
            v18
        }, function(v45)
            return (v45[v18] or {}).profile_picture_on;
        end);
    end;
    l_useEffectOnMount_0(function()
        if not (not v25 and not v43) then
            v43.fireAnalyticsEvent(l_EventNames_0.EditProfileOpened);
        end;
        v28(v12.GetDisplayNameValidation.API(v29, "Test")):andThen(function(_)
            v35(true);
        end):catch(function(_)
        end);
    end);
    local function v49(v48)
        v27.navigation.navigate(v33.GenericToast, {
            toastProps = {
                toastContent = {
                    toastTitle = v48, 
                    iconImage = l_Images_0["icons/actions/accept"]
                }
            }
        });
    end;
    local v50 = v27.testProp_openEditProfilePicture or function()
        if v26 then
            v43.fireAnalyticsEvent(l_EventNames_0.OpenAvatarMarketplace);
        end;
        v28(l_NavigateToRoute_0({
            {
                name = l_AppPage_0.Catalog
            }
        }));
    end;
    local v51 = v5.Hooks.useUserProfilesFetch({
        userIds = {
            v29
        }, 
        query = v5.Queries.userProfilesDisplayNameAndUsernameByUserIds
    });
    if v51.data then
        v30 = v5.Selectors.getUsernameFromId(v51.data, v29);
        v31 = v5.Selectors.getDisplayNameFromId(v51.data, v29);
        v32 = false;
    end;
    return v4.createElement(v7, {
        shouldShimmerName = v32, 
        username = v30, 
        displayName = v31, 
        description = v41, 
        localUserId = v29, 
        onClose = function()
            v27.navigation.pop();
        end, 
        openDisplayNameModal = function()
            if v43 then
                v43.fireAnalyticsEvent(l_EventNames_0.DisplayNameModalOpened);
            end;
            if not v34 then
                v27.navigation.navigate(v33.EditDisplayNameErrorModal);
                return ;
            else
                v27.navigation.navigate(v33.EditDisplayNameModal, {
                    showToast = v49, 
                    setDisplayNameAvailable = v35, 
                    displayName = v31
                });
                return ;
            end;
        end, 
        navigateToEditUsername = function()
            if not v25 then
                if v43 then
                    v43.fireAnalyticsEvent(l_EventNames_0.EditUsernameOpened);
                end;
            else
                v43.fireAnalyticsEvent(l_EventNames_0.EditUsernameOpened);
            end;
            if v38 >= 1000 then
                v39(v49);
                return ;
            else
                v27.navigation.navigate(v33.UsernameInsufficientFundsModal, {
                    robux = 1000 - v38, 
                    navigateDownToPurchaseRobux = v40
                });
                return ;
            end;
        end, 
        openEditDescription = function()
            v27.navigation.navigate(v33.EditDescriptionModal, {
                initialText = v41, 
                setDescription = v42
            });
        end, 
        openEditProfilePicture = if v20 or v44 then v50 else nil
    });
end;
