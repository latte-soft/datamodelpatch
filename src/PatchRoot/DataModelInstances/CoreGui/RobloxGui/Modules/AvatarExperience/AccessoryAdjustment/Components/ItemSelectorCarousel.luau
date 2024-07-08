local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Otter);
local v8 = require(l_CorePackages_0.UIBlox);
local l_ExternalEventConnection_0 = v8.Utility.ExternalEventConnection;
local l_GridMetrics_0 = v8.App.Grid.GridMetrics;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v13 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.AccessoryAdjustmentUtils);
local v14 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Components.ItemSelectorTile);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v16 = l_GridMetrics_0.makeCustomMetricsGetter(v12.ItemsGridMetrics);
local v17 = {
    dampingRatio = 2, 
    frequency = 5
};
local v18 = v4.PureComponent:extend("ItemSelectorCarousel");
v18.validateProps = v6.strictInterface({
    itemSelectorCarouselRef = v6.table, 
    equippedAccessories = v6.table
});
v18.init = function(v19)
    v19.scrollingFrameRef = v4.createRef();
    v19.ref = v4.createRef();
    v19.refCache = {};
    v19:setState({
        containerWidth = 0
    });
    v19.setContainerWidth = function(v20)
        if not (not v20 or not v20:IsDescendantOf(game)) then
            v19:setState({
                containerWidth = v20.AbsoluteSize.X
            });
        end;
    end;
    v19.inputBeganCallback = function(v21)
        if v19.isMounted then
            if v21.UserInputType ~= Enum.UserInputType.MouseMovement and v21.UserInputType ~= Enum.UserInputType.Touch then
                return ;
            else
                v19:disconnectInertialMoveConn();
                v19.isTouched = true;
                return ;
            end;
        else
            return ;
        end;
    end;
    v19.inputEndedCallback = function(_)
        if v19.isMounted then
            if v19.isTouched then
                v19.isTouched = false;
                v19:handleInertialMove();
            end;
            return ;
        else
            return ;
        end;
    end;
end;
v18.didUpdate = function(v23, _, v25)
    if v23.state.containerWidth > 0 and v25.containerWidth == 0 then
        v23:initCanvasPosition();
    end;
end;
v18.createOrResetMotor = function(v26, v27)
    if v26.motor then
        v26.motor:destroy();
    end;
    local v28 = v7.createSingleMotor(v27);
    v26.motor = v28;
    v26.motor:onStep(function(v29)
        if v26.motor ~= v28 then
            v28:destroy();
            return ;
        elseif not v26.isTouched then
            v26.scrollingFrameRef.current.CanvasPosition = Vector2.new(v29, 0);
            return ;
        else
            v26.motor:destroy();
            v26.motor = nil;
            return ;
        end;
    end);
    v26.motor:start();
end;
v18.initCanvasPosition = function(v30)
    local v31 = v30.scrollingFrameRef:getValue();
    if not v30.isTouched and v31 then
        v30:createOrResetMotor(v31.CanvasPosition.X);
        v30:setScrollPosition(v30.props.equippedAccessories[1], true);
        return ;
    else
        return ;
    end;
end;
v18.handleInertialMove = function(v32)
    local v33 = nil;
    local v34 = v32.scrollingFrameRef:getValue();
    if not v32.isTouched and v34 then
        v33 = -v34:GetSampledInertialVelocity().X;
        v34:ClearInertialScrolling();
        local v35 = v32:getClosestTileToCenter();
        if math.abs(v33) < 10 then
            v32:createOrResetMotor(v34.CanvasPosition.X);
            v32:setScrollPosition(v35, false);
            return ;
        else
            v32:disconnectInertialMoveConn();
            v32.handleInertialMoveConn = l_RunService_0.RenderStepped:Connect(function(v36)
                local v37 = v32.scrollingFrameRef:getValue();
                if v37 then
                    local v38, v39 = v32:getClosestTileToCenter();
                    if math.abs(v33) < 10 then
                        v32:disconnectInertialMoveConn();
                        v32:createOrResetMotor(v37.CanvasPosition.X);
                        v32:setScrollPosition(v38, false);
                        return ;
                    else
                        v37.CanvasPosition = v37.CanvasPosition + Vector2.new(v33 * v36, 0);
                        v33 = v33 * (0.9 / math.max(1, 10 - v39));
                        return ;
                    end;
                else
                    v32:disconnectInertialMoveConn();
                    return ;
                end;
            end);
            return ;
        end;
    else
        return ;
    end;
end;
v18.getClosestTileToCenter = function(v40)
    local v41 = v40.scrollingFrameRef:getValue();
    if v41 then
        local v42 = v41.AbsolutePosition.X + v41.AbsoluteSize.X / 2;
        local l_huge_0 = math.huge;
        local v44 = nil;
        for v45, v46 in v40.refCache, nil, nil do
            local v47 = v46:getValue();
            if v47 then
                local v48 = math.abs(v42 - (v47.AbsolutePosition.X + v47.AbsoluteSize.X / 2));
                if v48 < l_huge_0 then
                    l_huge_0 = v48;
                    v44 = v45;
                end;
            end;
        end;
        return v44, l_huge_0;
    else
        return ;
    end;
end;
v18.setScrollPosition = function(v49, v50, v51)
    local l_current_0 = v49.scrollingFrameRef.current;
    if (l_current_0 and l_current_0.AbsoluteSize.X ~= 0) and v50 then
        local v53 = v49.refCache[v50]:getValue();
        if v53 then
            if v49.motor then
                local v54 = (l_current_0.CanvasPosition.X + (v53.AbsolutePosition.X + v53.AbsoluteSize.X / 2)) - (l_current_0.AbsolutePosition.X + l_current_0.AbsoluteSize.X / 2);
                if not v51 then
                    v49.motor:setGoal(v7.spring(v54, v17));
                    return ;
                else
                    v49.motor:setGoal(v7.instant(v54));
                    return ;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    else
        return ;
    end;
end;
v18.didMount = function(v55)
    v55.isMounted = true;
    v55.setContainerWidth(v55.ref:getValue());
    v55:createOrResetMotor(0);
end;
v18.gatherChildren = function(v56)
    local l_itemWidth_0 = v16(v56.state.containerWidth or 0, 10).itemWidth;
    local v58 = {};
    for v59, v60 in v56.props.equippedAccessories, nil, nil do
        if not v56.refCache[v60] then
            v56.refCache[v60] = v4.createRef();
        end;
        table.insert(v58, v4.createElement(v14, {
            assetId = v60, 
            tileSize = l_itemWidth_0, 
            tileRef = v56.refCache[v60], 
            LayoutOrder = v59 + 1
        }));
    end;
    local v61 = nil;
    v61 = if v56.state.containerWidth > 0 then v56.state.containerWidth / 2 else l_itemWidth_0;
    table.insert(v58, 1, v4.createElement("Frame", {
        Size = UDim2.new(0, v61, 0, v61), 
        BackgroundTransparency = 1, 
        LayoutOrder = 1
    }));
    table.insert(v58, v4.createElement("Frame", {
        Size = UDim2.new(0, v61, 0, v61), 
        BackgroundTransparency = 1, 
        LayoutOrder = #v58 + 1
    }));
    table.insert(v58, v4.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Bottom, 
        Padding = UDim.new(0, 12)
    }));
    return v58;
end;
v18.render = function(v62)
    return v4.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        [v4.Ref] = v62.ref, 
        [v4.Change.AbsoluteSize] = v62.setContainerWidth, 
        [v4.Event.AncestryChanged] = v62.setContainerWidth
    }, {
        UIPadding = v4.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v12.ItemsGridSidePadding / 2), 
            PaddingRight = UDim.new(0, v12.ItemsGridSidePadding / 2), 
            PaddingBottom = UDim.new(0, v12.ItemsGridBottomPadding)
        }), 
        InputBegan = v4.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.InputBegan, 
            callback = v62.inputBeganCallback
        }), 
        InputEnded = v4.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.InputEnded, 
            callback = v62.inputEndedCallback
        }), 
        ScrollingFrame = v4.createElement("ScrollingFrame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            AutomaticCanvasSize = Enum.AutomaticSize.XY, 
            ScrollingDirection = Enum.ScrollingDirection.X, 
            ScrollBarThickness = 0, 
            ElasticBehavior = Enum.ElasticBehavior.Always, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            [v4.Ref] = v62.scrollingFrameRef
        }, (v62:gatherChildren()))
    });
end;
v18.willUnmount = function(v63)
    v63.isMounted = false;
    v63:disconnectInertialMoveConn();
    if v63.motor then
        v63.motor:destroy();
        v63.motor = nil;
    end;
end;
v18.disconnectInertialMoveConn = function(v64)
    if v64.handleInertialMoveConn then
        v64.handleInertialMoveConn:Disconnect();
        v64.handleInertialMoveConn = nil;
    end;
end;
return (v5.connect(function(v65, _)
    return {
        equippedAccessories = v13.getEquippedAccessories(v65)
    };
end, nil)(v18));
