local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.RoactRodux);
local v3 = require(l_CorePackages_0.UIBlox);
local v4 = require(l_CorePackages_0.RoactNavigation);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local v6 = require(l_CorePackages_0.Cryo);
local l_withNavigation_0 = v4.withNavigation;
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v9 = require(l_CorePackages_0.Roact);
local v10 = require(l_CorePackages_0.Packages.t);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v12 = require(l_Modules_0.AvatarExperience.Common.Selectors.DEPRECATED_ItemData);
local v13 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectItemInfo);
local v14 = require(l_Modules_0.AvatarExperience.Common.Models.ItemInfo);
local v15 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local v16 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v17 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local l_Focusable_0 = v5.Focusable;
local l_ItemTile_0 = v3.Tile.ItemTile;
local v20 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Thunks.SetEmoteAssetId);
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v22 = require(l_Modules_0.LuaApp.Constants);
local v23 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local v24 = require(l_Modules_0.AvatarExperience.Common.Components.ItemTileDetailButton);
local v25 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local v26 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenItemDetails);
local v27 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_wasLastInputGamepad_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).wasLastInputGamepad;
local v30 = require(l_Modules_0.AvatarExperience.Common.Components.withLastInputGroup);
local v31 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_Constants_0 = v31.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v31.Utils.getRbxthumbWithTypeSizeAndOptions;
local v34 = v9.PureComponent:extend("PPEEmoteItemTile");
v34.validateProps = v10.strictInterface({
    itemId = v10.optional(v10.string), 
    titleFontStyle = v10.optional(v10.table), 
    isSelected = v10.boolean, 
    itemDetailsPeekViewRefs = v10.table, 
    resultsListRef = v10.table, 
    navigation = v10.table, 
    avatarRoute = v10.table, 
    DEPRECATED_itemData = if not v15 then v10.optional(v10.table) else nil, 
    itemInfo = if not v15 then nil else v10.optional(v14.Validator), 
    emoteAssetId = v10.optional(v10.string), 
    name = v10.optional(v10.string), 
    thumbnail = v10.optional(v10.string), 
    avatarType = v10.string, 
    lastInputGroup = v10.string, 
    setEmoteAssetId = v10.callback, 
    navigateWithLock = v10.callback, 
    openItemDetails = v10.callback, 
    focusController = v10.table, 
    catalogAnalytics = v10.table
});
v34.init = function(v35)
    v35.activateMoreButton = function()
        local v36 = nil;
        local v37 = nil;
        if not v15 then
            v36 = v17.DEPRECATED_GetItemSubType(v35.props.itemType, v35.props.DEPRECATED_itemData);
            v37 = if not v35.props.DEPRECATED_itemData then nil else v35.props.DEPRECATED_itemData.priceInRobux;
        elseif v35.props.itemInfo then
            v36 = v35.props.itemInfo.itemSubType;
            v37 = v35.props.itemInfo.priceInRobux;
        end;
        v35.props.openItemDetails({
            itemId = v35.props.itemId, 
            itemType = v16.ItemType.Asset, 
            itemSubType = v36, 
            priceInRobux = v37, 
            catalogAnalytics = v35.props.catalogAnalytics, 
            avatarRoute = v35.props.avatarRoute, 
            navigation = v35.props.navigation, 
            itemDetailsPeekViewRefs = v35.props.itemDetailsPeekViewRefs, 
            resultsListRef = v35.props.resultsListRef, 
            mountAsFullView = true, 
            closePreviousItemDetails = true
        });
    end;
    v35.toggleSelectEmote = function()
        local l_itemId_0 = v35.props.itemId;
        local l_navigation_0 = v35.props.navigation;
        if l_itemId_0 == v35.props.emoteAssetId then
            v35.props.setEmoteAssetId(nil, l_navigation_0);
            return ;
        elseif not (v35.props.avatarType == v16.AvatarType.R6) then
            v35.props.setEmoteAssetId(l_itemId_0, l_navigation_0);
            return ;
        else
            v35.props.navigation.navigate(v21.R15UpgradePrompt, {
                bodyTextKey = "Feature.Avatar.Label.PPEEmoteR15Warning", 
                onSwitchSelected = function()
                    v35.props.setEmoteAssetId(l_itemId_0, l_navigation_0);
                end, 
                onOverlayClosed = function()
                    local v40 = l_wasLastInputGamepad_0();
                    v23("EmotesScrollView", v40);
                    if v40 then
                        v35.props.focusController.captureFocus();
                    end;
                end
            });
            return ;
        end;
    end;
end;
v34.shouldProvideControlsToViewItemDetails = function(v41)
    if v41.props.itemId then
        if v41.props.isSelected then
            return true;
        else
            return false;
        end;
    else
        return false;
    end;
end;
v34.renderMoreButton = function(v42)
    if v42:shouldProvideControlsToViewItemDetails() then
        if not (v42.props.lastInputGroup == v22.InputType.Gamepad) then
            return v9.createElement(v24, {
                activateButton = v42.activateMoreButton
            });
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
v34.render = function(v43)
    return v9.createElement(l_Focusable_0[l_ItemTile_0], {
        isSelected = v43.props.isSelected, 
        onActivated = v43.toggleSelectEmote, 
        thumbnail = v43.props.thumbnail, 
        titleTextLineCount = v16.ItemTileTitleMaxLines, 
        titleFontStyle = v43.props.titleFontStyle, 
        name = v43.props.name, 
        inputBindings = {
            ToggleSelect = v5.Input.onBegin(Enum.KeyCode.ButtonA, v43.toggleSelectEmote), 
            MoreDetails = if not v43:shouldProvideControlsToViewItemDetails() then nil else v5.Input.onBegin(Enum.KeyCode.ButtonX, v43.activateMoreButton, {
                key = "CommonUI.Features.Label.More"
            })
        }, 
        renderTileInset = function()
            return v43:renderMoreButton();
        end
    });
end;
v34 = l_RoactServices_0.connect({
    catalogAnalytics = v27
})((v8((l_withNavigation_0(v2.connect(function(v44, v45)
    local l_emoteAssetId_0 = v44.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.emoteAssetId;
    local l_AvatarType_0 = v44.AvatarExperience.AvatarEditor.Character.AvatarType;
    local l_itemId_1 = v45.itemId;
    local v49 = nil;
    local v50 = nil;
    local v51 = nil;
    local v52 = nil;
    if l_itemId_1 then
        if not v15 then
            v49 = v12(v44.AvatarExperience.Common, l_itemId_1, v16.ItemType.Asset);
            v50 = not not v49 and v49.name or nil;
        else
            v52 = v13(v44.AvatarExperience, l_itemId_1, v16.ItemType.Asset);
            if v52 then
                v50 = v52.name;
            end;
        end;
        v51 = l_getRbxthumbWithTypeSizeAndOptions_0(l_itemId_1, l_Constants_0.RbxthumbTypes.Asset, 150);
    end;
    return {
        DEPRECATED_itemData = v49, 
        itemInfo = v52, 
        emoteAssetId = l_emoteAssetId_0, 
        name = v50, 
        thumbnail = v51, 
        avatarType = l_AvatarType_0
    };
end, function(v53)
    return {
        setEmoteAssetId = function(v54, v55)
            return v53(v20(v54, v55));
        end, 
        navigateWithLock = function(v56)
            v53(v25(v56));
        end, 
        openItemDetails = function(v57)
            v53(v26(v57));
        end
    };
end)((v30(v34))), nil)))));
return function(v58)
    return v5.withFocusController(function(v59)
        return v9.createElement(v34, v6.Dictionary.join(v58, {
            focusController = v59
        }));
    end);
end;
