local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.Parent.React);
local v3 = require(l_Parent_0.HorizontalNav.IntroScroll);
local v4 = require(l_Parent_0.HorizontalNav.GradientFrame);
local v5 = require(l_Parent_0.HorizontalNav.ArrowFrame);
local v6 = require(l_Parent_0.HorizontalNav.Utils);
local v7 = require(l_Parent_1.Utility.useIsMouseAndKeyboard);
return function(v8)
    local l_listHeight_0 = v8.listHeight;
    local l_childWidgetIndex_0 = v8.childWidgetIndex;
    local l_useIntroScroll_0 = v8.useIntroScroll;
    local v12 = v8.canvasWidth or 0;
    local v13 = v7();
    local v14 = v2.useRef(nil);
    local v15, v16 = v2.useBinding(false);
    local v17, v18 = v2.useBinding(false);
    local v19, v20 = v2.useBinding(Vector2.new(0, 0));
    local v28 = v2.useCallback(function(v21)
        local v22 = v14:getValue();
        if v22 then
            local v23, v24, v25 = v6.shouldShowGradientsForScrollingFrame(v21);
            v22.Visible = v23 and (not v8.hideGradient or v13);
            local l_Left_0 = v22:FindFirstChild("Left");
            local l_Right_0 = v22:FindFirstChild("Right");
            if not (not l_Left_0 or not l_Right_0) then
                l_Left_0.Visible = v24;
                l_Right_0.Visible = v25;
            end;
            v16(v24);
            v18(v25);
            return ;
        else
            return ;
        end;
    end, {
        v14, 
        v16, 
        v18
    });
    local v30 = v2.useCallback(function(v29)
        v28(v29);
        v20(v29.CanvasPosition);
    end, {
        v28, 
        v20
    });
    v2.useEffect(function()
        local v31 = v8.scrollingFrameRef:getValue();
        if v31 then
            v28(v31);
        end;
    end);
    return v2.createElement(v2.Fragment, {}, {
        ScrollingList = v2.createElement("ScrollingFrame", {
            ClipsDescendants = v8.clipsDescendants, 
            Size = UDim2.new(1, 0, 1, 0), 
            CanvasSize = UDim2.new(0, v12, 1, 0), 
            CanvasPosition = v19, 
            ScrollBarThickness = 0, 
            BackgroundTransparency = 1, 
            ElasticBehavior = Enum.ElasticBehavior.Always, 
            ScrollingDirection = Enum.ScrollingDirection.X, 
            ZIndex = 2, 
            [v2.Change.AbsoluteSize] = v28, 
            [v2.Change.CanvasSize] = v28, 
            [v2.Change.CanvasPosition] = v30, 
            ref = v8.scrollingFrameRef
        }, v8.getScollingListContent()), 
        GradientFrame = v2.createElement(v4, {
            height = l_listHeight_0, 
            frameRef = v14, 
            ZIndex = 3
        }), 
        ArrowFrame = v13 and v2.createElement(v5, {
            isVisibleLeft = v15, 
            isVisibleRight = v17, 
            defaultUseProps = {
                scrollingFrameRef = v8.scrollingFrameRef, 
                buttonRefs = v8.buttonRefs, 
                buttonWidth = v8.buttonWidth, 
                padOutsideEdges = v8.padOutsideEdges, 
                numButtons = v8.numButtons, 
                buttonPadding = v8.buttonPadding, 
                updateCanvasPosition = v20
            }, 
            ZIndex = 4
        }), 
        IntroScroll = not not l_useIntroScroll_0 and v2.createElement(v3, {
            childWidgetIndex = l_childWidgetIndex_0, 
            scrollingFrameRef = v8.scrollingFrameRef, 
            updateCanvasPosition = v20
        }) or nil
    });
end;
