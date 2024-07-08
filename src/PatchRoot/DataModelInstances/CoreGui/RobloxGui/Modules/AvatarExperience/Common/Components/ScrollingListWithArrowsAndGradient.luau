local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_Modules_0.LuaApp.Constants);
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.GradientFrame);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.ArrowFrame);
local v8 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.IntroScroll);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.withLastInputGroup);
local v11 = v2.PureComponent:extend("ScrollingListWithArrowsAndGradient");
v11.validateProps = v3.strictInterface({
    getScollingListContent = v3.callback, 
    listHeight = v3.number, 
    scrollingFrameRef = v3.table, 
    buttonRefs = v3.optional(v3.table), 
    buttonWidth = v3.optional(v3.number), 
    numButtons = v3.optional(v3.number), 
    padOutsideEdges = v3.optional(v3.boolean), 
    childWidgetIndex = v3.optional(v3.number), 
    useIntroScroll = v3.optional(v3.boolean), 
    buttonPadding = v3.number, 
    canvasWidth = v3.optional(v3.number), 
    lastInputGroup = v3.string
});
v11.init = function(v12)
    v12.gradientFrameRef = v2.createRef();
    local v13, v14 = v2.createBinding(false);
    v12.arrowLeftVisible = v13;
    v12.updateArrowLeftVisible = v14;
    v13, v14 = v2.createBinding(false);
    v12.arrowRightVisible = v13;
    v12.updateArrowRightVisible = v14;
    v13, v14 = v2.createBinding(Vector2.new(0, 0));
    v12.canvasPosition = v13;
    v12.updateCanvasPosition = v14;
    v12.onCanvasPositionChange = function(v15)
        v12.checkShowGradient(v15);
        v12.updateCanvasPosition(v15.CanvasPosition);
    end;
    v12.checkShowGradient = function(v16)
        local v17 = v12.gradientFrameRef:getValue();
        if v17 then
            local v18, v19, v20 = v8.shouldShowGradientForScrollingFrame(v16);
            v17.Visible = v18;
            local l_Left_0 = v17:FindFirstChild("Left");
            local l_Right_0 = v17:FindFirstChild("Right");
            if not (not l_Left_0 or not l_Right_0) then
                l_Left_0.Visible = v19;
                l_Right_0.Visible = v20;
            end;
            v12.updateArrowLeftVisible(v19);
            v12.updateArrowRightVisible(v20);
            return ;
        else
            return ;
        end;
    end;
end;
v11.didUpdate = function(v23)
    local v24 = v23.props.scrollingFrameRef:getValue();
    if v24 then
        v23.checkShowGradient(v24);
    end;
end;
v11.render = function(v25)
    return v2.createFragment({
        ScrollingList = v2.createElement("ScrollingFrame", {
            ClipsDescendants = false, 
            Size = UDim2.new(1, 0, 1, 0), 
            Selectable = false, 
            CanvasSize = UDim2.new(0, v25.props.canvasWidth or 0, 1, 0), 
            CanvasPosition = v25.canvasPosition, 
            ScrollBarThickness = 0, 
            BackgroundTransparency = 1, 
            ElasticBehavior = Enum.ElasticBehavior.Always, 
            ScrollingDirection = Enum.ScrollingDirection.X, 
            ZIndex = 2, 
            [v2.Change.AbsoluteSize] = v25.checkShowGradient, 
            [v2.Change.CanvasSize] = v25.checkShowGradient, 
            [v2.Change.CanvasPosition] = v25.onCanvasPositionChange, 
            [v2.Ref] = v25.props.scrollingFrameRef
        }, v25.props.getScollingListContent()), 
        GradientFrame = v2.createElement(v6, {
            height = v25.props.listHeight, 
            frameRef = v25.gradientFrameRef, 
            ZIndex = 3
        }), 
        ArrowFrame = v25.props.lastInputGroup == v5.InputType.MouseAndKeyboard and v2.createElement(v7, {
            isVisibleLeft = v25.arrowLeftVisible, 
            isVisibleRight = v25.arrowRightVisible, 
            defaultUseProps = {
                scrollingFrameRef = v25.props.scrollingFrameRef, 
                buttonRefs = v25.props.buttonRefs, 
                buttonWidth = v25.props.buttonWidth, 
                padOutsideEdges = v25.props.padOutsideEdges, 
                numButtons = v25.props.numButtons, 
                buttonPadding = v25.props.buttonPadding, 
                updateCanvasPosition = v25.updateCanvasPosition
            }, 
            ZIndex = 4
        }), 
        IntroScroll = not not v25.props.useIntroScroll and v2.createElement(v9, {
            childWidgetIndex = v25.props.childWidgetIndex, 
            scrollingFrameRef = v25.props.scrollingFrameRef, 
            updateCanvasPosition = v25.updateCanvasPosition
        }) or nil
    });
end;
return (v10(v11));
