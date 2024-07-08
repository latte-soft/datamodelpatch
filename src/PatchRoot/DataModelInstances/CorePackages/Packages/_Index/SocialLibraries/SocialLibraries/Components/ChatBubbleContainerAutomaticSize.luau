local v0 = require(script:FindFirstAncestor("SocialLibraries").dependencies);
local l_React_0 = v0.React;
local l_UIBlox_0 = v0.UIBlox;
local l_Object_0 = v0.LuauPolyfill.Object;
local v4 = Rect.new(10, 10, 11, 11);
local v6 = {
    isIncoming = false, 
    hasTail = false, 
    padding = 12, 
    LayoutOrder = 0, 
    isPending = false, 
    [l_React_0.Change.AbsoluteSize] = function(_)
    end, 
    overrideImageColor = false
};
return function(v7)
    local v8, v9 = l_React_0.useState(0);
    local v10 = v7[l_React_0.Change.AbsoluteSize] or v6[l_React_0.Change.AbsoluteSize];
    return l_UIBlox_0.Style.withStyle(function(v11)
        local v12 = v7.children or {};
        local v13 = v7.hasTail or v6.hasTail;
        local v14 = v7.isIncoming or v6.isIncoming;
        local v15 = v7.isPending or v6.isPending;
        local v16 = nil;
        v16 = if not v14 then if v15 then v11.Theme.UIMuted else v11.Theme.UIEmphasis else v11.Theme.UIDefault;
        local l_Color_0 = v16.Color;
        local l_Transparency_0 = v16.Transparency;
        if not (not v7.overrideImageColor and not v6.overrideImageColor) then
            l_Color_0 = nil;
            if not v15 then
                l_Transparency_0 = nil;
            end;
        end;
        local v19 = "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-self2.png";
        if v13 then
            v19 = not v14 and "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-self.png" or "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble.png";
        end;
        local v20 = not not v14 and UDim2.new(0, 6, 0, 0) or UDim2.new(1, -6, 0, 0);
        local v21 = not v14 and "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-self-tip.png" or "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-tip.png";
        local v22 = not not v14 and UDim2.new(0, 0, 0, 0) or UDim2.new(1, 0, 0, 0);
        local v23 = UDim.new(0, v7.padding or v6.padding);
        return l_React_0.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Size = UDim2.new(0, v8 + 6, 0, 0), 
            LayoutOrder = v7.LayoutOrder or v6.LayoutOrder, 
            BackgroundTransparency = 1
        }, {
            bubble = l_React_0.createElement("ImageLabel", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Size = UDim2.new(0, v8, 0, 0), 
                AnchorPoint = not not v14 and Vector2.new(0, 0) or Vector2.new(1, 0), 
                BackgroundTransparency = 1, 
                ImageColor3 = l_Color_0, 
                Image = v19, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v4, 
                ImageTransparency = l_Transparency_0, 
                Position = v20, 
                [l_React_0.Change.AbsoluteSize] = function(v24)
                    v10(v24);
                end
            }, l_Object_0.assign(table.clone(v12), {
                ["$margin"] = l_React_0.createElement("UIPadding", {
                    PaddingBottom = v23, 
                    PaddingTop = v23, 
                    PaddingRight = v23, 
                    PaddingLeft = v23
                }), 
                ["$layout"] = l_React_0.createElement("UIListLayout", {
                    [l_React_0.Change.AbsoluteContentSize] = function(v25)
                        v9(v25.AbsoluteContentSize.X + v23.Offset * 2);
                    end
                })
            })), 
            tail = l_React_0.createElement("ImageLabel", {
                AnchorPoint = not not v14 and Vector2.new(0, 0) or Vector2.new(1, 0), 
                Size = UDim2.new(0, 6, 0, 6), 
                BackgroundTransparency = 1, 
                ImageColor3 = l_Color_0, 
                Position = v22, 
                Image = v21, 
                ImageTransparency = l_Transparency_0, 
                Visible = v13
            })
        });
    end);
end;
