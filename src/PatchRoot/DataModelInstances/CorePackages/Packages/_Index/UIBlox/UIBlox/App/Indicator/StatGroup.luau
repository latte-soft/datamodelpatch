local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Core_0 = l_Parent_1.Core;
local v3 = require(l_Parent_1.Parent.React);
local v4 = require(l_Parent_0.ImageSet.Images);
local v5 = require(l_Core_0.ImageSet.ImageSetComponent);
local v6 = require(l_Core_0.Style.useStyle);
local _ = require(l_Parent_0.Style.Fonts);
local v8 = require(l_Parent_1.Core.Text.GetTextSize);
local v9 = require(l_Parent_1.UIBloxConfig);
local v10 = not v9.enableFontNameMapping and 40 or 48;
local function v22(v11, v12, v13, v14, v15)
    local l_Tokens_0 = v14.Tokens;
    local l_Font_0 = v14.Font;
    local l_Space_25_0 = l_Tokens_0.Global.Space_25;
    local l_Small_0 = l_Tokens_0.Semantic.Icon.Size.Small;
    local l_Muted_0 = l_Tokens_0.Semantic.Color.Text.Muted;
    local l_Muted_1 = l_Tokens_0.Semantic.Color.Text.Muted;
    return v3.createElement("Frame", v11, {
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, l_Space_25_0)
        }), 
        Icon = v3.createElement(v5.Label, {
            Size = UDim2.fromOffset(l_Small_0, l_Small_0), 
            Image = v4[v12], 
            BackgroundTransparency = 1, 
            ImageTransparency = l_Muted_0.Transparency, 
            ImageColor3 = l_Muted_0.Color3, 
            LayoutOrder = 1, 
            AnchorPoint = Vector2.new(0, 0.5)
        }), 
        Label = v3.createElement("TextLabel", {
            Size = UDim2.new(0, v15 or 0, not v9.useAutomaticSizeYInStatGroup and 1 or 0, 0), 
            AutomaticSize = if not v15 then if v9.useAutomaticSizeYInStatGroup then Enum.AutomaticSize.XY else Enum.AutomaticSize.X else if v9.useAutomaticSizeYInStatGroup then Enum.AutomaticSize.Y else nil, 
            BackgroundTransparency = 1, 
            Text = v13, 
            Font = l_Font_0.Body.Font, 
            TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextTruncate = if not v9.enableFontNameMapping then nil else Enum.TextTruncate.AtEnd, 
            TextWrapped = if not v9.enableFontNameMapping then nil else false, 
            TextColor3 = l_Muted_1.Color3, 
            TextTransparency = l_Muted_1.Transparency, 
            LayoutOrder = 2
        }, {
            UISizeConstraint = v3.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(v10, math.huge)
            })
        })
    });
end;
local function _(v23, v24)
    return (v3.useMemo(function()
        return v8(v23, v24.BaseSize * v24.Body.RelativeSize, v24.Body.Font, Vector2.new(v10, math.huge)).X;
    end, {
        v23, 
        v24
    }));
end;
return function(v26)
    local v27 = v6();
    local l_Space_100_0 = v27.Tokens.Global.Space_100;
    local l_ratingText_0 = v26.ratingText;
    local l_Font_1 = v27.Font;
    local l_l_ratingText_0_0 = l_ratingText_0 --[[ copy: 4 -> 7 ]];
    local l_l_Font_1_0 = l_Font_1 --[[ copy: 5 -> 8 ]];
    local v33 = v3.useMemo(function()
        return v8(l_l_ratingText_0_0, l_l_Font_1_0.BaseSize * l_l_Font_1_0.Body.RelativeSize, l_l_Font_1_0.Body.Font, Vector2.new(v10, math.huge)).X;
    end, {
        l_ratingText_0, 
        l_Font_1
    });
    if not v26.playingText then
        l_ratingText_0 = nil;
    else
        l_Font_1 = v26.playingText;
        local l_Font_2 = v27.Font;
        l_ratingText_0 = v3.useMemo(function()
            return v8(l_Font_1, l_Font_2.BaseSize * l_Font_2.Body.RelativeSize, l_Font_2.Body.Font, Vector2.new(v10, math.huge)).X;
        end, {
            l_Font_1, 
            l_Font_2
        });
    end;
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, l_Space_100_0)
        }), 
        RatingStats = v22({
            Size = UDim2.new(0, 0, not v9.useAutomaticSizeYInStatGroup and 1 or 0, 0), 
            AutomaticSize = if not v9.useAutomaticSizeYInStatGroup then Enum.AutomaticSize.X else Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, "icons/status/games/rating_small", v26.ratingText, v27, v33), 
        PlayingStats = if v26.playingText ~= nil then v22({
            Size = UDim2.new(0, 0, not v9.useAutomaticSizeYInStatGroup and 1 or 0, 0), 
            AutomaticSize = if not v9.useAutomaticSizeYInStatGroup then Enum.AutomaticSize.X else Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, "icons/status/games/people-playing_small", v26.playingText, v27, l_ratingText_0) else nil
    });
end;
