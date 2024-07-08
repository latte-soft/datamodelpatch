local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local v5 = require(l_CorePackages_0.Roact);
local v6 = require(l_CorePackages_0.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_CorePackages_0.Cryo);
local v9 = require(l_CorePackages_0.Packages.RoactGamepad);
local v10 = require(l_CorePackages_0.RoactNavigation);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v12 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v12.Style.withStyle;
local l_withTooltip_0 = v12.App.Dialog.TooltipV2.withTooltip;
local l_TooltipOrientation_0 = v12.App.Dialog.Enum.TooltipOrientation;
local l_withNavigation_0 = v10.withNavigation;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v18 = require(l_Modules_0.LuaApp.mutedError);
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v20 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Selectors.selectEquippedLCAccessoriesOrdered);
local v21 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Components.DismissMenuBackground);
local v22 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Constants);
local v23 = require(l_Modules_0.LuaApp.Constants);
local v24 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.LayeredClothingSortUtils);
local l_GamepadUtils_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Utils.GamepadUtils;
local v26 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetOrder);
local v27 = require(l_Modules_0.AvatarExperience.Common.Actions.SetOrderForTryOns);
local v28 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetCurrentSort);
local v29 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Components.VerticalClothingListTile);
local v30 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v31 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v33 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Services.Analytics);
local v34 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Thunks.SendRefinementAnalytics);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v36 = UDim.new(0, 10);
local v37 = v5.PureComponent:extend("VerticalClothingList");
v37.validateProps = v7.strictInterface({
    lastInputIsGamepad = v7.boolean, 
    topBarRef = v7.optional(v7.table), 
    focusControllerProp = v7.table, 
    onDragChange = v7.optional(v7.callback), 
    currentSort = v7.optional(v7.table), 
    equippedAssets = v7.table, 
    equippedLCAssetIdsOrdered = v7.table, 
    tryOnItems = v7.table, 
    setOrder = v7.callback, 
    setOrderForTryOns = v7.callback, 
    setCurrentSort = v7.callback, 
    sendAnalytics = v7.callback, 
    avatarRoute = v7.table, 
    navigation = v7.table, 
    forwardRef = v7.optional(v7.table), 
    analytics = v7.table, 
    NextSelectionLeft = v7.optional(v7.table), 
    NextSelectionRight = v7.optional(v7.table), 
    NextSelectionDown = v7.optional(v7.table), 
    NextSelectionUp = v7.optional(v7.table)
});
v37.defaultProps = {
    lastInputIsGamepad = false
};
v37.isVisible = function(v38)
    return v38.props.avatarRoute.opaque.name == v19.LayeredClothingSort;
end;
v37.init = function(v39)
    v39.listRef = v39.props.forwardRef or v5.createRef();
    v39.scrollingFrameRef = v5.createRef();
    v39.toolTipFrameRef = v5.createRef();
    v39.rootRefCache = v9.createRefCache();
    v39.tileRefCache = v9.createRefCache();
    v39.dragStartPosition = nil;
    v39.frameStartPositionYOffset = nil;
    v39.canvasStartHeight = nil;
    v39.dragging = false;
    v39.stickNeedsToReset = false;
    v39.moveConnection = nil;
    v39.focusLostConnection = nil;
    v39.releaseConnection = nil;
    v39.clickAndHoldConn = nil;
    v39.scrollConnection = nil;
    local v40, v41 = v5.createBinding(Vector2.new(0, 0));
    v39.canvasPosition = v40;
    v39.updateCanvasPosition = v41;
    v40, v41 = v5.createBinding(UDim2.fromOffset(v22.Tile.Padding, 0));
    v39.draggedTilePos = v40;
    v39.updateDraggedTilePos = v41;
    v40, v41 = v5.createBinding(false);
    v39.contextualOptionsVisible = v40;
    v39.updateContextualOptionsVisible = v41;
    v39:setState({
        draggingTileOrdering = v39.props.equippedLCAssetIdsOrdered, 
        orderingOnSelectWithGamepad = v39.props.equippedLCAssetIdsOrdered, 
        triggerSize = Vector2.new(0, 0), 
        showToolTip = if not l_IsVRAppBuild_0() then l_AppStorageService_0:GetItem("ShowTooltipLCSortPage") == "true" else false
    });
    v39.onToolTipSizeChange = function(v42)
        v39:setState({
            triggerSize = v42.AbsoluteSize
        });
    end;
    v39.onTooltipDismiss = function()
        v39:setState({
            showToolTip = false
        });
        l_AppStorageService_0:SetItem("ShowTooltipLCSortPage", "false");
        l_AppStorageService_0:flush();
    end;
    v39.isExceedingBottomThresh = function(v43)
        local v44 = v39.tileRefCache[v43]:getValue();
        local v45 = v39.scrollingFrameRef:getValue();
        if v44 and v45 then
            return (not not v45 and v45.AbsolutePosition.Y + v45.AbsoluteWindowSize.Y or 0) < v44.AbsolutePosition.Y + v22.Tile.Size;
        else
            return false;
        end;
    end;
    v39.isExceedingTopThresh = function(v46)
        local v47 = v39.tileRefCache[v46]:getValue();
        local v48 = v39.scrollingFrameRef:getValue();
        if v47 and v48 then
            return v47.AbsolutePosition.Y < v48.AbsolutePosition.Y;
        else
            return false;
        end;
    end;
    v39.onFocusGained = function(v49)
        local v50 = v39.tileRefCache[v49]:getValue();
        local v51 = v39.scrollingFrameRef:getValue();
        if not v39.isExceedingTopThresh(v49) then
            if v39.isExceedingBottomThresh(v49) then
                v39.updateCanvasPosition(Vector2.new(0, v51.CanvasPosition.Y + (((v50.AbsolutePosition.Y + v22.Tile.Size) - (not v51 and 0 or v51.AbsolutePosition.Y + v51.AbsoluteWindowSize.Y)) + v22.Tile.Padding)));
            end;
            return ;
        else
            v39.updateCanvasPosition(Vector2.new(0, v51.CanvasPosition.Y - ((v51.AbsolutePosition.Y - v50.AbsolutePosition.Y) + v22.Tile.Padding)));
            return ;
        end;
    end;
    v39.resetSelectedTile = function()
        v39:setState({
            selectedAssetId = v5.None
        });
    end;
    v39.selectTile = function(v52)
        v39.updateDraggedTilePos(UDim2.fromOffset(v22.Tile.Padding + v22.Tile.Size / 2, v39:getTileOffsetsTable(v39.state.draggingTileOrdering)[v52.id] + v22.Tile.Size / 2));
        v39:setState({
            selectedAssetId = v52.id
        });
        if v39.state.showToolTip then
            v39.onTooltipDismiss();
        end;
    end;
    v39.initializeDrag = function(v53, v54, v55, v56, v57)
        v39.frameStartPositionYOffset = v53.Position.Y.Offset - (v57 or 0);
        v39.dragStartPosition = v54.Position;
        v39.canvasStartHeight = v39.scrollingFrameRef:getValue().CanvasPosition.Y;
        v39.inputObject = v54;
        v39:startListeningForDrag(v55, v56);
    end;
    v39.onDismiss = function()
        v39.updateContextualOptionsVisible(false);
        v39.resetSelectedTile();
    end;
    v39.onOverlayClosed = function(_)
        return function()
            if v39.props.lastInputIsGamepad and v39.props.avatarRoute.opaque.name == v19.LayeredClothingSort then
                v31("LayeredClothingSort");
                v39.props.focusControllerProp.captureFocus();
            end;
        end;
    end;
end;
v37.getTileOrderingAfterMove = function(_, v60, v61, v62, v63, v64)
    local v65 = {};
    for v66, v67 in v64, nil, nil do
        if v66 ~= v60 then
            table.insert(v65, v67);
        end;
    end;
    table.insert(v65, math.max(1, (math.min(v60 + v61 * v62, #v64))), v63);
    return v65;
end;
v37.updateDraggingTileOrdering = function(v68, v69)
    if not (not v69 or not v68:shouldUpdateOrder(v69)) then
        v68:setState({
            draggingTileOrdering = v69
        });
    end;
end;
v37.moveTileDownOneGamepad = function(v70, v71, v72)
    v70:updateDraggingTileOrdering((v70:getTileOrderingAfterMove(v71, 1, 1, v72, v70.state.draggingTileOrdering)));
    local v73 = v70.tileRefCache[v72.id]:getValue();
    local v74 = v70.scrollingFrameRef:getValue();
    local v75 = not not v74 and v74.AbsolutePosition.Y + v74.AbsoluteWindowSize.Y or 0;
    local v76 = ((v73.AbsolutePosition.Y + v22.Tile.SelectedSize) + v22.Tile.Size) + v22.Tile.Padding;
    if not (not v73 or not v74) and v75 < v76 then
        v70.updateCanvasPosition(Vector2.new(0, v74.CanvasPosition.Y + ((v76 - v75) + v22.Tile.Padding)));
    end;
end;
v37.moveTileUpOneGamepad = function(v77, v78, v79)
    v77:updateDraggingTileOrdering((v77:getTileOrderingAfterMove(v78, 1, -1, v79, v77.state.draggingTileOrdering)));
    local v80 = v77.tileRefCache[v79.id]:getValue();
    local v81 = v77.scrollingFrameRef:getValue();
    local l_Y_0 = v81.AbsolutePosition.Y;
    local v83 = (v80.AbsolutePosition.Y - v22.Tile.Size) - v22.Tile.Padding;
    if not (not v80 or not v81) and v83 < l_Y_0 then
        v77.updateCanvasPosition(Vector2.new(0, v81.CanvasPosition.Y + ((v83 - l_Y_0) - v22.Tile.Padding)));
    end;
end;
v37.handleThumbstickInput = function(v84, v85, v86, v87)
    local v88 = l_GamepadUtils_0.normalizeStickByDeadzone(v85.Position, 0.6);
    if not (v88.Y > 0) or v84.stickNeedsToReset then
        if not (v88.Y < 0) or v84.stickNeedsToReset then
            if not (not (v88.Y == 0) or not v84.stickNeedsToReset) then
                v84.stickNeedsToReset = false;
            end;
            return ;
        else
            v84:moveTileDownOneGamepad(v86, v87);
            v84.stickNeedsToReset = true;
            return ;
        end;
    else
        v84:moveTileUpOneGamepad(v86, v87);
        v84.stickNeedsToReset = true;
        return ;
    end;
end;
v37.getTileOffsetsTable = function(_, v90)
    local v91 = {};
    for v92, v93 in v90, nil, nil do
        v91[v93.id] = (v92 - 1) * (v22.Tile.Size + v22.Tile.Padding);
    end;
    return v91;
end;
v37.shouldUpdateOrder = function(v94, v95)
    if #v95 ~= #v94.state.draggingTileOrdering then
        return true;
    else
        for v96 = 1, #v95 do
            if v95[v96].id ~= v94.state.draggingTileOrdering[v96].id then
                return true;
            end;
        end;
        return false;
    end;
end;
v37.normalizeDraggedPosition = function(v97, v98)
    local v99 = #v97.state.draggingTileOrdering;
    local v100 = v99 * (v22.Tile.Size + v22.Tile.Padding);
    local v101 = v100 - v22.Tile.Size;
    if v101 < -13 then
        v18(string.format("VerticalClothingList invalid argument #3 to 'clamp' (max must be greater than or equal to min)\n" .. "  numTiles: %s, canvasHeight(maxDragHeight): %s, AbsoluteCanvasSize: %s, maximumDragHeight: %s", tostring(v99), tostring(v100), tostring(v97.scrollingFrameRef:getValue().AbsoluteCanvasSize.Y), (tostring(v101))));
        return v98;
    else
        return (math.clamp(v98, -13, v101));
    end;
end;
v37.createScrollConnection = function(v102, v103)
    if v102.scrollingFrameRef:getValue() then
        v102.scrollConnection = l_RunService_0.RenderStepped:connect(function(v104)
            local v105 = v102.scrollingFrameRef:getValue();
            if v105 then
                local l_Y_1 = v105.CanvasPosition.Y;
                if not (not (l_Y_1 < v105.AbsoluteCanvasSize.Y - v105.AbsoluteWindowSize.Y) or v103 ~= 1) or l_Y_1 > 0 and v103 == -1 then
                    v102.updateDraggedTilePos(UDim2.fromOffset(v22.Tile.Padding + v22.Tile.Size / 2, v102:normalizeDraggedPosition(v102.draggedTilePos:getValue().Y.Offset + math.ceil(50 * v104) * v103)));
                    v102.updateCanvasPosition(Vector2.new(0, l_Y_1 + math.ceil(50 * v104) * v103));
                end;
                return ;
            else
                v102.scrollConnection:Disconnect();
                v102.scrollConnection = nil;
                return ;
            end;
        end);
        return ;
    else
        return ;
    end;
end;
v37.processDrag = function(v107, v108, v109, v110)
    local v111 = v107.scrollingFrameRef:getValue();
    if v111 then
        local v112 = (v108.y - v107.dragStartPosition.Y) + (v111.CanvasPosition.Y - v107.canvasStartHeight);
        local v113 = v107.frameStartPositionYOffset + v112;
        local l_id_0 = v109.id;
        local l_equippedLCAssetIdsOrdered_0 = v107.props.equippedLCAssetIdsOrdered;
        local v116 = v22.Tile.Size / 2 + v22.Tile.Padding;
        local v117 = 1 + math.floor((math.abs(v112) - v116) / (v22.Tile.Size + v22.Tile.Padding));
        local v118 = v116 < v112 and 1 or -1;
        if v116 < math.abs(v112) then
            l_equippedLCAssetIdsOrdered_0 = v107:getTileOrderingAfterMove(v110, v117, v118, v109, v107.props.equippedLCAssetIdsOrdered);
        end;
        v107:updateDraggingTileOrdering(l_equippedLCAssetIdsOrdered_0);
        v107.updateDraggedTilePos(UDim2.fromOffset(v22.Tile.Padding + v22.Tile.Size / 2, v107:normalizeDraggedPosition(v113) + v22.Tile.Size / 2));
        if not v107.isExceedingTopThresh(l_id_0) and not v107.isExceedingBottomThresh(l_id_0) then
            if v107.scrollConnection ~= nil then
                v107.scrollConnection:Disconnect();
                v107.scrollConnection = nil;
            end;
        elseif not v107.scrollConnection then
            v107:createScrollConnection(not v107.isExceedingBottomThresh(l_id_0) and -1 or 1);
            return ;
        end;
        return ;
    else
        return ;
    end;
end;
v37.removeConnections = function(v119)
    if v119.moveConnection ~= nil then
        v119.moveConnection:Disconnect();
        v119.moveConnection = nil;
    end;
    if v119.releaseConnection ~= nil then
        v119.releaseConnection:Disconnect();
        v119.releaseConnection = nil;
    end;
    if v119.focusLostConnection ~= nil then
        v119.focusLostConnection:Disconnect();
        v119.focusLostConnection = nil;
    end;
    if v119.scrollConnection ~= nil then
        v119.scrollConnection:Disconnect();
        v119.scrollConnection = nil;
    end;
end;
v37.confirmAndSetOrder = function(v120)
    local v121, v122 = v24.formatForSetOrderWithTryOns(v120.state.draggingTileOrdering, v120.props.equippedAssets, v120.props.tryOnItems);
    v120.props.setOrder(v121);
    v120.props.setOrderForTryOns(v122);
    v120.props.setCurrentSort(v120.state.draggingTileOrdering);
    v120.props.sendAnalytics(v120.props.analytics.avatarRefineAutosaved);
end;
v37.stopListeningForDrag = function(v123, _)
    v123.dragging = false;
    if v123.props.onDragChange then
        v123.props.onDragChange(false);
    end;
    v123.inputObject = nil;
    v123:removeConnections();
    v123.resetSelectedTile();
    v123:confirmAndSetOrder();
end;
v37.startListeningForDrag = function(v125, v126, v127)
    if v125.rootRefCache[v126.id]:getValue() == nil then
        return ;
    elseif not v125.dragging then
        if v125.props.onDragChange then
            v125.props.onDragChange(true);
        end;
        v125.dragging = true;
        v125.updateContextualOptionsVisible(false);
        v125.moveConnection = l_UserInputService_0.InputChanged:Connect(function(v128)
            if v125.dragging then
                local l_UserInputType_0 = v128.UserInputType;
                if l_UserInputType_0 ~= Enum.UserInputType.MouseMovement and l_UserInputType_0 ~= Enum.UserInputType.Touch then
                    return ;
                elseif v128.UserInputState ~= Enum.UserInputState.Change then
                    return ;
                elseif v128 ~= v125.inputObject and l_UserInputType_0 == Enum.UserInputType.Touch then
                    return ;
                else
                    v125:processDrag(v128.Position, v126, v127);
                    return ;
                end;
            else
                return ;
            end;
        end);
        v125.releaseConnection = l_UserInputService_0.InputEnded:Connect(function(v130)
            local l_UserInputType_1 = v130.UserInputType;
            if l_UserInputType_1 ~= Enum.UserInputType.MouseButton1 and l_UserInputType_1 ~= Enum.UserInputType.Touch then
                return ;
            elseif v130 ~= v125.inputObject and l_UserInputType_1 == Enum.UserInputType.Touch then
                return ;
            else
                v125:stopListeningForDrag(v126);
                return ;
            end;
        end);
        v125.focusLostConnection = l_UserInputService_0.WindowFocusReleased:Connect(function()
            v125:stopListeningForDrag(v126);
        end);
        v125.selectTile(v126);
        return ;
    else
        return ;
    end;
end;
v37.getInputBindings = function(v132, v133, v134, v135)
    return {
        ToggleSelect = v9.Input.onBegin(Enum.KeyCode.ButtonA, function()
            if v132.state.selectedAssetId == nil then
                v132.selectTile(v133);
                v132:setState({
                    orderingOnSelectWithGamepad = v132.props.equippedLCAssetIdsOrdered
                });
                return ;
            else
                v132.resetSelectedTile();
                v132:confirmAndSetOrder();
                return ;
            end;
        end, {
            key = v132.state.selectedAssetId == nil and "Feature.Avatar.Action.Select" or "CommonUI.Controls.Action.Confirm"
        }), 
        SelectedTile = v132.state.selectedAssetId == v133.id and v9.Input.onStep(Enum.KeyCode.Thumbstick1, function(v136, _)
            v132:handleThumbstickInput(v136, v134, v133);
        end, {
            axes = {
                vertical = {
                    key = "Feature.Avatar.Title.Move"
                }
            }
        }) or nil, 
        MoveSelectedTileUp = v132.state.selectedAssetId == v133.id and v9.Input.onBegin(Enum.KeyCode.DPadUp, function()
            v132:moveTileUpOneGamepad(v134, v133);
        end) or nil, 
        MoveSelectedTileDown = v132.state.selectedAssetId == v133.id and v9.Input.onBegin(Enum.KeyCode.DPadDown, function()
            v132:moveTileDownOneGamepad(v134, v133);
        end) or nil, 
        UnselectAndReset = v132.state.selectedAssetId == v133.id and v9.Input.onBegin(Enum.KeyCode.ButtonB, function()
            v132.resetSelectedTile();
            v132:setState({
                draggingTileOrdering = v132.state.orderingOnSelectWithGamepad
            });
        end, {
            key = "Feature.Catalog.Action.Cancel"
        }) or nil, 
        OpenUnequipPrompt = v132.state.selectedAssetId == v133.id and v9.Input.onBegin(Enum.KeyCode.ButtonY, function()
            v132.props.navigation.navigate(v19.RemoveItemPrompt, {
                onOverlayClosed = v132.onOverlayClosed(v135), 
                asset = v133, 
                onUnequip = v132.resetSelectedTile
            });
        end, {
            key = "Feature.Catalog.Action.Remove"
        }) or nil
    };
end;
v37.render = function(v138)
    return l_withStyle_0(function(v139)
        return l_withLocalization_0({
            tooltipText = "Feature.Avatar.Message.LCSortListTooltip"
        })(function(v140)
            return v138:renderWithProviders(v139, v140);
        end);
    end);
end;
v37.renderWithProviders = function(v141, v142, v143, v144)
    local l_Theme_0 = v142.Theme;
    local v146 = {};
    local v147 = v141:getTileOffsetsTable(v141.state.draggingTileOrdering);
    for v148, v149 in v141.state.draggingTileOrdering, nil, nil do
        v146[v149.id] = v5.createElement(v9.Focusable[v29], {
            asset = v149, 
            selectedAssetId = v141.state.selectedAssetId, 
            positionYOffset = v147[v149.id], 
            dragging = v141.dragging, 
            positionBinding = v141.draggedTilePos, 
            isTileSelected = v141.state.selectedAssetId == v149.id, 
            tileIndex = v148, 
            contextualOptionsVisible = v141.contextualOptionsVisible, 
            updateContextualOptionsVisible = v141.updateContextualOptionsVisible, 
            resetSelectedTile = v141.resetSelectedTile, 
            initializeDrag = v141.initializeDrag, 
            onEndClick = v141.selectTile, 
            tileRef = v141.tileRefCache[v149.id], 
            lastInputIsGamepad = v141.props.lastInputIsGamepad, 
            onFocusGained = function()
                v141.onFocusGained(v149.id);
            end, 
            [v5.Ref] = v141.rootRefCache[v149.id], 
            NextSelectionDown = if v141.state.selectedAssetId == nil and v148 ~= #v141.state.draggingTileOrdering then v141.rootRefCache[v141.state.draggingTileOrdering[v148 + 1].id] else nil, 
            NextSelectionUp = if v141.state.selectedAssetId == nil and v148 ~= 1 then v141.rootRefCache[v141.state.draggingTileOrdering[v148 - 1].id] else nil, 
            NextSelectionLeft = v141.props.NextSelectionLeft or v141.rootRefCache[v149.id], 
            NextSelectionRight = v141.rootRefCache[v149.id], 
            inputBindings = v141:getInputBindings(v149, v148, v144)
        });
    end;
    local v150 = if #v141.state.draggingTileOrdering ~= 0 then v141.rootRefCache[v141.state.draggingTileOrdering[1].id] else nil;
    local v151 = #v141.state.draggingTileOrdering;
    local v152 = v151 * (v22.Tile.Size + v22.Tile.Padding);
    local v153 = #v141.props.equippedLCAssetIdsOrdered > 0;
    return v5.createFragment({
        VerticalClothingList = v5.createElement(not not v153 and v9.Focusable.Frame or "Frame", {
            AnchorPoint = if not l_IsVRAppBuild_0() then Vector2.new(1, 0.5) else Vector2.new(1, 0), 
            Position = if not l_IsVRAppBuild_0() then UDim2.new(1, -v22.RightMargin, 0.5, -v23.NAV_BAR_SIZE / 2) else UDim2.new(1, 0, 0, v22.Tile.MoreIconSize + 13), 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, v22.VerticalList.Width + v22.Tile.ContextWidth, v22.VerticalList.HeightScale, 0), 
            ClipsDescendants = true, 
            Visible = v151 > 0, 
            ZIndex = 3, 
            [v5.Ref] = v141.listRef, 
            defaultChild = if not v153 then nil else v150, 
            restorePreviousChildFocus = not not v153 or nil
        }, {
            RoundedFrame = l_withTooltip_0({
                bodyText = v143.tooltipText, 
                useLargeDropShadow = true
            }, {
                preferredOrientation = l_TooltipOrientation_0.Left, 
                guiTarget = l_CoreGui_0, 
                triggerPointName = "RoundedFrame", 
                active = v141.state.showToolTip and v141:isVisible()
            }, function(v154)
                local l_createElement_0 = v5.createElement;
                local v156 = "Frame";
                local v157 = {
                    AnchorPoint = if not l_IsVRAppBuild_0() then Vector2.new(1, 0.5) else Vector2.new(1, 0), 
                    Position = if not l_IsVRAppBuild_0() then UDim2.fromScale(1, 0.5) else UDim2.fromScale(1, 0), 
                    Size = UDim2.new(0, v22.VerticalList.Width, 1, 0), 
                    BackgroundTransparency = v141.state.selectedAssetId == nil and 0.2 or 0.5, 
                    BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                    ZIndex = 1, 
                    [v5.Change.AbsoluteSize] = v154, 
                    [v5.Change.AbsolutePosition] = v154
                };
                local v158 = {
                    UISizeConstraint = v5.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(v22.VerticalList.Width, v152 + 13)
                    }), 
                    UICorner = v5.createElement("UICorner", {
                        CornerRadius = v36
                    })
                };
                local l_createElement_1 = v5.createElement;
                local v160 = "ScrollingFrame";
                local v161 = {
                    Size = UDim2.new(1, 0, 1, 0), 
                    CanvasPosition = v141.canvasPosition, 
                    CanvasSize = UDim2.new(1, 0, 0, v152 + 13), 
                    BackgroundTransparency = 1, 
                    ScrollBarThickness = 0, 
                    ScrollingDirection = Enum.ScrollingDirection.Y
                };
                local v162 = false;
                if v141.state.selectedAssetId == nil then
                    v162 = not v141.props.lastInputIsGamepad;
                end;
                v161.ScrollingEnabled = v162;
                v161[v5.Ref] = v141.scrollingFrameRef;
                v161.ClipsDescendants = false;
                v158.ScrollingFrame = l_createElement_1(v160, v161, {
                    UIPadding = v5.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, 13), 
                        PaddingTop = UDim.new(0, 13)
                    }), 
                    LCTiles = v5.createFragment(v146), 
                    DismissMenuBackgroundScrollingFrame = v5.createElement(v21, {
                        Visible = v141.contextualOptionsVisible, 
                        ZIndex = v141.state.selectedAssetId == nil and 1 or 5, 
                        onDismiss = v141.onDismiss
                    })
                });
                return l_createElement_0(v156, v157, v158);
            end)
        }), 
        DismissMenuBackgroundPage = v5.createElement(v21, {
            Visible = v141.contextualOptionsVisible, 
            ZIndex = 2, 
            onDismiss = v141.onDismiss
        })
    });
end;
v37.didUpdate = function(v163, v164, v165)
    if not (not (v163.props.currentSort ~= v164.currentSort) or not v163:shouldUpdateOrder(v163.props.currentSort)) then
        v163:setState({
            draggingTileOrdering = v163.props.currentSort
        });
    end;
    if v163.state.selectedAssetId ~= v165.selectedAssetId then
        if not v163.state.selectedAssetId then
            v163.onFocusGained(v165.selectedAssetId);
        else
            v163.onFocusGained(v163.state.selectedAssetId);
            if not (not v163.props.lastInputIsGamepad or v165.selectedAssetId) then
                v163.props.focusControllerProp.moveFocusTo(v163.rootRefCache[v163.state.selectedAssetId]);
                return ;
            end;
        end;
    end;
end;
v37.willUnmount = function(v166)
    v166:removeConnections();
end;
v37 = l_RoactServices_0.connect({
    analytics = v33
})((v30((l_withNavigation_0(v6.connect(function(v167, _)
    return {
        equippedAssets = v167.AvatarExperience.AvatarEditor.Character.EquippedAssets, 
        equippedLCAssetIdsOrdered = v20(v167), 
        currentSort = v167.AvatarExperience.LayeredClothingSort.CurrentSort.OrderedList, 
        tryOnItems = v167.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
    };
end, function(v169)
    return {
        setOrder = function(v170)
            v169(v26(v170));
        end, 
        setOrderForTryOns = function(v171)
            v169(v27(v171));
        end, 
        setCurrentSort = function(v172)
            v169(v28(v172));
        end, 
        sendAnalytics = function(v173)
            v169(v34(v173));
        end
    };
end)(v37), nil)))));
return v5.forwardRef(function(v174, v175)
    return v5.createElement(v37, v8.Dictionary.join(v174, {
        forwardRef = v175
    }));
end);
