local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.Packages.t);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v7 = require(l_CorePackages_0.UIBlox);
local l_RoactFitComponents_0 = require(l_CorePackages_0.AvatarExperienceDeps).RoactFitComponents;
local l_FitFrameHorizontal_0 = l_RoactFitComponents_0.FitFrameHorizontal;
local l_withStyle_0 = v7.Style.withStyle;
local v11 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v12 = v4.PureComponent:extend("PillBar");
v12.validateProps = v5.strictInterface({
    layoutOrder = v5.optional(v5.number), 
    [v4.Children] = v5.optional(v5.table), 
    height = v5.optional(v5.number), 
    forwardRef = v5.optional(v5.table), 
    NextSelectionUp = v5.optional(v5.table), 
    NextSelectionDown = v5.optional(v5.table), 
    NextSelectionLeft = v5.optional(v5.table), 
    NextSelectionRight = v5.optional(v5.table)
});
v12.init = function(v13)
    v13.gradientFrameRef = v4.createRef();
    v13.scrollingFrameRef = v4.createRef();
    v13.categoryButtonRefs = {};
    local v14, v15 = v4.createBinding(false);
    v13.showLeftGradientBinding = v14;
    v13.updateShowLeftGradient = v15;
    v14, v15 = v4.createBinding(false);
    v13.showRightGradientBinding = v14;
    v13.updateShowRightGradient = v15;
    v13.checkShowGradient = function(v16)
        local v17, v18, v19 = v11.shouldShowGradientForScrollingFrame(v16);
        v18 = v17 and v18;
        v19 = v17 and v19;
        v13.updateShowLeftGradient(v18);
        v13.updateShowRightGradient(v19);
    end;
    v13.onNavFrameSizeChanged = function(v20)
        if v13.scrollingFrameRef.current then
            v13.scrollingFrameRef.current.CanvasSize = UDim2.new(0, v20.AbsoluteSize.X, 1, 0);
        end;
    end;
end;
local function v23(v21, v22)
    return v4.createElement("UIGradient", {
        Rotation = v22, 
        Color = ColorSequence.new(v21.BackgroundDefault.Color), 
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0), 
            NumberSequenceKeypoint.new(0.666, 1), 
            NumberSequenceKeypoint.new(1, 1)
        })
    });
end;
v12.render = function(v24)
    local l_layoutOrder_0 = v24.props.layoutOrder;
    return l_withStyle_0(function(v26)
        local l_Theme_0 = v26.Theme;
        local l_forwardRef_0 = v24.props.forwardRef;
        local l_height_0 = v24.props.height;
        return v4.createElement(l_Focusable_0.Frame, {
            Size = if not l_height_0 then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 0, l_height_0), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            LayoutOrder = l_layoutOrder_0, 
            [v4.Ref] = l_forwardRef_0, 
            NextSelectionUp = v24.props.NextSelectionUp, 
            NextSelectionDown = v24.props.NextSelectionDown
        }, {
            Left = v4.createElement("Frame", {
                AnchorPoint = Vector2.new(0, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(0, 50, 1, 0), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                BorderSizePixel = 0, 
                ZIndex = 2, 
                Visible = v24.showLeftGradientBinding
            }, {
                Gradient = v23(l_Theme_0, 0)
            }), 
            Right = v4.createElement("Frame", {
                AnchorPoint = Vector2.new(1, 0), 
                Position = UDim2.new(1, 0, 0, 0), 
                Size = UDim2.new(0, 50, 1, 0), 
                BackgroundColor3 = Color3.new(1, 1, 1), 
                BorderSizePixel = 0, 
                ZIndex = 2, 
                Visible = v24.showRightGradientBinding
            }, {
                Gradient = v23(l_Theme_0, 180)
            }), 
            ScrollingList = v4.createElement("ScrollingFrame", {
                Size = UDim2.new(1, 0, 1, 0), 
                ScrollBarThickness = 0, 
                BackgroundTransparency = 1, 
                ZIndex = 1, 
                ElasticBehavior = Enum.ElasticBehavior.Always, 
                ScrollingDirection = Enum.ScrollingDirection.X, 
                [v4.Change.AbsoluteSize] = v24.checkShowGradient, 
                [v4.Change.CanvasSize] = v24.checkShowGradient, 
                [v4.Change.CanvasPosition] = v24.checkShowGradient, 
                [v4.Ref] = v24.scrollingFrameRef
            }, {
                SubNavFrame = v4.createElement(l_FitFrameHorizontal_0, {
                    height = UDim.new(1, 0), 
                    contentPadding = UDim.new(0, 15), 
                    margin = l_RoactFitComponents_0.Rect.rectangle(15, 0), 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    BackgroundTransparency = 1, 
                    [v4.Change.AbsoluteSize] = v24.onNavFrameSizeChanged
                }, v24.props[v4.Children])
            })
        });
    end);
end;
return v4.forwardRef(function(v30, v31)
    return v4.createElement(v12, v3.Dictionary.join(v30, {
        forwardRef = v31
    }));
end);
