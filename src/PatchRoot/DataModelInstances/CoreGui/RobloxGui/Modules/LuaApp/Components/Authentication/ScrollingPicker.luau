local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Cryo);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v5 = require(l_Modules_0.LuaApp.FitChildren);
local v6 = require(l_Modules_0.LuaApp.Enum.ScrollingPickerDirection);
local v7 = require(l_CorePackages_0.Otter);
local v8 = {
    [v6.Horizontal] = "X", 
    [v6.Vertical] = "Y"
};
local v9 = {
    [v6.Horizontal] = "Y", 
    [v6.Vertical] = "X"
};
local v10 = {
    spring = "spring", 
    instant = "instant"
};
local v11 = v2.PureComponent:extend("ScrollingPicker");
v11.defaultProps = {
    layoutOrder = 0, 
    parentSpecifiedTarget = 1, 
    entries = {}, 
    entrySizeOnScrollingAxis = 10, 
    scrollDirection = v6.Vertical, 
    clipsDescendants = true
};
local v14 = setmetatable({
    [Enum.UserInputType.MouseButton1] = true, 
    [Enum.UserInputType.Touch] = true
}, {
    __index = function(_, _)
        return false;
    end
});
v11.init = function(v15)
    local _ = v15.props.initialIndex;
    local l_parentSpecifiedTarget_0 = v15.props.parentSpecifiedTarget;
    local l_scrollDirection_0 = v15.props.scrollDirection;
    v15.state = {
        scrollDirection = l_scrollDirection_0, 
        scrollingAxis = v8[l_scrollDirection_0], 
        subAxis = v9[l_scrollDirection_0]
    };
    v15.isMounted = false;
    v15.currentIndex = 1;
    v15.targetIndex = l_parentSpecifiedTarget_0;
    v15.isTargetIndexSetByUserInput = false;
    v15.timeInputBegan = tick();
    v15.recognizedInputBegan = false;
    v15.inputChanged = false;
    v15.inputPositionAtInputBegan = 0;
    v15.inputPreviousPositionScrollingAxis = 0;
    v15.scrollRef = v2.createRef();
    v15.getCenterIndexByPosition = function(v19)
        return math.floor(-v19 / v15.props.entrySizeOnScrollingAxis) + 1;
    end;
    v15.getCenterIndexByScrollPosition = function(v20)
        return v15.getCenterIndexByPosition(v20 - v15.props.entrySizeOnScrollingAxis / 2);
    end;
    v15.updateParent = function()
        local l_onCurrentIndexChanged_0 = v15.props.onCurrentIndexChanged;
        local l_onSelectedIndexChanged_0 = v15.props.onSelectedIndexChanged;
        if l_onCurrentIndexChanged_0 then
            l_onCurrentIndexChanged_0(v15.currentIndex);
        end;
        if l_onSelectedIndexChanged_0 and v15.currentIndex == v15.targetIndex then
            l_onSelectedIndexChanged_0(v15.currentIndex, v15.isTargetIndexSetByUserInput);
        end;
    end;
    v15.onScrollPositionChanged = function()
        if v15.scrollRef.current then
            local v23 = v15.getCenterIndexByScrollPosition(v15.scrollRef.current.Position[v15.state.scrollingAxis].Offset);
            if v23 ~= v15.currentIndex then
                v15.currentIndex = v23;
                v15.updateParent();
            end;
        end;
    end;
    v15.updateTargetIndex = function(v24)
        local l_newTargetIndex_0 = v24.newTargetIndex;
        local l_isSetByUserInput_0 = v24.isSetByUserInput;
        local l_otterAnimationType_0 = v24.otterAnimationType;
        if l_otterAnimationType_0 == nil then
            l_otterAnimationType_0 = v10.spring;
        end;
        local l_entries_0 = v15.props.entries;
        local l_entrySizeOnScrollingAxis_0 = v15.props.entrySizeOnScrollingAxis;
        v15.targetIndex = #l_entries_0 < 1 and 0 or math.clamp(l_newTargetIndex_0, 1, #l_entries_0);
        v15.isTargetIndexSetByUserInput = l_isSetByUserInput_0;
        v15.motor:setGoal(v7[l_otterAnimationType_0](-(l_entrySizeOnScrollingAxis_0 * (v15.targetIndex - 1)), {
            frequency = 2
        }));
        if v15.currentIndex == v15.targetIndex then
            v15.updateParent();
        end;
    end;
    v15.updateIndexByInputPosition = function(v30)
        if v15.scrollRef.current then
            local l_scrollingAxis_0 = v15.state.scrollingAxis;
            local l_AbsolutePosition_0 = v15.scrollRef.current.AbsolutePosition;
            local l_AbsoluteSize_0 = v15.scrollRef.current.AbsoluteSize;
            if ((l_AbsolutePosition_0.X < v30.X and v30.X < l_AbsolutePosition_0.X + l_AbsoluteSize_0.X) and l_AbsolutePosition_0.Y < v30.Y) and v30.Y < l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y then
                v15.updateTargetIndex({
                    newTargetIndex = v15.getCenterIndexByPosition(l_AbsolutePosition_0[l_scrollingAxis_0] - v30[l_scrollingAxis_0]), 
                    isSetByUserInput = true
                });
            end;
        end;
    end;
    v15.updateIndexByScrollPositionAndOffset = function(v34)
        v34 = v34 or 0;
        if v15.scrollRef.current then
            v15.updateTargetIndex({
                newTargetIndex = v15.getCenterIndexByScrollPosition(v15.scrollRef.current.Position[v15.state.scrollingAxis].Offset + v34), 
                isSetByUserInput = true
            });
        end;
    end;
    v15.onInputBegan = function(_, v36)
        local l_entries_1 = v15.props.entries;
        local l_scrollingAxis_1 = v15.state.scrollingAxis;
        if (not (not v15.isMounted or not v14[v36.UserInputType]) and #l_entries_1 > 0) and v36.UserInputState == Enum.UserInputState.Begin then
            v15.recognizedInputBegan = true;
            v15.timeInputBegan = tick();
            v15.inputPositionAtInputBegan = v36.Position[l_scrollingAxis_1];
            v15.inputPreviousPositionScrollingAxis = v36.Position[l_scrollingAxis_1];
            v15.motor:stop();
        end;
    end;
    v15.onInputChanged = function(_, v40)
        local l_entries_2 = v15.props.entries;
        local l_entrySizeOnScrollingAxis_1 = v15.props.entrySizeOnScrollingAxis;
        local l_scrollingAxis_2 = v15.state.scrollingAxis;
        if v15.recognizedInputBegan then
            local v44 = v40.Position[l_scrollingAxis_2] - v15.inputPreviousPositionScrollingAxis;
            if v15.scrollRef.current then
                v15.motor:setGoal(v7.instant((math.max(math.min(0, v15.scrollRef.current.Position[l_scrollingAxis_2].Offset + v44), -(l_entrySizeOnScrollingAxis_1 * (#l_entries_2 - 1))))));
            end;
            v15.inputChanged = true;
            v15.inputPreviousPositionScrollingAxis = v40.Position[l_scrollingAxis_2];
        end;
    end;
    v15.onInputEnded = function(_, v46)
        local l_scrollingAxis_3 = v15.state.scrollingAxis;
        if v15.recognizedInputBegan then
            local v48 = v46.Position[l_scrollingAxis_3] - v15.inputPositionAtInputBegan;
            if v15.inputChanged and math.abs(v48) > 1.5 then
                local v49 = tick() - v15.timeInputBegan;
                if v49 < 0.3 then
                    v15.updateIndexByScrollPositionAndOffset(v46.Delta[l_scrollingAxis_3] / v49);
                else
                    v15.updateIndexByScrollPositionAndOffset(0);
                end;
            else
                v15.updateIndexByInputPosition(v46.Position);
            end;
        end;
        v15.recognizedInputBegan = false;
        v15.inputChanged = false;
    end;
    v15.onMouseWheelForward = function()
        v15.updateTargetIndex({
            newTargetIndex = v15.targetIndex - 1, 
            isSetByUserInput = true
        });
    end;
    v15.onMouseWheelBackward = function()
        v15.updateTargetIndex({
            newTargetIndex = v15.targetIndex + 1, 
            isSetByUserInput = true
        });
    end;
end;
v11.didMount = function(v50)
    v50.updateParent();
    v50.motor = v7.createSingleMotor(0);
    v50.motor:onStep(function(v51)
        if v50.scrollRef.current then
            local l_scrollingAxis_4 = v50.state.scrollingAxis;
            local l_subAxis_0 = v50.state.subAxis;
            local l_scrollDirection_1 = v50.state.scrollDirection;
            local l_Position_0 = v50.scrollRef.current.Position;
            v50.scrollRef.current.Position = if l_scrollDirection_1 == v6.Horizontal then UDim2.new(UDim.new(l_Position_0[l_scrollingAxis_4].Scale, v51), l_Position_0[l_subAxis_0]) else UDim2.new(l_Position_0[l_subAxis_0], UDim.new(l_Position_0[l_scrollingAxis_4].Scale, v51));
        end;
    end);
    v50.motor:onComplete(function()
        if v50.props.onAnimationComplete then
            v50.props.onAnimationComplete();
        end;
    end);
    v50.updateTargetIndex({
        newTargetIndex = v50.targetIndex, 
        isSetByUserInput = false, 
        otterAnimationType = v10.instant
    });
    v50.isMounted = true;
end;
v11.willUnmount = function(v56)
    v56.isMounted = false;
    v56.motor:destroy();
end;
v11.didUpdate = function(v57, v58)
    local l_parentSpecifiedTarget_1 = v57.props.parentSpecifiedTarget;
    local l_entrySizeOnScrollingAxis_2 = v57.props.entrySizeOnScrollingAxis;
    local v61 = true;
    if l_entrySizeOnScrollingAxis_2 == v58.entrySizeOnScrollingAxis then
        v61 = false;
        if l_parentSpecifiedTarget_1 ~= v57.targetIndex then
            v61 = l_parentSpecifiedTarget_1 ~= v58.parentSpecifiedTarget;
        end;
    end;
    if v61 then
        local _ = nil;
        v57.updateTargetIndex({
            newTargetIndex = l_parentSpecifiedTarget_1 or v57.targetIndex, 
            isSetByUserInput = false
        });
    end;
end;
v11.render = function(v63)
    return l_withStyle_0(function(_)
        local l_layoutOrder_0 = v63.props.layoutOrder;
        local l_size_0 = v63.props.size;
        local l_entries_3 = v63.props.entries;
        local l_entrySizeOnScrollingAxis_3 = v63.props.entrySizeOnScrollingAxis;
        local l_clipsDescendants_0 = v63.props.clipsDescendants;
        local l_scrollDirection_2 = v63.state.scrollDirection;
        local l_getEntryWrapperProps_0 = v63.props.getEntryWrapperProps;
        local v72 = nil;
        local v73 = nil;
        local v74 = nil;
        local v75 = nil;
        local v76 = nil;
        if l_scrollDirection_2 == v6.Horizontal then
            v72 = v5.FitAxis.Width;
            v73 = Enum.FillDirection.Horizontal;
            v74 = UDim2.new(0, l_entrySizeOnScrollingAxis_3, 1, 0);
            v75 = UDim2.new(0, 0, 1, 0);
            v76 = UDim2.new(0.5, -l_entrySizeOnScrollingAxis_3 / 2, 0, 0);
        else
            v72 = v5.FitAxis.Height;
            v73 = Enum.FillDirection.Vertical;
            v74 = UDim2.new(1, 0, 0, l_entrySizeOnScrollingAxis_3);
            v75 = UDim2.new(1, 0, 0, 0);
            v76 = UDim2.new(0, 0, 0.5, -l_entrySizeOnScrollingAxis_3 / 2);
        end;
        local v77 = nil;
        v77 = {};
        for v78, v79 in ipairs(l_entries_3) do
            local v80 = {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            };
            if l_getEntryWrapperProps_0 then
                v80 = v3.Dictionary.join(v80, l_getEntryWrapperProps_0(v79));
            end;
            table.insert(v77, v2.createElement("Frame", v3.Dictionary.join(v80, {
                Size = v74, 
                LayoutOrder = v78
            }), {
                v63.props.renderEntry(v79)
            }));
        end;
        table.insert(v77, v2.createElement("UIListLayout", {
            FillDirection = v73, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }));
        return v2.createElement("Frame", {
            LayoutOrder = l_layoutOrder_0, 
            Size = l_size_0, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            ClipsDescendants = l_clipsDescendants_0, 
            [v2.Event.InputBegan] = v63.onInputBegan, 
            [v2.Event.InputChanged] = v63.onInputChanged, 
            [v2.Event.InputEnded] = v63.onInputEnded, 
            [v2.Event.MouseWheelForward] = v63.onMouseWheelForward, 
            [v2.Event.MouseWheelBackward] = v63.onMouseWheelBackward
        }, {
            CenterPosition = v2.createElement("Frame", {
                Size = v75, 
                Position = v76, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, {
                AnimatedSlidingList = v2.createElement(v5.FitFrame, {
                    Size = v75, 
                    fitAxis = v72, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    [v2.Ref] = v63.scrollRef, 
                    [v2.Change.AbsolutePosition] = v63.onScrollPositionChanged
                }, v77)
            })
        });
    end);
end;
return v11;
