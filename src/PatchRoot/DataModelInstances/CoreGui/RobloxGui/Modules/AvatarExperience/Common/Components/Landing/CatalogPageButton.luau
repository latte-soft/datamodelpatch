local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_NotificationService_0 = game:GetService("NotificationService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Cryo);
local v5 = require(l_CorePackages_0.Roact);
local v6 = require(l_CorePackages_0.RoactRodux);
local v7 = require(l_CorePackages_0.UIBlox);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v10 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v11 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v12 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v13 = require(l_Modules_0.LuaApp.Thunks.FetchDataWithErrorToasts);
local v14 = require(l_Modules_0.LuaApp.Actions.SetSearchParameters);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_Images_0 = v7.App.ImageSet.Images;
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.Landing.PageButton);
local v18 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v20 = require(l_CorePackages_0.Packages.t);
local v21 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
local v22 = require(l_Modules_0.AvatarExperience.Flags.SponsoredItemsIXPTest);
local v23 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchCatalogSearchWithSponsoredItems);
local v24 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_Constants_0 = v24.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v24.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_Asset_0 = l_Constants_0.RbxthumbTypes.Asset;
local l_BundleThumbnail_0 = l_Constants_0.RbxthumbTypes.BundleThumbnail;
local v29 = l_Images_0["icons/menu/shop_large"];
local v30 = v5.PureComponent:extend("CatalogPageButton");
v30.validateProps = v20.strictInterface({
    transparencyModifier = v20.number, 
    NextSelectionLeft = v20.optional(v20.table), 
    NextSelectionRight = v20.optional(v20.table), 
    NextSelectionUp = v20.optional(v20.table), 
    NextSelectionDown = v20.optional(v20.table), 
    onActivated = v20.callback, 
    networking = v20.callback, 
    forwardRef = v20.optional(v20.table), 
    catalogItem = v20.optional(v20.table), 
    dataStatus = v20.string, 
    setSearchParameters = v20.callback, 
    fetchCatalogData = v20.callback, 
    sponsoredItemsEnabled = v20.optional(v20.boolean)
});
v30.defaultProps = {
    transparencyModifier = 0
};
local v31 = Vector2.new(0, 0);
v30.init = function(v32)
    v32.state = {
        style = string.lower(l_NotificationService_0.SelectedTheme)
    };
    v32.fetchInitialCatalogItems = function()
        local l_networking_0 = v32.props.networking;
        local l_sponsoredItemsEnabled_0 = v32.props.sponsoredItemsEnabled;
        local v35 = v11.getCatalogCategoryInfo(1, 0);
        local v36 = {
            searchUuid = v35.SearchUuid, 
            categoryInfo = v35
        };
        v32.props.setSearchParameters(v36.searchUuid, v36);
        return v32.props.fetchCatalogData(l_networking_0, l_sponsoredItemsEnabled_0, v36);
    end;
end;
v30.render = function(v37)
    local l_catalogItem_0 = v37.props.catalogItem;
    local l_style_0 = v37.state.style;
    local l_transparencyModifier_0 = v37.props.transparencyModifier;
    local l_NextSelectionLeft_0 = v37.props.NextSelectionLeft;
    local l_NextSelectionRight_0 = v37.props.NextSelectionRight;
    local l_NextSelectionUp_0 = v37.props.NextSelectionUp;
    local l_NextSelectionDown_0 = v37.props.NextSelectionDown;
    local v45 = "rbxasset://textures/AvatarEditorImages/Catalog_LightTheme.png";
    if l_style_0 == "dark" then
        v45 = "rbxasset://textures/AvatarEditorImages/Catalog.png";
    end;
    local v46 = nil;
    local v47 = 420;
    if l_catalogItem_0 then
        if l_catalogItem_0.type == v12.ItemType.Bundle then
            v46 = l_getRbxthumbWithTypeSizeAndOptions_0(l_catalogItem_0.id, l_BundleThumbnail_0, 420);
            v47 = 420;
        else
            v46 = l_getRbxthumbWithTypeSizeAndOptions_0(l_catalogItem_0.id, l_Asset_0, 420);
            v47 = 420;
        end;
    end;
    local l_forwardRef_0 = v37.props.forwardRef;
    return l_withLocalization_0({
        catalogText = "Feature.Avatar.Action.Marketplace"
    })(function(v49)
        return v5.createElement(v17, {
            Size = UDim2.new(1, 0, 1, 0), 
            backgroundImage = v45, 
            thumbnailImage = v46, 
            thumbnailSize = v47, 
            thumbnailScaleOffset = v31, 
            icon = v29, 
            text = v49.catalogText, 
            transparencyModifier = l_transparencyModifier_0, 
            NextSelectionLeft = l_NextSelectionLeft_0, 
            NextSelectionRight = l_NextSelectionRight_0, 
            NextSelectionUp = l_NextSelectionUp_0, 
            NextSelectionDown = l_NextSelectionDown_0, 
            [v5.Ref] = l_forwardRef_0, 
            onActivated = v37.props.onActivated
        });
    end);
end;
v30.checkFetchSortData = function(v50)
    local v51 = v50.props.dataStatus == v18.NotStarted;
    if not (not (v50.props.catalogItem == nil) or not v51) then
        v50.fetchInitialCatalogItems();
    end;
end;
v30.didUpdate = function(v52)
    v52:checkFetchSortData();
end;
v30.didMount = function(v53)
    v53.themeChangedConn = l_NotificationService_0:GetPropertyChangedSignal("SelectedTheme"):Connect(function()
        v53:setState({
            style = string.lower(l_NotificationService_0.SelectedTheme)
        });
    end);
    v53:checkFetchSortData();
end;
v30.willUnmount = function(v54)
    if v54.themeChangedConn then
        v54.themeChangedConn:Disconnect();
        v54.themeChangedConn = nil;
    end;
end;
v30 = v21.connectTestVariables({
    sponsoredItemsEnabled = v22.EnabledForUser
})((v6.connect(function(v55)
    local l_SearchUuid_0 = v11.getCatalogCategoryInfo(1, 0).SearchUuid;
    assert(l_SearchUuid_0 ~= nil, "searchUuid is not nil. Silence type checker");
    local v57 = v55.Search.SearchesInCatalog[l_SearchUuid_0] or {};
    return {
        catalogItem = (not not v57 and v57.items or {})[1], 
        dataStatus = l_PerformFetch_0.GetStatus(v55, (v11.getSearchKey(v55, l_SearchUuid_0)))
    };
end, function(v58)
    return {
        fetchCatalogData = function(v59, v60, v61)
            return v58(v13(v23(v59, v60, v61)));
        end, 
        setSearchParameters = function(v62, v63)
            return v58(v14(v62, v63));
        end
    };
end)((l_RoactServices_0.connect({
    networking = v10
})(v30)))));
return v5.forwardRef(function(v64, v65)
    return v5.createElement(v30, v4.Dictionary.join(v64, {
        forwardRef = v65
    }));
end);
