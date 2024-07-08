local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Parent.React);
local _ = require(l_Parent_0.Style.StyleTypes);
local v5 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local _ = require(l_Parent_0.ImageSet.ImagesTypes);
return function(v7)
    local l_userInteractionEnabled_0 = v7.userInteractionEnabled;
    local l_width_0 = v7.width;
    local l_anchorPoint_0 = v7.anchorPoint;
    local l_position_0 = v7.position;
    local l_zIndex_0 = v7.zIndex;
    local l_transparency_0 = v7.transparency;
    local l_backgroundColor_0 = v7.backgroundColor;
    local l_paddingStartEnd_0 = v7.paddingStartEnd;
    local l_handleWidth_0 = v7.handleWidth;
    local l_handleColor_0 = v7.handleColor;
    local l_handleCornerRadius_0 = v7.handleCornerRadius;
    local l_handleIcon_0 = v7.handleIcon;
    local l_handleIconSize_0 = v7.handleIconSize;
    local l_handleIconColor_0 = v7.handleIconColor;
    local l_onDragging_0 = v7.onDragging;
    local l_viewSize_0 = v7.viewSize;
    local l_canvasSize_0 = v7.canvasSize;
    local l_canvasPosition_0 = v7.canvasPosition;
    local v26, v27 = v3.useState(false);
    local v28, v29 = v3.useBinding(0);
    local v30, v31 = v3.useState(false);
    local v32 = v3.useRef(0);
    local v33 = v3.useRef(0);
    local v35 = v3.useCallback(function(v34)
        v29(v34.AbsoluteSize.Y);
    end, {
        v29
    });
    local v38 = v3.useCallback(function(v36)
        local l_Parent_2 = v36.Parent;
        if l_Parent_2 ~= nil and math.ceil(v36.AbsoluteSize.Y) < l_Parent_2.AbsoluteSize.Y then
            v27(true);
            return ;
        else
            v27(false);
            return ;
        end;
    end, {
        v27
    });
    local v40 = v3.useMemo(function()
        return v3.joinBindings({
            viewSize = l_viewSize_0, 
            canvasSize = l_canvasSize_0
        }):map(function(v39)
            return UDim2.new(0, l_handleWidth_0, math.clamp(v39.viewSize.Y / v39.canvasSize.Y, 0, 1), 0);
        end);
    end, {
        l_handleWidth_0, 
        l_viewSize_0, 
        l_canvasSize_0
    });
    local v42 = v3.useMemo(function()
        return v3.joinBindings({
            canvasPosition = l_canvasPosition_0, 
            canvasSize = l_canvasSize_0
        }):map(function(v41)
            return UDim2.fromScale(0.5, v41.canvasPosition.Y / v41.canvasSize.Y);
        end);
    end, {
        l_canvasSize_0, 
        l_canvasPosition_0
    });
    local v45 = v3.useCallback(function(_, v44)
        if not (not v26 or not l_userInteractionEnabled_0) and not v30 then
            if v44 and v44.UserInputType == Enum.UserInputType.MouseButton1 then
                v32.current = v44.Position.Y;
                v33.current = l_canvasPosition_0:getValue().Y;
                v31(true);
            end;
            return ;
        else
            return ;
        end;
    end, {
        v26, 
        l_userInteractionEnabled_0, 
        v30, 
        v32, 
        v33, 
        l_canvasPosition_0, 
        v31
    });
    local v51 = v3.useCallback(function(v46)
        if l_userInteractionEnabled_0 and v30 then
            if v46.UserInputType ~= Enum.UserInputType.MouseMovement then
                return ;
            else
                local v47 = (v46.Position.Y - v32.current) / (v28:getValue() - l_paddingStartEnd_0);
                local l_Y_0 = l_viewSize_0:getValue().Y;
                local l_current_0 = v33.current;
                local l_Y_1 = l_canvasSize_0:getValue().Y;
                l_onDragging_0((math.clamp(l_current_0 + v47 * l_Y_1, 0, l_Y_1 - l_Y_0)));
                return ;
            end;
        else
            return ;
        end;
    end, {
        l_userInteractionEnabled_0, 
        v30, 
        v32, 
        v28, 
        l_paddingStartEnd_0, 
        l_viewSize_0, 
        v33, 
        l_canvasSize_0, 
        l_onDragging_0
    });
    local v53 = v3.useCallback(function(v52)
        if l_userInteractionEnabled_0 and v30 then
            if v52 and v52.UserInputType ~= Enum.UserInputType.MouseButton1 then
                return ;
            else
                v31(false);
                return ;
            end;
        else
            return ;
        end;
    end, {
        l_userInteractionEnabled_0, 
        v30, 
        v31
    });
    v3.useEffect(function()
        if v26 and v30 then
            local v54 = l_UserInputService_0.InputChanged:Connect(v51);
            local v55 = l_UserInputService_0.InputEnded:Connect(v53);
            local v56 = l_UserInputService_0.WindowFocusReleased:Connect(v53);
            return function()
                v54:Disconnect();
                v55:Disconnect();
                v56:Disconnect();
            end;
        else
            return function()
            end;
        end;
    end, {
        v26, 
        v30, 
        v51, 
        v53
    });
    local l_l_transparency_0_0 = l_transparency_0;
    if v26 then
        if v30 then
            l_l_transparency_0_0 = 0;
        end;
    else
        l_l_transparency_0_0 = 1;
    end;
    return v3.createElement("CanvasGroup", {
        Selectable = false, 
        Size = UDim2.new(0, l_width_0, 1, 0), 
        AnchorPoint = l_anchorPoint_0, 
        Position = l_position_0, 
        GroupTransparency = l_l_transparency_0_0, 
        BackgroundColor3 = if not l_backgroundColor_0 then nil else l_backgroundColor_0.Color, 
        BackgroundTransparency = not l_backgroundColor_0 and 1 or l_backgroundColor_0.Transparency, 
        BorderSizePixel = 0, 
        ZIndex = l_zIndex_0
    }, {
        Padding = if not l_paddingStartEnd_0 then nil else v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_paddingStartEnd_0), 
            PaddingBottom = UDim.new(0, l_paddingStartEnd_0)
        }), 
        Track = v3.createElement("Frame", {
            Selectable = false, 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ClipsDescendants = true, 
            [v3.Change.AbsoluteSize] = v35
        }, {
            TrackUICorner = if not l_handleCornerRadius_0 then nil else v3.createElement("UICorner", {
                CornerRadius = UDim.new(0, l_handleCornerRadius_0)
            }), 
            Handle = v3.createElement("Frame", {
                Active = v26 and l_userInteractionEnabled_0, 
                Selectable = false, 
                Size = v40, 
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = v42, 
                BackgroundColor3 = if not l_handleColor_0 then nil else l_handleColor_0.Color, 
                BackgroundTransparency = not l_handleColor_0 and 0 or l_handleColor_0.Transparency, 
                BorderSizePixel = 0, 
                [v3.Change.AbsoluteSize] = v38, 
                [v3.Event.InputBegan] = v45
            }, {
                HandleUICorner = if not l_handleCornerRadius_0 then nil else v3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, l_handleCornerRadius_0)
                }), 
                Icon = if not l_handleIcon_0 then nil else v3.createElement(v5.Label, {
                    Selectable = false, 
                    Size = UDim2.fromOffset(l_handleIconSize_0, l_handleIconSize_0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Image = l_handleIcon_0, 
                    ImageColor3 = if not l_handleIconColor_0 then nil else l_handleIconColor_0.Color, 
                    ImageTransparency = if not l_handleIconColor_0 then nil else l_handleIconColor_0.Transparency, 
                    BackgroundTransparency = 1
                })
            })
        })
    });
end;
