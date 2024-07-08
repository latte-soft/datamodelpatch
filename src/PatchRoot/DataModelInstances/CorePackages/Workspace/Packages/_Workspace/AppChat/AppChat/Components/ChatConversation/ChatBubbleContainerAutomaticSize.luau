local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local l_useStyle_0 = v3.Core.Style.useStyle;
local v6 = require(l_Parent_0.Cryo);
local l_Constants_0 = v3.App.Style.Constants;
local l_useSelectedTheme_0 = require(l_Parent_0.RoactUtils).Hooks.useSelectedTheme;
local v9 = Rect.new(10, 10, 11, 11);
local v10 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableUnfilteredThreadsUI);
local v11 = require(l_script_FirstAncestor_0.Flags.unfilteredMessageColorConfig);
local v13 = {
    isIncoming = false, 
    hasTail = false, 
    padding = 12, 
    LayoutOrder = 0, 
    isPending = false, 
    [v2.Change.AbsoluteSize] = function(_)
    end
};
return function(v14)
    local v15 = v6.Dictionary.join(v13, v14);
    local v16, v17 = v2.useState(0);
    local v18 = v15[v2.Change.AbsoluteSize];
    local v19 = l_useStyle_0();
    local v20 = v15.children or {};
    local l_hasTail_0 = v15.hasTail;
    local l_isIncoming_0 = v15.isIncoming;
    local l_isPending_0 = v15.isPending;
    local l_isUnfiltered_0 = v15.isUnfiltered;
    local v25 = if not v10() then nil else l_useSelectedTheme_0();
    local v26 = nil;
    v26 = if not l_isIncoming_0 then if l_isPending_0 then v19.Theme.UIMuted else if v10() and l_isUnfiltered_0 then {
        Color = if v25 == l_Constants_0.ThemeName.Light then v11.UnfilteredMessageLightColor3 else v11.UnfilteredMessageDarkColor3, 
        Transparency = v11.UnfilteredMessageTransparency
    } else v19.Theme.UIEmphasis else v19.Theme.UIDefault;
    local l_Color_0 = v26.Color;
    local l_Transparency_0 = v26.Transparency;
    local v29 = "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-self2.png";
    if l_hasTail_0 then
        v29 = not l_isIncoming_0 and "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-self.png" or "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble.png";
    end;
    local v30 = not not l_isIncoming_0 and UDim2.new(0, 6, 0, 0) or UDim2.new(1, -6, 0, 0);
    local v31 = not l_isIncoming_0 and "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-self-tip.png" or "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-tip.png";
    local v32 = not not l_isIncoming_0 and UDim2.new(0, 0, 0, 0) or UDim2.new(1, 0, 0, 0);
    local v33 = UDim.new(0, v15.padding or v13.padding);
    return v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.new(0, v16 + 6, 0, 0), 
        LayoutOrder = v15.LayoutOrder or v13.LayoutOrder, 
        BackgroundTransparency = 1
    }, {
        bubble = v2.createElement("ImageLabel", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Size = UDim2.new(0, v16, 0, 0), 
            AnchorPoint = not not l_isIncoming_0 and Vector2.new(0, 0) or Vector2.new(1, 0), 
            BackgroundTransparency = 1, 
            ImageColor3 = l_Color_0, 
            Image = v29, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v9, 
            ImageTransparency = l_Transparency_0, 
            Position = v30, 
            [v2.Change.AbsoluteSize] = function(v34)
                v18(v34);
            end
        }, l_Object_0.assign(table.clone(v20), {
            ["$margin"] = v2.createElement("UIPadding", {
                PaddingBottom = v33, 
                PaddingTop = v33, 
                PaddingRight = v33, 
                PaddingLeft = v33
            }), 
            ["$layout"] = v2.createElement("UIListLayout", {
                [v2.Change.AbsoluteContentSize] = function(v35)
                    v17(v35.AbsoluteContentSize.X + v33.Offset * 2);
                end
            })
        })), 
        tail = v2.createElement("ImageLabel", {
            AnchorPoint = not not l_isIncoming_0 and Vector2.new(0, 0) or Vector2.new(1, 0), 
            Size = UDim2.new(0, 6, 0, 6), 
            BackgroundTransparency = 1, 
            ImageColor3 = l_Color_0, 
            Position = v32, 
            Image = v31, 
            ImageTransparency = l_Transparency_0, 
            Visible = l_hasTail_0
        })
    });
end;
