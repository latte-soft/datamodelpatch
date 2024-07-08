local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.Cryo);
local v7 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v7.Style.withStyle;
local l_SpringAnimatedItem_0 = v7.Utility.SpringAnimatedItem;
local l_withSelectionCursorProvider_0 = v7.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v7.App.SelectionImage.CursorKind;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v13 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Constants);
local v14 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Components.DraggableTile);
local v15 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Components.LCSortMoreButton);
local v16 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Components.LCSortArrowNav);
local v17 = l_SpringAnimatedItem_0.wrap(v4.Focusable.Frame);
local v18 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_Constants_0 = v18.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v18.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v22 = UDim.new(0, 10);
local v23 = {
    dampingRatio = 1, 
    frequency = 10
};
local v24 = v3.PureComponent:extend("VerticalClothingListTile");
v24.validateProps = v5.strictInterface({
    asset = v5.table, 
    selectedAssetId = v5.optional(v5.string), 
    positionYOffset = v5.number, 
    dragging = v5.boolean, 
    positionBinding = v5.union(v5.UDim2, v5.table), 
    isTileSelected = v5.boolean, 
    tileIndex = v5.number, 
    contextualOptionsVisible = v5.union(v5.boolean, v5.table), 
    updateContextualOptionsVisible = v5.callback, 
    resetSelectedTile = v5.callback, 
    initializeDrag = v5.callback, 
    onEndClick = v5.callback, 
    tileRef = v5.optional(v5.table), 
    lastInputIsGamepad = v5.boolean, 
    NextSelectionUp = v5.optional(v5.table), 
    NextSelectionDown = v5.optional(v5.table), 
    NextSelectionLeft = v5.optional(v5.table), 
    NextSelectionRight = v5.optional(v5.table), 
    wrapperRef = v5.optional(v5.table)
});
v24.defaultProps = {
    lastInputIsGamepad = false
};
v24.init = function(v25)
    v25.tileRef = v25.props.tileRef or v3.createRef();
    v25.timeOfInputBegan = 0;
    v25.clickAndHoldConn = nil;
    v25:setState({
        dragAfterShortPress = false
    });
end;
v24.disconnectConn = function(v26)
    if v26.clickAndHoldConn then
        v26.clickAndHoldConn:Disconnect();
        v26.clickAndHoldConn = nil;
    end;
end;
v24.renderSelectedTile = function(v27, _, v29)
    return v3.createElement(v4.Focusable.Frame, {
        Active = true, 
        BackgroundTransparency = 1, 
        Size = UDim2.fromOffset(v13.Tile.SelectedSize, v13.Tile.SelectedSize), 
        Position = (v27.props.dragging or v27.state.dragAfterShortPress) and v27.props.positionBinding or UDim2.fromOffset(v13.Tile.Padding + v13.Tile.Size / 2, v27.props.positionYOffset + v13.Tile.Size / 2), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        [v3.Event.InputBegan] = function(v30, v31)
            local l_UserInputType_0 = v31.UserInputType;
            if v27.props.dragging or l_UserInputType_0 ~= Enum.UserInputType.MouseButton1 and l_UserInputType_0 ~= Enum.UserInputType.Touch then
                return ;
            else
                v27:setState({
                    dragAfterShortPress = true
                });
                v27.props.updateContextualOptionsVisible(false);
                v27.props.initializeDrag(v30, v31, v27.props.asset, v27.props.tileIndex, v13.Tile.Size / 2);
                return ;
            end;
        end
    }, {
        SelectionBackground = not v27.props.lastInputIsGamepad and v3.createElement("Frame", {
            BackgroundTransparency = 0, 
            BackgroundColor3 = v29.Theme.IconEmphasis.Color, 
            ZIndex = 3, 
            Size = UDim2.fromScale(1, 1)
        }, {
            UICorner = v3.createElement("UICorner", {
                CornerRadius = v22
            })
        }), 
        ItemTile = v3.createElement(v14, {
            thumbnail = l_getRbxthumbWithTypeSizeAndOptions_0(v27.props.asset.id, l_Constants_0.RbxthumbTypes.Asset, 150), 
            isSelectedByTap = true, 
            ZIndex = 4, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.new(1, -4, 1, -4), 
            assetTypeId = v27.props.asset.typeId
        }), 
        LCSortMoreButton = if not l_IsVRAppBuild_0() then v3.createElement(v15, {
            ZIndex = 2, 
            Visible = v27.props.contextualOptionsVisible, 
            asset = v27.props.asset, 
            onUnequip = v27.props.resetSelectedTile
        }) else nil, 
        LCSortArrowNav = v3.createElement(v16, {
            Visible = v27.props.contextualOptionsVisible, 
            index = v27.props.tileIndex, 
            asset = v27.props.asset
        })
    });
end;
v24.renderUnselectedTile = function(v33, _)
    return v3.createElement(v17, {
        animatedValues = {
            positionY = v33.props.positionYOffset
        }, 
        mapValuesToProps = function(v35)
            return {
                Position = UDim2.fromOffset(v13.Tile.Padding, v35.positionY)
            };
        end, 
        regularProps = {
            Active = true, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(v13.Tile.Size, v13.Tile.Size), 
            AnchorPoint = Vector2.new(0, 0), 
            [v3.Event.InputBegan] = function(v36, v37)
                if not v33.props.dragging then
                    local l_UserInputType_1 = v37.UserInputType;
                    if l_UserInputType_1 ~= Enum.UserInputType.MouseButton1 and l_UserInputType_1 ~= Enum.UserInputType.Touch then
                        return ;
                    elseif v37.UserInputState ~= Enum.UserInputState.Begin then
                        return ;
                    else
                        v33:disconnectConn();
                        v33.timeOfInputBegan = tick();
                        v33.clickAndHoldConn = l_RunService_0.RenderStepped:connect(function(_)
                            if v13.LongPressSeconds <= tick() - v33.timeOfInputBegan then
                                if not v33.props.dragging then
                                    v33.props.initializeDrag(v36, v37, v33.props.asset, v33.props.tileIndex);
                                end;
                                v33:disconnectConn();
                            end;
                        end);
                        return ;
                    end;
                else
                    return ;
                end;
            end, 
            [v3.Event.InputEnded] = function(v40, v41)
                if not v33.props.dragging and v33.clickAndHoldConn then
                    local l_UserInputType_2 = v41.UserInputType;
                    if l_UserInputType_2 ~= Enum.UserInputType.MouseButton1 and l_UserInputType_2 ~= Enum.UserInputType.Touch then
                        return ;
                    elseif v41.UserInputState == Enum.UserInputState.Change then
                        v33.props.initializeDrag(v40, v41, v33.props.asset, v33.props.tileIndex);
                        v33:disconnectConn();
                        return ;
                    else
                        v33:disconnectConn();
                        v33.props.updateContextualOptionsVisible(true);
                        v33.props.onEndClick(v33.props.asset);
                        return ;
                    end;
                else
                    return ;
                end;
            end
        }, 
        springOptions = v23
    }, {
        ItemTile = v3.createElement(v14, {
            thumbnail = l_getRbxthumbWithTypeSizeAndOptions_0(v33.props.asset.id, l_Constants_0.RbxthumbTypes.Asset, 150), 
            imageTransparency = v33.props.selectedAssetId == nil and 0 or 0.5, 
            assetTypeId = v33.props.asset.typeId
        })
    });
end;
v24.renderWithProviders = function(v43, v44, v45)
    return v3.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        ZIndex = not v43.props.isTileSelected and 4 or 6, 
        [v3.Ref] = v43.props.wrapperRef, 
        NextSelectionUp = v43.props.NextSelectionUp, 
        NextSelectionDown = v43.props.NextSelectionDown, 
        NextSelectionRight = v43.props.NextSelectionRight, 
        NextSelectionLeft = v43.props.NextSelectionLeft
    }, (v3.createElement(v4.Focusable.Frame, {
        [v3.Ref] = v43.tileRef, 
        SelectionImageObject = v44(l_CursorKind_0.RoundedRectNoInset)
    }, not not v43.props.isTileSelected and v43:renderSelectedTile(v44, v45) or v43:renderUnselectedTile(v44))));
end;
v24.render = function(v46)
    return l_withSelectionCursorProvider_0(function(v47)
        return l_withStyle_0(function(v48)
            return v46:renderWithProviders(v47, v48);
        end);
    end);
end;
v24.didUpdate = function(v49, v50)
    if not ((not v49.state.dragAfterShortPress or v49.props.isTileSelected) or not v50.isTileSelected) then
        v49:setState({
            dragAfterShortPress = false
        });
    end;
end;
v24.willUnmount = function(v51)
    v51:disconnectConn();
end;
return v3.forwardRef(function(v52, v53)
    return v3.createElement(v24, v6.Dictionary.join(v52, {
        wrapperRef = v53
    }));
end);
