local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("HttpService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.t);
local l_MessageBus_0 = require(l_CorePackages_0.Workspace.Packages.MessageBus).MessageBus;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_SetCentralOverlay_0 = require(l_CorePackages_0.Workspace.Packages.CentralOverlay).Actions.SetCentralOverlay;
local l_CentralOverlayType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).CentralOverlayType;
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.Constants;
local v12 = require(l_CorePackages_0.Workspace.Packages.PaymentsProtocol);
local _ = v12.PaymentsProtocol.default;
local l_ProductType_0 = v12.Enum.ProductType;
local v15 = {
    mid = v12.PaymentsProtocolConstants.MESSAGE_ON_PURCHASE_PROCESSED_EVENT, 
    validateParams = v4.table
};
local v16 = l_MessageBus_0.Subscriber.new();
return function()
    local v17 = l_useDispatch_0();
    local v18, v19 = v3.useState({
        id = nil, 
        name = nil, 
        thumbnailType = nil
    });
    local v26 = v3.useCallback(function(v20, v21, v22)
        local v23 = {
            id = v20, 
            name = nil, 
            thumbnailType = v22
        };
        if v20 then
            local l_status_0, l_result_0 = pcall(function()
                return l_MarketplaceService_0:GetProductInfo(v20, v21);
            end);
            if l_status_0 then
                v23.name = l_result_0.Name;
            end;
        end;
        v19(v23);
    end, {});
    local v27 = l_useLocalization_0({
        titleText = "Feature.AvatarBundleReceivedInteractiveAlert.Title.ItemsAcquired", 
        bodyText = {
            "Feature.AvatarBundleReceivedInteractiveAlert.BodyText.AddedToInventory"; 
            avatarName = not v18.name and "" or v18.name, 
            fontColorSpanStart = "<font color=\"rgb(255, 255, 255)\">", 
            fontColorSpanEnd = "</font>"
        }, 
        errorBodyText = {
            "Feature.AvatarBundleReceivedInteractiveAlert.BodyText.UnknownAddedToInventory"; 
            fontColorSpanStart = "<font color=\"rgb(255, 255, 255)\">", 
            fontColorSpanEnd = "</font>"
        }, 
        okButtonText = "Feature.AvatarBundleReceivedInteractiveAlert.Action.Ok"
    });
    v3.useEffect(function()
        v16:subscribe(v15, function(v28)
            if v28.nativeProduct then
                if v28.nativeProduct.productType == l_ProductType_0.PlayStationPlusItem then
                    if v28.payload then
                        local l_granted_asset_ids_0 = v28.payload.granted_asset_ids;
                        local v30 = if not not l_granted_asset_ids_0 and #l_granted_asset_ids_0 > 0 then l_granted_asset_ids_0[1] else nil;
                        local l_granted_bundle_ids_0 = v28.payload.granted_bundle_ids;
                        local v32 = if not not l_granted_bundle_ids_0 and #l_granted_bundle_ids_0 > 0 then l_granted_bundle_ids_0[1] else nil;
                        if v30 then
                            v26(v30, Enum.InfoType.Asset, l_Constants_0.RbxthumbTypes.Asset);
                        end;
                        if v32 then
                            v26(v32, Enum.InfoType.Bundle, l_Constants_0.RbxthumbTypes.BundleThumbnail);
                        end;
                    else
                        warn("Response does not have payload key");
                        return ;
                    end;
                end;
                return ;
            else
                warn("PaymentProcessedEventReceiver: Response does not have nativeProduct key");
                return ;
            end;
        end);
        return function()
            v16:unsubscribe(v15);
        end;
    end, {});
    v3.useEffect(function()
        if v18.id then
            v17(l_SetCentralOverlay_0(l_CentralOverlayType_0.ItemsReceivedAlert, {
                titleText = v27.titleText, 
                avatarThumbnail = l_getRbxthumbWithTypeSizeAndOptions_0(v18.id, v18.thumbnailType, 420), 
                avatarThumbnailDisplayHeight = not v18.name and 0 or 276, 
                bodyText = if not v18.name then v27.errorBodyText else v27.bodyText, 
                primaryButtonText = v27.okButtonText
            }));
            return ;
        else
            return ;
        end;
    end, {
        v18, 
        v27
    });
end;
