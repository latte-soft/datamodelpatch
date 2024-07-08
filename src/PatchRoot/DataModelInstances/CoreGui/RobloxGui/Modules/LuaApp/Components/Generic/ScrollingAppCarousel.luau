local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.UIBlox);
local v4 = require(l_CorePackages_0.Otter);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(script.Parent.AppCarousel);
local v8 = require(script.Parent.ScrollButton);
local l_Images_0 = v3.App.ImageSet.Images;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v11 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppCarouselInitialSize);
local v12 = require(l_Modules_0.LuaApp.Flags.FFlagLuaAppRemoveExtraCarouselPadding);
local v13 = l_Images_0["icons/actions/cycleLeft"];
local v14 = l_Images_0["icons/actions/cycleRight"];
local v15 = {
    frequency = 2, 
    dampingRatio = 0.9, 
    restingPositionLimit = 0.5, 
    restingVelocityLimit = 0.1
};
local v16 = v2.PureComponent:extend("ScrollingAppCarousel");
local v17 = game:DefineFastFlag("LuaAppScrollingAppCarouselMarginUpdate", false);
v16.defaultProps = {
    carouselMargin = 0
};
v16.validateProps = v6.strictInterface({
    items = v6.table, 
    index = v6.numberMin(1), 
    itemCount = v6.number, 
    itemWidth = v6.numberMin(1), 
    itemPadding = v6.number, 
    carouselMargin = v6.number, 
    carouselHeight = v6.number, 
    canvasWidth = v6.number, 
    onChangeCanvasPosition = v6.callback, 
    onRefCallback = v6.optional(v6.callback)
});
v16.getScrollState = function(v18, v19, v20)
    local v21 = v18 + v19;
    local v22 = math.floor((v20 + v19) / v21);
    local v23 = nil;
    if not v12 then
        v23 = v20 - v22 * v21;
    end;
    return {
        canvasOffset = v23, 
        maxNumOfItemsVisible = v22
    };
end;
v16.handleMouseEvent = function(v24, v25, v26)
    if v25.UserInputType == Enum.UserInputType.MouseMovement then
        v24:setState({
            hoveringCarousel = v26
        });
    end;
end;
v16.handleScroll = function(v27, v28)
    if not v27.state.animationActive then
        local l_index_0 = v27.props.index;
        local l_maxNumOfItemsVisible_0 = v27.state.maxNumOfItemsVisible;
        v27:scrollToIndex(l_index_0, l_index_0 + (not not v28 and l_maxNumOfItemsVisible_0 or -l_maxNumOfItemsVisible_0));
        return ;
    else
        return ;
    end;
end;
v16.handleResize = function(v31, v32)
    if v31._isMounted then
        local v33 = v32.AbsoluteSize.X - 2 * v31.props.carouselMargin;
        v31:setState(v5.Dictionary.join({
            absoluteWidth = v32.AbsoluteSize.X, 
            carouselWidth = v33
        }, v31.getScrollState(v31.props.itemWidth, v31.props.itemPadding, v33)));
    end;
end;
v16.scrollToIndex = function(v34, v35, v36)
    local l_itemCount_0 = v34.props.itemCount;
    local v38 = v34.props.itemWidth + v34.props.itemPadding;
    v36 = math.max(math.min(v36, (l_itemCount_0 - v34.state.maxNumOfItemsVisible) + 1), 1);
    local v39 = (v35 - 1) * v38;
    local v40 = (v36 - 1) * v38;
    v34:destroyMotor();
    v34:createMotor(v39);
    if not l_UserGameSettings_0.ReducedMotion then
        v34.carouselMotor:setGoal(v4.spring(v40, v15));
        return ;
    else
        v34.carouselMotor:setGoal(v4.instant(v40));
        return ;
    end;
end;
v16.createMotor = function(v41, v42)
    v41.carouselMotor = v4.createSingleMotor(v42);
    v41.carouselMotor:onStep(function(v43)
        v41:setState({
            animationActive = true, 
            canvasPosition = Vector2.new(v43, 0)
        });
    end);
    v41.carouselMotor:onComplete(function()
        v41:destroyMotor();
        v41:setState({
            animationActive = false
        });
    end);
end;
v16.destroyMotor = function(v44)
    if v44.carouselMotor then
        v44.carouselMotor:destroy();
        v44.carouselMotor = nil;
    end;
end;
v16.init = function(v45)
    v45:setState({
        carouselWidth = 0, 
        hoveringCarousel = false, 
        animationActive = false, 
        canvasPosition = Vector2.new(0, 0), 
        canvasOffset = not v12 and 0 or nil, 
        maxNumOfItemsVisible = 0, 
        absoluteWidth = 0
    });
    v45.carouselMotor = nil;
    v45.onMouseEnter = function(_, v47)
        if v45._isMounted then
            v45:handleMouseEvent(v47, true);
        end;
    end;
    v45.onMouseLeave = function(_, v49)
        if v45._isMounted then
            v45:handleMouseEvent(v49, false);
        end;
    end;
    v45.frameRef = v2.createRef();
    v45.onResize = function(v50)
        if v45._isMounted then
            if not v11() then
                local v51 = v50.AbsoluteSize.X - 2 * v45.props.carouselMargin;
                v45:setState(v5.Dictionary.join({
                    absoluteWidth = v50.AbsoluteSize.X, 
                    carouselWidth = v51
                }, v45.getScrollState(v45.props.itemWidth, v45.props.itemPadding, v51)));
            else
                v45:handleResize(v50);
            end;
            if v45.props.onResize then
                v45.props.onResize(v50);
            end;
        end;
    end;
    v45.scrollLeft = function()
        if v45._isMounted then
            v45:handleScroll(false);
        end;
    end;
    v45.scrollRight = function()
        if v45._isMounted then
            v45:handleScroll(true);
        end;
    end;
end;
v16.getDerivedStateFromProps = function(v52, v53)
    if not v17 then
        return v16.getScrollState(v52.itemWidth, v52.itemPadding, v53.carouselWidth or 0);
    else
        local v54 = math.max(0, v53.absoluteWidth - 2 * v52.carouselMargin);
        return v5.Dictionary.join({
            carouselWidth = v54
        }, v16.getScrollState(v52.itemWidth, v52.itemPadding, v54));
    end;
end;
v16.didMount = function(v55)
    v55._isMounted = true;
    if v11() then
        v55:handleResize((v55.frameRef:getValue()));
    end;
end;
v16.didUpdate = function(v56, v57, v58)
    if ((v56.props.itemCount < v57.itemCount or v56.props.itemWidth ~= v57.itemWidth) or v56.props.itemPadding ~= v57.itemPadding) or v56.state.maxNumOfItemsVisible ~= v58.maxNumOfItemsVisible then
        v56:scrollToIndex(v56.props.index, v57.index);
    end;
end;
v16.willUnmount = function(v59)
    v59._isMounted = false;
    v59:destroyMotor();
end;
v16.render = function(v60)
    local l_carouselMargin_0 = v60.props.carouselMargin;
    local l_carouselHeight_0 = v60.props.carouselHeight;
    local v63 = nil;
    local v64 = nil;
    if v60.state.hoveringCarousel then
        local v65 = v60.props.index > 1;
        local v66 = v60.props.index + v60.state.maxNumOfItemsVisible <= v60.props.itemCount;
        if v65 then
            v63 = v2.createElement(v8, {
                icon = v13, 
                callback = v60.scrollLeft
            });
        end;
        if v66 then
            v64 = v2.createElement(v8, {
                icon = v14, 
                callback = v60.scrollRight
            });
        end;
    end;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, l_carouselMargin_0, 0, l_carouselHeight_0), 
        Position = UDim2.fromOffset(-l_carouselMargin_0, 0), 
        BackgroundTransparency = 1, 
        [v2.Event.InputBegan] = v60.onMouseEnter, 
        [v2.Event.InputEnded] = v60.onMouseLeave, 
        [v2.Change.AbsoluteSize] = v60.onResize, 
        [v2.Ref] = v60.frameRef
    }, {
        LeftMargin = v2.createElement("Frame", {
            Position = UDim2.fromScale(0, 0), 
            AnchorPoint = Vector2.new(0, 0), 
            Size = UDim2.new(0, l_carouselMargin_0, 1, 0), 
            BackgroundTransparency = 1, 
            ZIndex = 2
        }, {
            ScrollLeftButton = v63
        }), 
        Carousel = v2.createElement("Frame", {
            Size = UDim2.new(1, -2 * l_carouselMargin_0, 1, 0), 
            Position = UDim2.fromOffset(l_carouselMargin_0, 0), 
            BackgroundTransparency = 1
        }, {
            InnerCarouselContent = v2.createElement(v7, {
                carouselHeight = l_carouselHeight_0, 
                canvasWidth = if not v12 then v60.props.canvasWidth + v60.state.canvasOffset else v60.props.canvasWidth, 
                items = v60.props.items, 
                onChangeCanvasPosition = v60.props.onChangeCanvasPosition, 
                onRefCallback = v60.props.onRefCallback, 
                canvasPosition = v60.state.canvasPosition, 
                scrollingAnimationActive = v60.state.animationActive
            })
        }), 
        RightMargin = v2.createElement("Frame", {
            Position = UDim2.fromScale(1, 0), 
            AnchorPoint = Vector2.new(1, 0), 
            Size = UDim2.new(0, l_carouselMargin_0, 1, 0), 
            BackgroundTransparency = 1, 
            ZIndex = 2
        }, {
            ScrollRightButton = v64
        })
    });
end;
return v16;
