local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.UIBlox);
local v6 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v8 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_withStyle_0 = v5.Style.withStyle;
local v11 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v12 = require(l_Modules_0.AvatarExperience.Common.Actions.ClearAnimationPreview);
local v13 = require(l_Modules_0.AvatarExperience.Common.Actions.SetAnimationPreview);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v17 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixItemTypeHandling);
local v18 = {
    {
        AssetType = v11.AssetTypeIdStrings.IdleAnimation, 
        Label = "Feature.Avatar.Label.Idle"
    }, 
    {
        AssetType = v11.AssetTypeIdStrings.WalkAnimation, 
        Label = "Feature.Avatar.Label.Walk"
    }, 
    {
        AssetType = v11.AssetTypeIdStrings.RunAnimation, 
        Label = "Feature.Avatar.Label.Run"
    }, 
    {
        AssetType = v11.AssetTypeIdStrings.JumpAnimation, 
        Label = "Feature.Avatar.Label.Jump"
    }, 
    {
        AssetType = v11.AssetTypeIdStrings.FallAnimation, 
        Label = "Feature.Avatar.Label.Fall"
    }, 
    {
        AssetType = v11.AssetTypeIdStrings.ClimbAnimation, 
        Label = "Feature.Avatar.Label.Climb"
    }, 
    {
        AssetType = v11.AssetTypeIdStrings.SwimAnimation, 
        Label = "Feature.Avatar.Label.Swim"
    }
};
local v19 = v3.PureComponent:extend("AnimationTabs");
v19.init = function(v20)
    v20.isMounted = false;
    v20.isRunningLoop = false;
    v20.validPreviews = {};
    v20.state = {
        previewIndex = 0
    };
end;
v19.updateValidPreviews = function(v21)
    local l_assetInfosByAssetType_0 = v21.props.assetInfosByAssetType;
    if not l_assetInfosByAssetType_0 then
        v21.validPreviews = {};
        return ;
    else
        local v23 = {};
        for _, v25 in v18, nil, nil do
            if l_assetInfosByAssetType_0[v25.AssetType] then
                v23[#v23 + 1] = v25;
            end;
        end;
        v21.validPreviews = v23;
        return ;
    end;
end;
v19.startPreviewLoop = function(v26)
    if not v26.isRunningLoop then
        v26.isRunningLoop = true;
        spawn(function()
            if v26.isMounted and v26.state.previewIndex == 0 then
                v26:setState({
                    previewIndex = 1
                });
            end;
            while true do
                wait(2);
                if v26.isMounted then
                    local l_validPreviews_0 = v26.validPreviews;
                    local v28 = v26.state.previewIndex + 1;
                    if #l_validPreviews_0 < v28 then
                        v28 = 1;
                    end;
                    v26:setState({
                        previewIndex = v28
                    });
                else
                    break;
                end;
            end;
            v26.isRunningLoop = false;
        end);
        return ;
    else
        return ;
    end;
end;
v19.renderWithStyle = function(v29, v30)
    if v29.props.assetInfosByAssetType then
        local l_previewIndex_0 = v29.state.previewIndex;
        local l_validPreviews_1 = v29.validPreviews;
        local v33 = l_validPreviews_1[l_previewIndex_0];
        if v33 then
            local l_Font_0 = v30.Font;
            local l_Theme_0 = v30.Theme;
            local l_Font_1 = l_Font_0.SubHeader1.Font;
            local v37 = l_Font_0.BaseSize * l_Font_0.SubHeader1.RelativeSize;
            local v38 = 1 / #l_validPreviews_1;
            local v39 = {};
            for v40 = 1, #l_validPreviews_1 do
                local v41 = l_previewIndex_0 == v40;
                v39[v40] = v3.createElement("Frame", {
                    AnchorPoint = Vector2.new(1, 0), 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(v38, 0, 1, 0), 
                    Position = UDim2.new(v38 * v40, 0, 0, 0)
                }, {
                    Tab = v3.createElement("Frame", {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        BorderSizePixel = 0, 
                        BackgroundColor3 = not not v41 and l_Theme_0.UIEmphasis.Color or l_Theme_0.UIMuted.Color, 
                        Transparency = not not v41 and l_Theme_0.UIEmphasis.Transparency or l_Theme_0.UIMuted.Transparency, 
                        Size = UDim2.new(1, -4, 0, 6), 
                        Position = UDim2.new(0.5, 0, 0.5, 0)
                    })
                });
            end;
            return l_withLocalization_0({
                labelText = v33.Label
            })(function(v42)
                return v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1
                }, {
                    ListLayout = v3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 0)
                    }), 
                    Tabs = v3.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 20), 
                        LayoutOrder = 1
                    }, v39), 
                    Label = v3.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, -4, 0, 20), 
                        Text = v42.labelText, 
                        Font = l_Font_1, 
                        TextSize = v37, 
                        TextColor3 = l_Theme_0.TextEmphasis.Color, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        TextWrapped = true, 
                        LayoutOrder = 2
                    })
                });
            end);
        else
            return ;
        end;
    else
        return ;
    end;
end;
v19.render = function(v43)
    return l_withStyle_0(function(v44)
        return v43:renderWithStyle(v44);
    end);
end;
v19.didUpdate = function(v45, v46, v47)
    local l_assetInfosByAssetType_1 = v46.assetInfosByAssetType;
    local l_assetInfosByAssetType_2 = v45.props.assetInfosByAssetType;
    if l_assetInfosByAssetType_2 ~= l_assetInfosByAssetType_1 then
        v45:updateValidPreviews();
    end;
    if not (l_assetInfosByAssetType_1 or not l_assetInfosByAssetType_2) then
        v45:startPreviewLoop();
    end;
    local l_previewIndex_1 = v47.previewIndex;
    local l_previewIndex_2 = v45.state.previewIndex;
    if l_previewIndex_1 ~= l_previewIndex_2 then
        local v52 = v45.validPreviews[l_previewIndex_2];
        local v53 = if not v52 then nil else l_assetInfosByAssetType_2[v52.AssetType];
        if v53 then
            v45.props.setAnimationPreview(v53.id, v52.AssetType);
        end;
    end;
end;
v19.didMount = function(v54)
    v54.isMounted = true;
    if not v54.props.assetInfosByAssetType then
        local l_analytics_0 = v54.props.analytics;
        local l_networking_0 = v54.props.networking;
        for _, v58 in v54.props.assetIds, nil, nil do
            v54.props.fetchItemDetails(l_networking_0, l_analytics_0, v58, v11.ItemType.Asset);
        end;
        return ;
    else
        v54:updateValidPreviews();
        v54:startPreviewLoop();
        return ;
    end;
end;
v19.willUnmount = function(v59)
    v59.props.clearAnimationPreview();
    v59.isMounted = false;
end;
local function v68(v60)
    local v61 = {};
    if not v17 then
        local l_DEPRECATED_itemData_0 = v60.DEPRECATED_itemData;
        if not (not l_DEPRECATED_itemData_0 or not l_DEPRECATED_itemData_0.items) then
            for _, v64 in l_DEPRECATED_itemData_0.items, nil, nil do
                if v64.type == v11.ItemType.Asset then
                    v61[#v61 + 1] = v64.id;
                end;
            end;
        end;
        return v61;
    else
        local l_itemInfo_0 = v60.itemInfo;
        if l_itemInfo_0 then
            if l_itemInfo_0.bundleInfo then
                if l_itemInfo_0.bundleInfo.items then
                    for _, v67 in l_itemInfo_0.bundleInfo.items, nil, nil do
                        if v67.type == v11.ItemType.Asset then
                            v61[#v61 + 1] = v67.id;
                        end;
                    end;
                    return v61;
                else
                    return v61;
                end;
            else
                return v61;
            end;
        else
            return v61;
        end;
    end;
end;
local function v76(v69, v70)
    local v71 = {};
    local v72 = false;
    for _, v74 in v69, nil, nil do
        local v75 = v70[v74];
        if v75 then
            if v75.assetType then
                assert(v75.assetType, "silence type checker");
                v71[v75.assetType] = v75;
                v72 = true;
            else
                return nil;
            end;
        else
            return nil;
        end;
    end;
    return not not v72 and v71 or nil;
end;
local function v86(v77, v78)
    local v79 = v68(v78);
    local l_AssetInfos_0 = v77.AvatarExperience.Common.AssetInfos;
    local v81 = {};
    local v82 = false;
    for _, v84 in v79, nil, nil do
        local v85 = l_AssetInfos_0[v84];
        if v85 then
            if v85.assetType then
                assert(v85.assetType, "silence type checker");
                v81[v85.assetType] = v85;
                v82 = true;
            else
                return nil;
            end;
        else
            return nil;
        end;
    end;
    return not not v82 and v81 or nil;
end;
return v4.connect(function(v87, v88)
    if not v17 then
        return {
            assetIds = v68(v88), 
            assetInfosByAssetType = v86(v87, v88)
        };
    else
        local v89 = v68(v88);
        return {
            assetIds = v89, 
            assetInfosByAssetType = v76(v89, v87.AvatarExperience.Common.AssetInfos)
        };
    end;
end, function(v90)
    return {
        fetchItemDetails = function(v91, v92, v93, v94)
            return v90(v14(v91, v92, v93, v94));
        end, 
        clearAnimationPreview = function()
            return v90(v12());
        end, 
        setAnimationPreview = function(v95, v96)
            return v90(v13(v95, v96));
        end
    };
end)((l_RoactServices_0.connect({
    analytics = v6, 
    networking = v8
})(v19)));
