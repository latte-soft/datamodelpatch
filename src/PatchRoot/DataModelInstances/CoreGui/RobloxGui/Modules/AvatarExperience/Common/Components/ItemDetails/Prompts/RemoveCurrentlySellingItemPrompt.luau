local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v9 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v11 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v14 = require(l_CorePackages_0.UIBlox);
local l_InteractiveAlert_0 = v14.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v14.App.Button.Enum.ButtonType;
local v17 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.RemoveCurrentlySellingAsset);
local v18 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.UpdateCollectibleInstanceResaleState);
local v19 = v2.PureComponent:extend("RemoveCurrentlySellingItemPrompt");
v19.init = function(v20)
    v20.removeSoldItem = function()
        if v20.props.fetchingState == l_RetrievalStatus_0.Fetching then
            return ;
        else
            local l_itemId_0 = v20.props.itemId;
            local l_collectibleItemId_0 = v20.props.collectibleItemId;
            local l_userAssetId_0 = v20.props.userAssetId;
            local l_networking_0 = v20.props.networking;
            local l_localUserId_0 = v20.props.localUserId;
            if not l_collectibleItemId_0 then
                v20.props.removeCurrentlySellingAsset(l_networking_0, l_itemId_0, l_userAssetId_0, l_localUserId_0);
                return ;
            else
                v20.props.removeCurrentlySellingCollectible(l_networking_0, l_collectibleItemId_0, l_userAssetId_0);
                return ;
            end;
        end;
    end;
    v20.closePrompt = function()
        v13.closeOverlay(v20.props.navigation);
    end;
end;
v19.willUpdate = function(v26, v27, _)
    if v11.isFetchingDoneOrFailed(v26.props.fetchingState, v27.fetchingState) then
        v26.closePrompt();
    end;
end;
v19.renderAlertLocalized = function(v29, v30)
    return v2.createElement(l_InteractiveAlert_0, {
        title = v30.titleText, 
        bodyText = v30.messageText, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v29.closePrompt, 
                        text = v30.cancelButtonText
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        isLoading = v29.props.fetchingState == l_RetrievalStatus_0.Fetching, 
                        onActivated = v29.removeSoldItem, 
                        text = v30.confirmButtonText
                    }
                }
            }
        }, 
        screenSize = v29.props.screenSize, 
        defaultChildRef = v29.props.defaultChildRef
    });
end;
v19.render = function(v31)
    return l_withLocalization_0({
        titleText = "Feature.Catalog.Heading.TakeOffSale", 
        messageText = "Feature.Catalog.Label.TakeOffResaleConfirmation", 
        confirmButtonText = "Feature.Catalog.Heading.TakeOffSale", 
        cancelButtonText = "Feature.Catalog.Action.Cancel"
    })(function(v32)
        return v31:renderAlertLocalized(v32);
    end);
end;
return (v12((v10((l_RoactServices_0.connect({
    networking = v5
})((v3.connect(function(v33, v34)
    return {
        localUserId = v33.LocalUserId, 
        fetchingState = l_PerformFetch_0.GetStatus(v33, if not v34.collectibleItemId then v9.RemoveCurrentlySellingAssetKey else v9.UpdateCollectibleInstanceResaleStateKey .. tostring(v34.userAssetId)), 
        screenSize = v33.ScreenSize
    };
end, function(v35)
    return {
        removeCurrentlySellingAsset = function(v36, v37, v38, v39)
            return v35(v17(v36, v37, v38, v39));
        end, 
        removeCurrentlySellingCollectible = function(v40, v41, v42)
            return v35(v18(v40, v41, v42, false, nil));
        end
    };
end)(v19))))))));
