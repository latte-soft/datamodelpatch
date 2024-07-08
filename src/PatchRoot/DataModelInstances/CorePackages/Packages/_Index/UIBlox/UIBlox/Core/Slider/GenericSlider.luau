local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v4 = require(l_Parent_2.Roact);
local v5 = require(l_Parent_2.Cryo);
local v6 = require(l_Parent_2.t);
local v7 = require(l_Parent_2.RoactGamepad);
local v8 = require(l_Parent_0.ImageSet.ImageSetComponent);
local v9 = require(l_Parent_1.App.SelectionCursor.useCursorByType);
local v10 = require(l_Parent_1.App.SelectionCursor.CursorType);
local v11 = require(l_Parent_1.Utility.lerp);
local v12 = require(l_Parent_1.App.SelectionImage.CursorKind);
local v13 = require(l_Parent_1.App.SelectionImage.withSelectionCursorProvider);
local v14 = require(l_Parent_2.UIBlox.UIBloxConfig);
local v15 = v4.PureComponent:extend("GenericSlider");
v15.validateProps = v6.strictInterface({
    lowerValue = v6.number, 
    upperValue = v6.optional(v6.number), 
    min = v6.number, 
    max = v6.number, 
    stepInterval = v6.numberPositive, 
    isDisabled = v6.optional(v6.boolean), 
    onValueChanged = v6.callback, 
    onDragStartLower = v6.optional(v6.callback), 
    onDragStartUpper = v6.optional(v6.callback), 
    onDragEnd = v6.optional(v6.callback), 
    trackImage = v6.union(v6.string, v6.table), 
    trackColor = v6.union(v6.Color3, v6.table), 
    trackTransparency = v6.union(v6.number, v6.table), 
    trackSliceCenter = v6.optional(v6.Rect), 
    trackFillImage = v6.union(v6.string, v6.table), 
    trackFillColor = v6.union(v6.Color3, v6.table), 
    trackFillTransparency = v6.union(v6.number, v6.table), 
    trackFillSliceCenter = v6.optional(v6.Rect), 
    knobImage = v6.union(v6.string, v6.table), 
    knobColorLower = v6.union(v6.Color3, v6.table), 
    knobColorUpper = v6.optional(v6.union(v6.Color3, v6.table)), 
    knobTransparency = v6.union(v6.number, v6.table), 
    knobImagePadding = v6.optional(v6.numberMin(0)), 
    knobShadowImage = v6.union(v6.string, v6.table), 
    knobShadowTransparencyLower = v6.union(v6.number, v6.table), 
    knobShadowTransparencyUpper = v6.optional(v6.union(v6.number, v6.table)), 
    width = v6.optional(v6.UDim), 
    position = v6.optional(v6.UDim2), 
    anchorPoint = v6.optional(v6.Vector2), 
    layoutOrder = v6.optional(v6.integer), 
    imageButtonRef = v6.optional(v6.table), 
    NextSelectionUp = v6.optional(v6.table), 
    NextSelectionDown = v6.optional(v6.table), 
    focusController = v6.optional(v6.table), 
    customTrack = v6.optional(v6.table), 
    customKnobHeight = v6.optional(v6.number), 
    customKnobBorderColor = v6.optional(v6.Color3), 
    customKnobBorderSize = v6.optional(v6.number), 
    selectedCursor = if not v14.migrateToNewSelectionCursor then nil else v6.optional(v6.any), 
    unselectedCursor = if not v14.migrateToNewSelectionCursor then nil else v6.optional(v6.any)
});
v15.defaultProps = {
    width = UDim.new(1, 0), 
    knobImagePadding = 0, 
    customKnobBorderColor = Color3.new(0, 0, 0)
};
v15.init = function(v16)
    v16.rootRef = v16.props.imageButtonRef or v4.createRef();
    v16.lowerKnobRef = v4.createRef();
    v16.upperKnobRef = v4.createRef();
    v16.moveDirection = 0;
    v16.lowerKnobDrag = false;
    v16.upperKnobDrag = false;
    v16.totalMoveTime = 0;
    v16.isFirstMove = true;
    v16.unhandledTime = 0;
    v16.state = {
        lowerKnobIsSelected = false, 
        upperKnobIsSelected = false
    };
end;
v15.getKnobVisibleHeight = function(v17)
    if not v17.props.customKnobHeight then
        return 44 - v17.props.knobImagePadding * 2;
    else
        return ((44 - v17.props.knobImagePadding * 2) / 44) * v17.props.customKnobHeight;
    end;
end;
v15.getKnobHeight = function(v18)
    if not v18.props.customKnobHeight then
        return 44;
    else
        return (44 / (44 - v18.props.knobImagePadding * 2)) * v18.props.customKnobHeight;
    end;
end;
v15.onMoveStep = function(v19, v20, v21)
    if v19.state.lowerKnobIsSelected or v19.state.upperKnobIsSelected then
        local l_Position_0 = v20[Enum.KeyCode.Thumbstick1].Position;
        local v23 = l_Position_0.Magnitude > 0.2;
        local v24 = 0;
        local v25 = nil;
        local v26 = nil;
        local v27 = nil;
        v19.totalMoveTime = v19.totalMoveTime + v21;
        if not v23 then
            v26 = (v20[Enum.KeyCode.DPadLeft].UserInputState == Enum.UserInputState.Begin and -1 or 0) + (v20[Enum.KeyCode.DPadRight].UserInputState == Enum.UserInputState.Begin and 1 or 0);
            v25 = 0.5;
            v27 = 8;
        else
            v26 = l_Position_0.x > 0 and 1 or -1;
            v25 = 0.2;
            v27 = 12;
        end;
        if v26 ~= 0 then
            if not v19.isFirstMove then
                if v25 < v19.totalMoveTime then
                    local v28 = (v21 - math.max((v25 - v19.totalMoveTime) - v21, 0)) + v19.unhandledTime;
                    v24 = math.floor(v27 * v28);
                    v19.unhandledTime = v28 - v24 / v27;
                else
                    v24 = 0;
                    v19.unhandledTime = 0;
                end;
            else
                v19.isFirstMove = false;
                v19.totalMoveTime = 0;
                v19.unhandledTime = 0;
                v24 = 1;
            end;
        else
            v19.totalMoveTime = 0;
            v19.isFirstMove = true;
        end;
        if v24 > 0 then
            v19:processGamepadInput(v26, v24);
        end;
        return ;
    else
        return ;
    end;
end;
v15.processGamepadInput = function(v29, v30, v31)
    if not v29:hasTwoKnobs() then
        v29:processOneKnobGamepadInput(v30, v31);
        return ;
    else
        v29:processTwoKnobGamepadInput(v30, v31);
        return ;
    end;
end;
v15.processTwoKnobGamepadInput = function(v32, v33, v34)
    local v35 = v32.props.stepInterval * v33;
    local l_lowerValue_0 = v32.props.lowerValue;
    local l_upperValue_0 = v32.props.upperValue;
    if not (l_lowerValue_0 == l_upperValue_0) or v32.state.processingGamepad then
        if not v32.state.processingGamepad then
            v32:setState({
                processingGamepad = true
            });
        end;
    elseif (v32.state.lowerKnobIsSelected and v33 == 1) and l_lowerValue_0 ~= v32.props.max then
        v32:setState({
            lowerKnobIsSelected = false, 
            upperKnobIsSelected = true, 
            processingGamepad = true
        });
        v32.props.focusController.moveFocusTo(v32.upperKnobRef);
    elseif (v32.state.upperKnobIsSelected and v33 == -1) and l_upperValue_0 ~= v32.props.min then
        v32:setState({
            lowerKnobIsSelected = true, 
            upperKnobIsSelected = false, 
            processingGamepad = true
        });
        v32.props.focusController.moveFocusTo(v32.lowerKnobRef);
    end;
    if not v32.state.lowerKnobIsSelected then
        if v32.state.upperKnobIsSelected then
            local v38 = math.max(math.min(l_upperValue_0 + v35 * v34, v32.props.max), v32.props.min);
            l_upperValue_0 = if l_lowerValue_0 <= v38 then v38 else l_lowerValue_0;
        end;
    else
        local v39 = math.max(math.min(l_lowerValue_0 + v35 * v34, v32.props.max), v32.props.min);
        l_lowerValue_0 = if v39 <= l_upperValue_0 then v39 else l_upperValue_0;
    end;
    if not (l_upperValue_0 == v32.props.upperValue) or l_lowerValue_0 ~= v32.props.lowerValue then
        v32.props.onValueChanged(l_lowerValue_0, l_upperValue_0);
    end;
end;
v15.processOneKnobGamepadInput = function(v40, v41, v42)
    local v43 = v40.props.stepInterval * v41;
    local l_lowerValue_1 = v40.props.lowerValue;
    if v40.state.lowerKnobIsSelected then
        l_lowerValue_1 = math.max(math.min(l_lowerValue_1 + v43 * v42, v40.props.max), v40.props.min);
    end;
    if l_lowerValue_1 ~= v40.props.lowerValue then
        v40.props.onValueChanged(l_lowerValue_1);
    end;
end;
v15.renderTrack = function(v45, v46, v47, v48)
    if not v45.props.customTrack then
        return v4.createElement(v8.Label, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            ImageColor3 = v45.props.trackColor, 
            ImageTransparency = v45.props.trackTransparency, 
            Image = v45.props.trackImage, 
            Size = UDim2.new(1, 0, 0, 4), 
            Position = UDim2.fromScale(0.5, 0.5), 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v45.props.trackSliceCenter
        }, {
            TrackFill = v4.createElement(v8.Label, {
                BackgroundTransparency = 1, 
                ImageColor3 = v45.props.trackFillColor, 
                ImageTransparency = v45.props.trackFillTransparency, 
                Image = v45.props.trackFillImage, 
                Size = v46, 
                Position = not not v47 and UDim2.new(v48, 0, 0, 0) or UDim2.new(0, 0, 0, 0), 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v45.props.trackFillSliceCenter
            })
        });
    else
        return v45.props.customTrack;
    end;
end;
v15.wrapKnobWithBorder = function(v49, v50, v51)
    local v52 = if not v49.props.customKnobHeight then v49:getKnobVisibleHeight() else v49.props.customKnobHeight;
    return v4.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Size = UDim2.fromOffset(v52, v52), 
        Position = v51, 
        BackgroundColor3 = v49.props.customKnobBorderColor, 
        ZIndex = 3
    }, {
        UICorner = v4.createElement("UICorner", {
            CornerRadius = UDim.new(0.5, 0)
        }), 
        KnobContent = v50
    });
end;
v15.renderUpperKnob = function(v53, v54, v55, v56, v57)
    if v56 then
        local v58 = v53:getKnobHeight();
        local l_v54_0 = v54;
        if v53.props.customKnobBorderSize and v53.props.customKnobBorderSize > 0 then
            v58 = v58 - 2 * (v53.props.customKnobBorderSize + 2);
            l_v54_0 = UDim2.fromScale(0.5, 0.5);
        end;
        local v65 = v4.createElement(v7.Focusable[v8.Button], {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            ImageColor3 = v53.props.knobColorUpper, 
            ImageTransparency = v53.props.knobTransparency, 
            Image = v53.props.knobImage, 
            Size = UDim2.fromOffset(v58, v58), 
            Position = l_v54_0, 
            ZIndex = 3, 
            NextSelectionLeft = (not v55 and v53.props.upperValue ~= v53.props.lowerValue) and v53.lowerKnobRef or nil, 
            NextSelectionRight = not not v55 and v53.upperKnobRef or nil, 
            NextSelectionUp = not not v55 and v53.upperKnobRef or nil, 
            NextSelectionDown = not not v55 and v53.upperKnobRef or nil, 
            SelectionImageObject = not not v55 and if not v14.migrateToNewSelectionCursor then v57(v12.SelectedKnob) else v53.props.selectedCursor or if v14.migrateToNewSelectionCursor then v53.props.unselectedCursor else v57(v12.UnselectedKnob), 
            [v4.Ref] = v53.upperKnobRef, 
            [v4.Event.InputBegan] = function(_, v61)
                if not v53.props.isDisabled then
                    v53:onInputBegan(v61, true);
                    return ;
                else
                    return ;
                end;
            end, 
            inputBindings = {
                OnMoveStep = v7.Input.onMoveStep(function(v62, v63)
                    v53:onMoveStep(v62, v63);
                end), 
                SelectUpperKnob = v7.Input.onBegin(Enum.KeyCode.ButtonA, function()
                    v53:setState(function(v64)
                        return {
                            upperKnobIsSelected = not v64.upperKnobIsSelected, 
                            processingGamepad = false
                        };
                    end);
                end), 
                UnselectUpperKnob = not not v55 and v7.Input.onBegin(Enum.KeyCode.ButtonB, function()
                    v53:setState({
                        upperKnobIsSelected = false, 
                        processingGamepad = false
                    });
                end) or nil
            }
        });
        if v53.props.customKnobBorderSize and v53.props.customKnobBorderSize > 0 then
            return v53:wrapKnobWithBorder(v65, v54);
        else
            return v65;
        end;
    else
        return nil;
    end;
end;
v15.renderLowerKnob = function(v66, v67, v68, v69, v70)
    local v71 = v66:getKnobHeight();
    local l_v67_0 = v67;
    if v66.props.customKnobBorderSize and v66.props.customKnobBorderSize > 0 then
        v71 = v71 - 2 * (v66.props.customKnobBorderSize + 2);
        l_v67_0 = UDim2.fromScale(0.5, 0.5);
    end;
    local v78 = v4.createElement(v7.Focusable[v8.Button], {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        ImageColor3 = v66.props.knobColorLower, 
        ImageTransparency = v66.props.knobTransparency, 
        Image = v66.props.knobImage, 
        Size = UDim2.fromOffset(v71, v71), 
        Position = l_v67_0, 
        ZIndex = 3, 
        inputBindings = {
            OnMoveStep = v7.Input.onMoveStep(function(v73, v74)
                v66:onMoveStep(v73, v74);
            end), 
            SelectLowerKnob = v7.Input.onBegin(Enum.KeyCode.ButtonA, function()
                v66:setState(function(v75)
                    return {
                        lowerKnobIsSelected = not v75.lowerKnobIsSelected, 
                        processingGamepad = false
                    };
                end);
            end), 
            UnselectLowerKnob = not not v68 and v7.Input.onBegin(Enum.KeyCode.ButtonB, function()
                v66:setState({
                    lowerKnobIsSelected = false, 
                    processingGamepad = false
                });
            end) or nil
        }, 
        NextSelectionLeft = not not v68 and v66.lowerKnobRef or nil, 
        NextSelectionRight = (not (not v69 or v68) and v66.props.upperValue ~= v66.props.lowerValue) and v66.upperKnobRef or nil, 
        NextSelectionUp = not not v68 and v66.lowerKnobRef or nil, 
        NextSelectionDown = not not v68 and v66.lowerKnobRef or nil, 
        SelectionImageObject = not not v68 and if not v14.migrateToNewSelectionCursor then v70(v12.SelectedKnob) else v66.props.selectedCursor or if v14.migrateToNewSelectionCursor then v66.props.unselectedCursor else v70(v12.UnselectedKnob), 
        [v4.Ref] = v66.lowerKnobRef, 
        [v4.Event.InputBegan] = function(_, v77)
            if not v66.props.isDisabled then
                v66:onInputBegan(v77, true);
                return ;
            else
                return ;
            end;
        end
    });
    if v66.props.customKnobBorderSize and v66.props.customKnobBorderSize > 0 then
        return v66:wrapKnobWithBorder(v78, v67);
    else
        return v78;
    end;
end;
v15.renderKnobShadow = function(v79, v80, v81)
    return v4.createElement(v8.Label, {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        ImageTransparency = v80, 
        Image = v79.props.knobShadowImage, 
        Size = UDim2.fromOffset(v79:getKnobHeight(), v79:getKnobHeight()), 
        Position = v81, 
        ZIndex = 2
    });
end;
v15.render = function(v82)
    local v83 = v82.state.lowerKnobIsSelected or v82.state.upperKnobIsSelected;
    local v84 = v82:hasTwoKnobs();
    local v85 = (v82.props.lowerValue - v82.props.min) / (v82.props.max - v82.props.min);
    local v86 = not not v84 and (v82.props.upperValue - v82.props.min) / (v82.props.max - v82.props.min) or nil;
    local v87 = v82:getKnobVisibleHeight();
    local v88 = v11(v87 / 2, -v87 / 2, v85);
    local v89 = not not v84 and v11(v87 / 2, -v87 / 2, v86) or nil;
    local v90 = UDim2.new(v85, v88, 0.5, 0);
    local v91 = not not v84 and UDim2.new(v86, v89, 0.5, 0) or nil;
    local v92 = not not v84 and UDim2.fromScale(v86 - v85, 1) or UDim2.fromScale(v85, 1);
    local v93 = v82.state.lowerKnobIsSelected or v82.state.upperKnobIsSelected;
    return v13(function(v94)
        return v4.createElement(v7.Focusable[v8.Button], {
            BackgroundTransparency = 1, 
            AnchorPoint = v82.props.anchorPoint, 
            Size = UDim2.new(v82.props.width.Scale, v82.props.width.Offset, 0, 36), 
            LayoutOrder = v82.props.layoutOrder, 
            Position = v82.props.position, 
            [v4.Event.InputBegan] = function(_, v96)
                if not v82.props.isDisabled then
                    v82:onInputBegan(v96, false);
                    return ;
                else
                    return ;
                end;
            end, 
            [v4.Ref] = v82.rootRef, 
            NextSelectionLeft = not not v93 and v82.rootRef or nil, 
            NextSelectionRight = not not v93 and v82.rootRef or nil, 
            NextSelectionUp = not v93 and v82.props.NextSelectionUp or v82.rootRef, 
            NextSelectionDown = not v93 and v82.props.NextSelectionDown or v82.rootRef, 
            defaultChild = (v82.props.upperValue ~= v82.props.min and v82.lowerKnobRef or v82.upperKnobRef) or nil, 
            onFocusLost = function()
                if not (not v82.state.lowerKnobIsSelected and not v82.state.upperKnobIsSelected) then
                    v82:setState({
                        lowerKnobIsSelected = false, 
                        upperKnobIsSelected = false
                    });
                end;
            end
        }, {
            Track = v82:renderTrack(v92, v84, v85), 
            LowerKnob = v82:renderLowerKnob(v90, v83, v84, v94), 
            LowerKnobShadow = v82:renderKnobShadow(v82.props.knobShadowTransparencyLower, v90), 
            UpperKnob = v82:renderUpperKnob(v91, v83, v84, v94), 
            UpperKnobShadow = not not v84 and v82:renderKnobShadow(v82.props.knobShadowTransparencyUpper, v91) or nil
        });
    end);
end;
v15.didMount = function(v97)
    local l_current_0 = v97.rootRef.current;
    local v99 = nil;
    v99 = l_current_0.AncestryChanged:Connect(function()
        if l_current_0:IsDescendantOf(game) then
            v99:Disconnect();
            v97.canUseUserInputService = l_current_0:FindFirstAncestorWhichIsA("PluginGui") == nil;
            return ;
        else
            return ;
        end;
    end);
    if l_current_0:IsDescendantOf(game) then
        v99:Disconnect();
        v97.canUseUserInputService = l_current_0:FindFirstAncestorWhichIsA("PluginGui") == nil;
    end;
end;
v15.didUpdate = function(v100, _, v102)
    if v100.props.disabled then
        v100:stopListeningForDrag();
    end;
    if v14.sliderGamepadDragStartAndEnd then
        local v103 = v102.lowerKnobIsSelected and not v100.state.lowerKnobIsSelected;
        local v104 = v102.upperKnobIsSelected and not v100.state.upperKnobIsSelected;
        if not (v100.props.onDragEnd ~= nil) or not v103 and not v104 then
            if (not (v100.props.onDragStartLower ~= nil) or v102.lowerKnobIsSelected) or not v100.state.lowerKnobIsSelected then
                if not ((not (v100.props.onDragStartUpper ~= nil) or v102.upperKnobIsSelected) or not v100.state.upperKnobIsSelected) then
                    v100.props.onDragStartUpper();
                end;
            else
                v100.props.onDragStartLower();
                return ;
            end;
        else
            v100.props.onDragEnd();
            return ;
        end;
    end;
end;
v15.willUnmount = function(v105)
    v105:stopListeningForDrag();
end;
v15.onInputBegan = function(v106, v107, v108)
    if not v106.props.disabled then
        if v107.UserInputState ~= Enum.UserInputState.Begin then
            return ;
        else
            local l_UserInputType_0 = v107.UserInputType;
            if l_UserInputType_0 ~= Enum.UserInputType.MouseButton1 and l_UserInputType_0 ~= Enum.UserInputType.Touch then
                return ;
            elseif not (l_UserInputType_0 == Enum.UserInputType.Touch) or v108 then
                v106:processDrag(v107.Position.X);
                v106:startListeningForDrag();
                return ;
            else
                return ;
            end;
        end;
    else
        return ;
    end;
end;
v15.startListeningForDrag = function(v110)
    local l_current_1 = v110.rootRef.current;
    if l_current_1 == nil then
        return ;
    elseif not v110.dragging then
        if not v110.canUseUserInputService then
            local l_l_current_1_FirstAncestorWhichIsA_0 = l_current_1:FindFirstAncestorWhichIsA("PluginGui");
            local l_ImageButton_0 = Instance.new("ImageButton");
            l_ImageButton_0.BackgroundTransparency = 1;
            l_ImageButton_0.Image = "";
            l_ImageButton_0.Name = "SliderPluginGuiInputCapturer";
            l_ImageButton_0.Size = UDim2.new(1, 0, 1, 0);
            l_ImageButton_0.ZIndex = 100000;
            v110.moveConnection = l_ImageButton_0.MouseMoved:Connect(function(v114)
                v110:processDrag(v114);
            end);
            v110.releaseConnection = l_ImageButton_0.MouseButton1Up:Connect(function(v115)
                v110:stopListeningForDrag();
                v110:processOneKnobDrag(v115);
            end);
            v110.focusLostConnection = l_ImageButton_0.MouseLeave:Connect(function(v116)
                v110:stopListeningForDrag();
                v110:processOneKnobDrag(v116);
            end);
            l_ImageButton_0.Parent = l_l_current_1_FirstAncestorWhichIsA_0;
            v110.inputCapturerButton = l_ImageButton_0;
        else
            v110.moveConnection = l_UserInputService_0.InputChanged:Connect(function(v117)
                if v110.dragging then
                    local l_UserInputType_1 = v117.UserInputType;
                    if l_UserInputType_1 ~= Enum.UserInputType.MouseMovement and l_UserInputType_1 ~= Enum.UserInputType.Touch then
                        return ;
                    elseif v117.UserInputState ~= Enum.UserInputState.Change then
                        return ;
                    else
                        v110:processDrag(v117.Position.X);
                        return ;
                    end;
                else
                    return ;
                end;
            end);
            v110.releaseConnection = l_UserInputService_0.InputEnded:Connect(function(v119)
                local l_UserInputType_2 = v119.UserInputType;
                if l_UserInputType_2 ~= Enum.UserInputType.MouseButton1 and l_UserInputType_2 ~= Enum.UserInputType.Touch then
                    return ;
                else
                    v110:stopListeningForDrag();
                    v110:processOneKnobDrag(v119.Position.X);
                    return ;
                end;
            end);
            v110.focusLostConnection = l_UserInputService_0.WindowFocusReleased:Connect(function()
                v110:stopListeningForDrag();
            end);
        end;
        v110.dragging = true;
        if v110.lowerKnobDrag and v110.props.onDragStartLower ~= nil then
            v110.props.onDragStartLower();
        end;
        if v110.upperKnobDrag and v110.props.onDragStartUpper ~= nil then
            v110.props.onDragStartUpper();
        end;
        return ;
    else
        return ;
    end;
end;
v15.getSteppedValue = function(v121, v122)
    local l_current_2 = v121.rootRef.current;
    if l_current_2 == nil then
        return 0;
    else
        local l_min_0 = v121.props.min;
        local l_max_0 = v121.props.max;
        local l_stepInterval_0 = v121.props.stepInterval;
        local l_X_0 = l_current_2.AbsoluteSize.X;
        return math.floor(((math.clamp(v122 - l_current_2.AbsolutePosition.X, 0, l_X_0) / l_X_0) * (l_max_0 - l_min_0) + l_min_0) / l_stepInterval_0 + 0.5) * l_stepInterval_0;
    end;
end;
v15.processDrag = function(v128, v129)
    if not v128:hasTwoKnobs() then
        v128:processOneKnobDrag(v129);
        return ;
    else
        v128:processTwoKnobDrag(v129);
        return ;
    end;
end;
v15.processOneKnobDrag = function(v130, v131)
    if not v130:hasTwoKnobs() then
        local v132 = v130:getSteppedValue(v131);
        v130.lowerKnobDrag = true;
        if v132 ~= v130.props.lowerValue then
            v130.props.onValueChanged(v132);
        end;
        return ;
    else
        return ;
    end;
end;
v15.processTwoKnobDrag = function(v133, v134)
    local v135 = v133:getSteppedValue(v134);
    local l_lowerValue_2 = v133.props.lowerValue;
    local l_upperValue_1 = v133.props.upperValue;
    if v133.lowerKnobDrag or v133.upperKnobDrag then
        if not v133.lowerKnobDrag or not v133.upperKnobDrag then
            if not v133.lowerKnobDrag then
                if v133.upperKnobDrag and l_lowerValue_2 <= v135 then
                    l_upperValue_1 = v135;
                end;
            elseif v135 <= l_upperValue_1 then
                l_lowerValue_2 = v135;
            end;
        elseif l_upperValue_1 <= v135 - v133.props.stepInterval then
            v133.upperKnobDrag = true;
            v133.lowerKnobDrag = false;
            l_upperValue_1 = v135;
        elseif v135 + v133.props.stepInterval <= l_lowerValue_2 then
            v133.upperKnobDrag = false;
            v133.lowerKnobDrag = true;
            l_lowerValue_2 = v135;
        end;
    else
        if v135 == l_lowerValue_2 then
            v133.lowerKnobDrag = true;
        end;
        if v135 == l_upperValue_1 then
            v133.upperKnobDrag = true;
        end;
    end;
    if not (l_upperValue_1 == v133.props.upperValue) or l_lowerValue_2 ~= v133.props.lowerValue then
        v133.props.onValueChanged(l_lowerValue_2, l_upperValue_1);
    end;
end;
v15.stopListeningForDrag = function(v138)
    if v138.moveConnection ~= nil then
        v138.moveConnection:Disconnect();
        v138.moveConnection = nil;
    end;
    if v138.releaseConnection ~= nil then
        v138.releaseConnection:Disconnect();
        v138.releaseConnection = nil;
    end;
    if v138.focusLostConnection ~= nil then
        v138.focusLostConnection:Disconnect();
        v138.focusLostConnection = nil;
    end;
    if v138.inputCapturerButton ~= nil then
        v138.inputCapturerButton:Destroy();
        v138.inputCapturerButton = nil;
    end;
    v138.dragging = false;
    v138.lowerKnobDrag = false;
    v138.upperKnobDrag = false;
    if v138.props.onDragEnd ~= nil then
        v138.props.onDragEnd();
    end;
end;
v15.hasTwoKnobs = function(v139)
    return v139.props.upperValue ~= nil;
end;
return v4.forwardRef(function(v140, v141)
    local v142 = v9(v10.SelectedKnob);
    local v143 = v9(v10.UnselectedKnob);
    if v14.migrateToNewSelectionCursor then
        v140 = v5.Dictionary.join({
            selectedCursor = v142, 
            unselectedCursor = v143
        }, v140);
    end;
    return v4.createElement(v15, v5.Dictionary.join(v140, {
        imageButtonRef = v141
    }));
end);
