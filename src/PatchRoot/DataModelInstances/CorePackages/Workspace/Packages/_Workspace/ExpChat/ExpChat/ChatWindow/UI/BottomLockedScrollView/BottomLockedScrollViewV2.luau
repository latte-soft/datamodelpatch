local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.VirtualizedList);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v4 = game:DefineFastInt("ExpChatScrollLockThreshold", 90) / 100;
local function _(v5)
    local l_AbsoluteWindowSize_0 = v5.AbsoluteWindowSize;
    local l_CanvasPosition_0 = v5.CanvasPosition;
    local l_AbsoluteCanvasSize_0 = v5.AbsoluteCanvasSize;
    local v9 = l_CanvasPosition_0.Y / (l_AbsoluteCanvasSize_0 - l_AbsoluteWindowSize_0).Y;
    if l_AbsoluteCanvasSize_0.Y <= l_AbsoluteWindowSize_0.Y then
        return true;
    else
        return v4 <= v9;
    end;
end;
local function _(v11)
    local v12 = true;
    if v11.UserInputType ~= Enum.UserInputType.MouseMovement then
        v12 = v11.UserInputType == Enum.UserInputType.Touch;
    end;
    return v12;
end;
return function(v14)
    local l_Theme_0 = l_useStyle_0().Theme;
    local v16 = v1.useRef(nil);
    local v17 = v1.useRef(nil);
    local v18, v19 = v1.useState(true);
    local v20, v21 = v1.useState(false);
    local v22, v23 = v1.useState(false);
    v1.useEffect(function()
        if v17.current then
            local l_FirstChildWhichIsA_0 = v17.current:FindFirstChildWhichIsA("ScrollingFrame", true);
            if l_FirstChildWhichIsA_0 then
                v16.current = l_FirstChildWhichIsA_0;
            end;
        end;
    end, {
        v17
    });
    v1.useEffect(function()
        if not (not (v18 and v22 == false) or not v16.current) then
            v16.current.CanvasPosition = Vector2.new(0, 9223372036854775807);
        end;
    end, {
        tostring(v14.messages), 
        v18, 
        v22, 
        (tostring(v16))
    });
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = v14.Size, 
        ref = v17, 
        [v1.Event.InputBegan] = function(_, v26)
            local v27 = true;
            if v26.UserInputType ~= Enum.UserInputType.MouseMovement then
                v27 = v26.UserInputType == Enum.UserInputType.Touch;
            end;
            if v27 then
                v21(true);
            end;
            if v26.UserInputType == Enum.UserInputType.Touch then
                v23(true);
            end;
        end, 
        [v1.Event.InputEnded] = function(_, v29)
            local v30 = true;
            if v29.UserInputType ~= Enum.UserInputType.MouseMovement then
                v30 = v29.UserInputType == Enum.UserInputType.Touch;
            end;
            if v30 then
                v21(false);
            end;
            if v29.UserInputType == Enum.UserInputType.Touch then
                v23(false);
            end;
        end
    }, {
        padding = v1.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 0), 
            PaddingBottom = UDim.new(0, 0), 
            PaddingLeft = UDim.new(0, 8), 
            PaddingRight = UDim.new(0, 8)
        }), 
        scrollView = v1.createElement(v2.ScrollView, {
            style = {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ScrollBarImageColor3 = l_Theme_0.UIEmphasis.Color, 
                ScrollBarImageTransparency = not v20 and 1 or 0, 
                ScrollBarThickness = 8
            }, 
            contentContainerStyle = {
                BackgroundTransparency = 1
            }, 
            Size = UDim2.fromScale(1, 1), 
            onScroll = function(v31)
                local l_v19_0 = v19;
                local l_AbsoluteWindowSize_1 = v31.AbsoluteWindowSize;
                local l_CanvasPosition_1 = v31.CanvasPosition;
                local l_AbsoluteCanvasSize_1 = v31.AbsoluteCanvasSize;
                l_v19_0(l_AbsoluteCanvasSize_1.Y <= l_AbsoluteWindowSize_1.Y or v4 <= l_CanvasPosition_1.Y / (l_AbsoluteCanvasSize_1 - l_AbsoluteWindowSize_1).Y);
            end
        }, v14.children)
    });
end;
