local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.CreateOutfit);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v8 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.PurchasePromptInteractiveAlert);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.PurchaseLooksProduct);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.WearAfterOutfitPurchase);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v13 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v16 = require(l_Modules_0.AvatarExperience.Common.Util.CharacterManagerUtils);
local v17 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v18 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v19 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v20 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v21 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v22 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local l_useTriggerFeedback_0 = require(l_CorePackages_0.Workspace.Packages.InteractionFeedback).useTriggerFeedback;
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local v28 = game:DefineFastInt("AXLookOutfitCreationDelayMs", 0);
local v29 = game:DefineFastFlag("SupportAlreadyOwnedItemPurchaseStatus", false);
local v30 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagLooksAnalyticsFixes);
local v31 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableWearAfterPurchaseDefaultChecked);
local l_GetFFlagEnableUISoundAndHaptics_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableUISoundAndHaptics;
local v33 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXRefactorTryOnItems);
local function _(v34)
    v14.closeOverlay(v34);
end;
local function v40(v36, v37, v38)
    local v39 = v37.itemType == v8.ItemType.Bundle;
    return {
        assetId = if v39 then nil else v36, 
        assetIsWearable = not v39, 
        assetType = if not v39 then nil else v8.ItemType.Bundle, 
        bundleId = if not v39 then nil else v36, 
        itemSubType = v37.itemSubType, 
        overrideOrder = v37.order, 
        owned = true, 
        purchased = v38, 
        tryOnBundleInfo = if not v39 then nil else v37.bundleInfo
    };
end;
local function v47(v41, v42, v43)
    local l_successCount_0 = v41.successCount;
    local l_failureCount_0 = v41.failureCount;
    if l_successCount_0 > 0 and l_failureCount_0 <= 0 then
        v42(v17({
            isLocalized = true, 
            toastMessage = if l_successCount_0 == 1 then v43:Format("Feature.Avatar.Message.LooksPurchaseSuccessSingular", {
                numItems = l_successCount_0
            }) else v43:Format("Feature.Avatar.Message.LooksPurchaseSuccessPlural", {
                numItems = l_successCount_0
            }), 
            toastType = v18.PurchaseMessage
        }));
        return ;
    elseif l_successCount_0 > 0 and l_failureCount_0 > 0 then
        local _ = nil;
        v42(v17({
            isLocalized = true, 
            toastMessage = v43:Format("Feature.Avatar.Heading.LooksPurchasePartialSuccess"), 
            toastSubMessage = v43:Format((l_successCount_0 == 1 and l_failureCount_0 == 1) and "Feature.Avatar.Message.LooksPurchasePartialSuccessGenericSS" or ((l_successCount_0 == 1 and l_failureCount_0 > 1) and "Feature.Avatar.Message.LooksPurchasePartialSuccessGenericSP" or ((l_successCount_0 > 1 and l_failureCount_0 == 1) and "Feature.Avatar.Message.LooksPurchasePartialSuccessGenericPS" or "Feature.Avatar.Message.LooksPurchasePartialSuccessGenericPP")), {
                numSuccessItems = l_successCount_0, 
                numFailureItems = l_failureCount_0
            }), 
            toastType = v18.NetworkingError
        }));
        return ;
    elseif l_successCount_0 <= 0 and l_failureCount_0 > 0 then
        v42(v17({
            isLocalized = true, 
            toastMessage = v43:Format("Feature.Avatar.Heading.LooksPurchaseFailed"), 
            toastSubMessage = v43:Format("Feature.Avatar.Message.LooksPurchaseFailedNetworkError"), 
            toastType = v18.NetworkingError
        }));
        return ;
    else
        return ;
    end;
end;
return (v15(function(v48)
    local v49 = v20(v22);
    local v50 = l_useDispatch_0();
    local v51 = v20(v21);
    local v52 = v19({
        buyButtonText = "Feature.Avatar.Title.BuyOutfit", 
        buyLookQuestion = "Feature.Avatar.Label.BuyLookQuestion", 
        buyLookTitle = "Feature.Avatar.Title.BuyOutfit", 
        getButtonText = "Feature.Catalog.Label.Get", 
        getLookQuestion = "Feature.Avatar.Label.GetLookQuestion", 
        getLookTitle = "Feature.Avatar.Title.GetOutfit", 
        characterSavedHeading = "Feature.Avatar.Heading.LooksCharacterSaved", 
        characterSavedMsg = "Feature.Avatar.Message.LooksCharacterSaved"
    });
    local v53 = v20(v5);
    local v54 = v20(v12);
    local v55 = if not l_GetFFlagEnableUISoundAndHaptics_0() then nil else l_useTriggerFeedback_0();
    local v56, v57 = v2.useState(false);
    local v58, v59 = v2.useState(v31());
    local v60, v61 = v2.useState(true);
    local v63 = l_useSelector_0(function(v62)
        return v62.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    end);
    local v65 = if v30() then nil else l_useSelector_0(function(v64)
        return v64.AvatarExperience.AvatarScene.OutfitTryOn.LookAnalyticsInfo;
    end);
    local v67 = l_useSelector_0(function(v66)
        return v66.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype;
    end);
    local v69 = l_useSelector_0(function(v68)
        return v68.AvatarExperience.AvatarEditor.OutfitInfos;
    end);
    local v71 = l_useSelector_0(function(v70)
        return v16.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn(v70);
    end);
    local function v72()
        v59(not v58);
    end;
    local function v73()
        v61(not v60);
    end;
    local function v75(v74)
        if v74 then
            v50(v17({
                isLocalized = true, 
                toastMessage = v52.characterSavedHeading, 
                toastSubMessage = v52.characterSavedMsg, 
                toastType = v18.SuccessConfirmation
            }));
            return ;
        else
            return ;
        end;
    end;
    local function v83(v76)
        if v58 then
            local v77 = {};
            for v78, v79 in v48.ownedTryOnItems, nil, nil do
                table.insert(v77, (v40(if not v33() then v78 else v79.itemId, v79, false)));
            end;
            for v80, v81 in v76.itemPurchaseStatus, nil, nil do
                local v82 = true;
                if v81 ~= "Success" then
                    v82 = v29 and v81 == "AlreadyOwned";
                end;
                if v82 and v63[v80] ~= nil then
                    table.insert(v77, (v40(v80, v63[v80], true)));
                end;
            end;
            v50(v11(v77, v48.navigation, nil));
            return ;
        else
            return ;
        end;
    end;
    local function v86()
        if v60 then
            if v28 > 0 then
                task.wait(v28 / 1000);
            end;
            local v84 = nil;
            for v85 = 1, 1000 do
                v84 = "Outfit" .. v85;
                if not v7.isDuplicateOutfitName(v67, v69, v84) then
                    break;
                end;
            end;
            v50(v6(v49, v84, v53, function()
                return true;
            end, v75, v71));
            return ;
        else
            return ;
        end;
    end;
    local function v90()
        if not v56 then
            v57(true);
            if l_GetFFlagEnableUISoundAndHaptics_0() then
                v55("MakePurchase", "Press");
            end;
            local v87 = nil;
            if not v30() then
                v87 = if not v65 then nil else v4.Dictionary.join(v65, {
                    totalRobux = v48.priceInRobux
                });
                if v87 then
                    v54.widgetInteractionV2(v87, v13.ActionType.PURCHASE_ATTEMPT);
                end;
            end;
            v50(v10(v49, v48.lookId, v48.priceInRobux, v54)):andThen(function(v88)
                v57(false);
                v47(v88, v50, v51);
                v83(v88);
                v86();
                v14.closeOverlay(v48.navigation);
                if not (v30() or not v87) then
                    v54.widgetInteractionV2(v87, v13.ActionType.PURCHASE_SUCCESS);
                end;
            end, function(_)
                v57(false);
                v50(v17({
                    isLocalized = false, 
                    toastType = v18.NetworkingError, 
                    toastMessage = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName"
                }));
                v14.closeOverlay(v48.navigation);
            end);
            return ;
        else
            return ;
        end;
    end;
    local function v91()
        if not v56 then
            v14.closeOverlay(v48.navigation);
            return ;
        else
            return ;
        end;
    end;
    local v92 = v48.priceInRobux == 0;
    local v93 = nil;
    local v94 = nil;
    local v95 = nil;
    if not v92 then
        v93 = v52.buyLookTitle;
        v94 = v52.buyLookQuestion;
        v95 = v52.buyButtonText;
    else
        v93 = v52.getLookTitle;
        v94 = v52.getLookQuestion;
        v95 = v52.getButtonText;
    end;
    return v2.createElement(v9, {
        priceInRobux = v48.priceInRobux, 
        showWearAfterPurchase = v48.showWearAfterPurchase, 
        showSaveAsCharacter = v48.showSaveAsCharacter, 
        isWearAfterPurchaseChecked = v58, 
        isSaveAsCharacterChecked = v60, 
        toggleWearAfterPurchase = v72, 
        toggleSaveAsCharacter = v73, 
        titleText = v93, 
        bodyText = v94, 
        confirmButtonText = v95, 
        onConfirm = v90, 
        onCancel = v91, 
        isLoading = v56, 
        isPurchasingOutfit = true, 
        defaultChildRef = v48.defaultChildRef
    });
end));
