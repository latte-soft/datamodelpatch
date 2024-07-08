local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.AvatarExperienceDeps);
local l_withNavigation_0 = require(l_CorePackages_0.RoactNavigation).withNavigation;
local v7 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v7.Focusable;
local l_RoactFitComponents_0 = v5.RoactFitComponents;
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.SellPage.CurrentlySellingRow);
local l_FitTextLabel_0 = l_RoactFitComponents_0.FitTextLabel;
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v17 = v3.PureComponent:extend("CurrentlySellingList");
v17.init = function(v18)
    v18.removeSoldItem = function(v19)
        v18.props.navigation.navigate(v11.RemoveCurrentlySellingItemPrompt, {
            itemId = v18.props.itemId, 
            userAssetId = v19, 
            onOverlayClosed = v18.props.onOverlayClosed
        });
        v18:setState({
            restorePreviousChildFocus = false
        });
    end;
    v18:setState({
        restorePreviousChildFocus = true
    });
    v18.onFocusGained = function()
        if not v18.state.restorePreviousChildFocus then
            v18:setState({
                restorePreviousChildFocus = true
            });
        end;
    end;
    v18.focusableRefs = v7.createRefCache();
end;
v17.createRemovableList = function(v20, v21)
    local l_assetInfo_0 = v20.props.assetInfo;
    local l_currentlySellingList_0 = v20.props.currentlySellingList;
    local v24 = l_assetInfo_0 and l_assetInfo_0.itemRestrictions;
    local v25 = v24 and v24[v12.ItemRestrictions.LimitedUnique];
    local function _(v26)
        local v27 = false;
        if v26 >= 1 then
            v27 = v26 <= #l_currentlySellingList_0;
        end;
        return not not v27 and v20.focusableRefs[v26] or nil;
    end;
    local v29 = {};
    if l_currentlySellingList_0 then
        for v30, v31 in l_currentlySellingList_0, nil, nil do
            local v32 = "CurrentlySellingRow" .. v30;
            local l_createElement_0 = v3.createElement;
            local l_l_FitFrameVertical_0_0 = l_FitFrameVertical_0;
            local v35 = {
                width = UDim.new(1, 0), 
                contentPadding = UDim.new(0, 8), 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                BackgroundTransparency = 1, 
                LayoutOrder = v30
            };
            local v36 = {};
            local l_createElement_1 = v3.createElement;
            local l_v13_0 = v13;
            local v39 = {
                isLimitedUnique = v25, 
                horizontalPadding = 24, 
                LayoutOrder = 1, 
                onActivated = function()
                    v20.removeSoldItem(v31);
                end, 
                userAssetId = v31
            };
            local v40 = v30 - 1;
            local v41 = false;
            if v40 >= 1 then
                v41 = v40 <= #l_currentlySellingList_0;
            end;
            v39.NextSelectionUp = not not v41 and v20.focusableRefs[v40] or nil;
            v40 = v30 + 1;
            v41 = false;
            if v40 >= 1 then
                v41 = v40 <= #l_currentlySellingList_0;
            end;
            v39.NextSelectionDown = not not v41 and v20.focusableRefs[v40] or nil;
            local l_Ref_0 = v3.Ref;
            v41 = false;
            if v30 >= 1 then
                v41 = v30 <= #l_currentlySellingList_0;
            end;
            v39[l_Ref_0] = not not v41 and v20.focusableRefs[v30] or nil;
            v39.onFocusGained = v20.onFocusGained;
            v36.CurrentlySellingRow = l_createElement_1(l_v13_0, v39);
            v36.Divider = v3.createElement("Frame", {
                BackgroundColor3 = v21.Divider.Color, 
                BackgroundTransparency = v21.Divider.Transparency, 
                BorderSizePixel = 0, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, -24, 0, 1)
            });
            v29[v32] = l_createElement_0(l_l_FitFrameVertical_0_0, v35, v36);
        end;
    end;
    return v29;
end;
v17.renderLocalized = function(v43, v44)
    local l_LayoutOrder_0 = v43.props.LayoutOrder;
    local l_currentlySellingList_1 = v43.props.currentlySellingList;
    return l_withStyle_0(function(v47)
        local l_Font_0 = v47.Font;
        local l_Theme_0 = v47.Theme;
        return v3.createElement(l_Focusable_0[l_FitFrameVertical_0], {
            width = UDim.new(1, 0), 
            contentPadding = UDim.new(0, 6), 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            BackgroundTransparency = 1, 
            LayoutOrder = l_LayoutOrder_0, 
            NextSelectionLeft = v43.props.NextSelectionLeft, 
            NextSelectionRight = v43.props.NextSelectionRight, 
            NextSelectionUp = v43.props.NextSelectionUp, 
            NextSelectionDown = v43.props.NextSelectionDown, 
            [v3.Ref] = v43.props.forwardRef, 
            defaultChild = (not not l_currentlySellingList_1 and #l_currentlySellingList_1 > 0) and v43.focusableRefs[1] or nil, 
            restorePreviousChildFocus = v43.state.restorePreviousChildFocus
        }, {
            CurrentlySellingLabelContainer = v3.createElement(l_FitFrameVertical_0, {
                width = UDim.new(1, 0), 
                margin = l_RoactFitComponents_0.Rect.quad(0, 0, 0, 24), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                CurrentlySellingLabel = v3.createElement(l_FitTextLabel_0, {
                    width = UDim.new(1, 0), 
                    Font = l_Font_0.CaptionSubHeader.Font, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1, 
                    Text = v44.headerText, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextSize = l_Font_0.BaseSize * l_Font_0.CaptionSubHeader.RelativeSize, 
                    TextColor3 = l_Theme_0.TextEmphasis.Color
                })
            }), 
            CurrentlySellingRowContainer = v3.createElement(l_FitFrameVertical_0, {
                width = UDim.new(1, 0), 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 2
            }, (v43:createRemovableList(l_Theme_0)))
        });
    end);
end;
v17.render = function(v50)
    local l_currentlySellingList_2 = v50.props.currentlySellingList;
    if not l_currentlySellingList_2 or #l_currentlySellingList_2 == 0 then
        return ;
    else
        return l_withLocalization_0({
            headerText = "Feature.Catalog.Label.OnSale"
        })(function(v52)
            return v50:renderLocalized(v52);
        end);
    end;
end;
v17 = l_withNavigation_0((v4.connect(function(v53, v54)
    return {
        assetInfo = v53.AvatarExperience.Common.AssetInfos[v54.itemId], 
        currentlySellingList = v53.AvatarExperience.Catalog.Sell.CurrentlySellingAssets[v54.itemId]
    };
end, nil)(v17)));
return v3.forwardRef(function(v55, v56)
    return v3.createElement(v17, v2.Dictionary.join(v55, {
        forwardRef = v56
    }));
end);
