local v0 = require(script:FindFirstAncestor("SocialLibraries").dependencies);
local l_RoactFitComponents_0 = v0.RoactFitComponents;
local l_FitFrameOnAxis_0 = l_RoactFitComponents_0.FitFrameOnAxis;
local l_Roact_0 = v0.Roact;
local l_UIBlox_0 = v0.UIBlox;
local v5 = Rect.new(10, 10, 11, 11);
local v6 = l_Roact_0.PureComponent:extend("ChatBubbleContainer");
v6.TAIL_WIDTH = 6;
v6.defaultProps = {
    isIncoming = false, 
    hasTail = false, 
    padding = 12, 
    LayoutOrder = 0, 
    isPending = false, 
    [l_Roact_0.Change.AbsoluteSize] = function()
    end, 
    overrideImageColor = false
};
v6.init = function(v7)
    local v8, v9 = l_Roact_0.createBinding(Vector2.new(0, 0));
    v7.bubbleSize = v8;
    v7.updateBubbleSize = v9;
end;
v6.render = function(v10)
    return l_UIBlox_0.Style.withStyle(function(v11)
        local v12 = v10.props[l_Roact_0.Children] or {};
        local l_hasTail_0 = v10.props.hasTail;
        local l_isIncoming_0 = v10.props.isIncoming;
        local l_isPending_0 = v10.props.isPending;
        local v16 = nil;
        v16 = if not l_isIncoming_0 then if l_isPending_0 then v11.Theme.UIMuted else v11.Theme.UIEmphasis else v11.Theme.UIDefault;
        local l_Color_0 = v16.Color;
        local l_Transparency_0 = v16.Transparency;
        if v10.props.overrideImageColor then
            l_Color_0 = nil;
            if not l_isPending_0 then
                l_Transparency_0 = nil;
            end;
        end;
        local v19 = "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-self2.png";
        if l_hasTail_0 then
            v19 = not l_isIncoming_0 and "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-self.png" or "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble.png";
        end;
        return l_Roact_0.createElement("Frame", {
            Size = v10.bubbleSize:map(function(v20)
                return UDim2.new(0, v20.X + v10.TAIL_WIDTH, 0, v20.Y);
            end), 
            LayoutOrder = v10.props.LayoutOrder, 
            BackgroundTransparency = 1
        }, {
            bubble = l_Roact_0.createElement(l_FitFrameOnAxis_0, {
                AnchorPoint = not not l_isIncoming_0 and Vector2.new(0, 0) or Vector2.new(1, 0), 
                axis = l_FitFrameOnAxis_0.Axis.Both, 
                BackgroundTransparency = 1, 
                ImageColor3 = l_Color_0, 
                ImageSet = {
                    Image = v19, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = v5
                }, 
                ImageTransparency = l_Transparency_0, 
                margin = l_RoactFitComponents_0.Rect.square(v10.props.padding), 
                Position = not not l_isIncoming_0 and UDim2.new(0, v10.TAIL_WIDTH, 0, 0) or UDim2.new(1, -v10.TAIL_WIDTH, 0, 0), 
                [l_Roact_0.Change.AbsoluteSize] = function(v21)
                    v10.updateBubbleSize(v21.AbsoluteSize);
                    v10.props[l_Roact_0.Change.AbsoluteSize](v21);
                end
            }, v12), 
            tail = l_Roact_0.createElement("ImageLabel", {
                AnchorPoint = not not l_isIncoming_0 and Vector2.new(0, 0) or Vector2.new(1, 0), 
                Size = UDim2.new(0, v10.TAIL_WIDTH, 0, v10.TAIL_WIDTH), 
                BackgroundTransparency = 1, 
                ImageColor3 = l_Color_0, 
                Position = not not l_isIncoming_0 and UDim2.new(0, 0, 0, 0) or UDim2.new(1, 0, 0, 0), 
                Image = not l_isIncoming_0 and "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-self-tip.png" or "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-tip.png", 
                ImageTransparency = l_Transparency_0, 
                Visible = l_hasTail_0
            })
        });
    end);
end;
return v6;
