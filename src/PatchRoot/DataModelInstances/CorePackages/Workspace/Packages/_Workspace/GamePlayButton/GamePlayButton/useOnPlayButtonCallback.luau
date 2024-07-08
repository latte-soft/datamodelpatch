local l_script_FirstAncestor_0 = script:FindFirstAncestor("GamePlayButton");
local v1 = require(l_script_FirstAncestor_0.GamePlayButtonShareLinkAnalytics);
local v2 = require(l_script_FirstAncestor_0.OpenCentralOverlayForPurchaseGame);
local v3 = require(l_script_FirstAncestor_0.PlayButtonReferralSource);
local v4 = require(l_script_FirstAncestor_0.PlayButtonStates);
local _ = require(l_script_FirstAncestor_0.PlayButtonTypes);
local v6 = require(l_script_FirstAncestor_0.PlayButtonLaunchChecks.usePlayButtonLaunchAfterSeventeenPlusUpsell);
local v7 = require(l_script_FirstAncestor_0.PlayButtonLaunchChecks.usePlayButtonLaunchGame);
local v8 = require(l_script_FirstAncestor_0.PlayButtonLaunchChecks.useAgeVerificationOverlayCallback);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v10 = require(l_Parent_0.React);
local v11 = require(l_Parent_0.RoactUtils);
local l_useDispatch_0 = v11.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v11.Hooks.RoactRodux.useSelector;
local l_useRouteName_0 = v11.Hooks.useRouteName;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v16 = require(l_Parent_0.RoactServiceTags);
local l_RoactAnalytics_0 = v16.RoactAnalytics;
local l_AppUpdateService_0 = v16.AppUpdateService;
local l_joinGamePlayButton_0 = require(l_Parent_0.ExperienceAnalytics).Points.joinGamePlayButton;
local l_LaunchErrorLocalizationKeys_0 = require(l_Parent_0.GameLaunch).LaunchErrorLocalizationKeys;
local l_PlayabilityStatusEnum_0 = require(l_Parent_0.PlayabilityRodux).Enums.PlayabilityStatusEnum;
local v22 = require(l_Parent_0.ToastRodux);
local l_SetCurrentToastMessage_0 = v22.Actions.SetCurrentToastMessage;
local l_ToastType_0 = v22.Enums.ToastType;
local l_getAppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).getAppFeaturePolicies;
local l_Localization_0 = require(l_Parent_0.RobloxAppLocales).Localization;
local l_CheckForUpdate_0 = require(l_Parent_0.RobloxAppUpdate).Thunks.CheckForUpdate;
local l_useGameProductInfoSelector_0 = require(l_Parent_0.GameProductInfoRodux).useGameProductInfoSelector;
local l_GetFFlagAgeVerificationFlowFromVoiceEligibleGames_0 = require(l_Parent_0.SharedFlags).GetFFlagAgeVerificationFlowFromVoiceEligibleGames;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_game_EngineFeature_0 = game:GetEngineFeature("AutoUpgradeEngineFeatureOnly");
local l_game_EngineFeature_1 = game:GetEngineFeature("CanPerformBinaryUpdateEnabled");
local v33 = nil;
local v34 = "";
local function _(v35, v36)
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    if v33 == nil then
        v33 = l_Localization_0.new(l_RobloxLocaleId_0);
        v34 = l_RobloxLocaleId_0;
    end;
    if v34 ~= l_RobloxLocaleId_0 then
        v33:SetLocale(l_RobloxLocaleId_0);
        v34 = l_RobloxLocaleId_0;
    end;
    return v33:Format(v35, v36);
end;
local function v48(v39, v40, v41, v42)
    local v43 = nil;
    local v44 = nil;
    if not (v39 ~= nil) or v40.playabilityStatus == l_PlayabilityStatusEnum_0.PurchaseRequired and (not (v41 ~= nil) or v41.isForSale == false) then
        v43 = "Feature.GamePage.QuickLaunch.LaunchError.UnplayableOtherReason";
    else
        if v40.playabilityStatus == l_PlayabilityStatusEnum_0.DeviceRestricted then
            local v45 = l_getAppFeaturePolicies_0().getPlatformDisplayName() or "";
            if v45 ~= "" then
                local v46 = {
                    device = v45
                };
                local l_RobloxLocaleId_1 = l_LocalizationService_0.RobloxLocaleId;
                if v33 == nil then
                    v33 = l_Localization_0.new(l_RobloxLocaleId_1);
                    v34 = l_RobloxLocaleId_1;
                end;
                if v34 ~= l_RobloxLocaleId_1 then
                    v33:SetLocale(l_RobloxLocaleId_1);
                    v34 = l_RobloxLocaleId_1;
                end;
                v43 = v33:Format("Feature.GamePage.QuickLaunch.LaunchError.DeviceRestrictedCustom", v46);
                v44 = true;
            end;
        end;
        if not v43 then
            v43 = l_LaunchErrorLocalizationKeys_0[v40.playabilityStatus];
        end;
    end;
    v42(l_SetCurrentToastMessage_0({
        toastType = l_ToastType_0.PlayButtonError, 
        toastMessage = v43, 
        isLocalized = v44
    }));
end;
return function(v49, v50, v51, v52, v53)
    local v54 = l_useRoactService_0(l_RoactAnalytics_0);
    local v55 = l_useRoactService_0(l_AppUpdateService_0);
    local v56 = l_useDispatch_0();
    local v58 = l_useSelector_0(function(v57)
        return v57.GameDetails[v49];
    end);
    local v60 = l_useSelector_0(function(v59)
        return v59.Games[v49];
    end);
    local v61 = l_useGameProductInfoSelector_0(v49);
    local v63 = l_useSelector_0(function(v62)
        return v62.PlayabilityStatus[v49];
    end);
    local v64 = l_useRouteName_0();
    local v65 = (not not v58 and v58.rootPlaceId or v60 and v60.placeId) or nil;
    local v66 = (not not v58 and v58.name or v60 and v60.name) or nil;
    local v67 = v7(v49, v65, v50, v51, v53);
    local v68 = v6(v63, v49, v67);
    local v69 = v8(v49, v67, v68);
    return (v10.useCallback(function(v70, v71)
        l_joinGamePlayButton_0(v54.InfluxDb, "playButtonClicked", {
            isUniversalApp = true, 
            referralSource = v50, 
            placeId = v65, 
            buttonState = not not v70 and v70 or "Invalid", 
            ctx = v51
        });
        if v50 == v3.ExperienceDetailsLink then
            v1(v54, {
                placeId = v65, 
                playButtonState = v70, 
                universeId = v49
            });
        end;
        if v70 == v4.Playable then
            local v72 = nil;
            v72 = not l_GetFFlagAgeVerificationFlowFromVoiceEligibleGames_0() and function()
                v68(v71);
            end or function()
                v69(v71);
            end;
            if not l_game_EngineFeature_0 then
                v72();
                return ;
            else
                v56(l_CheckForUpdate_0(v55, l_game_EngineFeature_1, v54, v72, {
                    ctx = v51
                }));
                return ;
            end;
        elseif not (v70 ~= v4.UnplayableOther) or v70 == v4.Private then
            v48(v65, v63, v61, v56);
            return ;
        elseif v70 == v4.PaidAccess then
            v56(v2(v49, v66, not not v61 and v61.price or nil, not not v61 and v61.productId or nil, not not v61 and v61.sellerId or nil, v52, {
                v64
            }));
            return ;
        elseif v70 == v4.Loading then
            return ;
        else
            error((("invalid play button state %*format(v70)));
            return ;
        end;
    end, {
        v54, 
        v55, 
        l_game_EngineFeature_1, 
        v49, 
        v65, 
        v66, 
        v50, 
        v51, 
        v69, 
        v68, 
        v52, 
        v61, 
        v64
    }));
end;
