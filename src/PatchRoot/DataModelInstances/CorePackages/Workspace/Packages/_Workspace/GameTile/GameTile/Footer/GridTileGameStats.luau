local l_TextService_0 = game:GetService("TextService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.DiscoveryStyleApi).useDesignTokens;
local v5 = require(l_Parent_0.DiscoveryUiBloxApi);
local l_Images_0 = v5.Images;
local l_ImageSetLabel_0 = v5.ImageSetLabel;
local l_GetUIBloxEnableFontNameMapping_0 = require(l_Parent_0.SharedFlags).UIBlox.GetUIBloxEnableFontNameMapping;
local v9 = require(l_script_FirstAncestor_0.Footer.getGameTileMetadataFont);
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagLuaAppTextLabelHeightIsOffset);
local v11 = l_Images_0["icons/status/games/rating_small"];
local v12 = l_Images_0["icons/status/games/people-playing_small"];
local v13 = Vector2.new(math.huge, math.huge);
return function(v14)
    local v15 = l_useDesignTokens_0();
    local l_Space_250_0 = v15.Global.Space_250;
    local l_Space_50_0 = v15.Global.Space_50;
    local l_Space_100_0 = v15.Global.Space_100;
    local l_Default_0 = v15.Semantic.Color.Text.Default;
    local v20 = v9(v14.useLargerFont, v15);
    local v21 = if not l_GetUIBloxEnableFontNameMapping_0() then v20.FontSize * 1.2 else v20.FontSize;
    local l_Font_0 = v20.Font;
    local l_ratingText_0 = v14.ratingText;
    local v24 = v3.useMemo(function()
        if not (l_ratingText_0 ~= nil) or l_ratingText_0 == "" then
            return 0;
        else
            return l_TextService_0:GetTextSize(l_ratingText_0, v21, l_Font_0, v13).X;
        end;
    end, {
        l_ratingText_0, 
        v21, 
        l_Font_0
    });
    local v25 = ((v21 + l_Space_50_0) + v24) + l_Space_100_0;
    local v26 = UDim.new(1, -((v25 + l_Space_50_0) + v21));
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_Space_250_0), 
        Position = v14.Position, 
        ClipsDescendants = false, 
        BackgroundTransparency = 1
    }, {
        RatingIconSlot = v3.createElement("Frame", {
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(v21, v21), 
            ClipsDescendants = false, 
            BackgroundTransparency = 1, 
            Position = UDim2.fromScale(0, 0.5), 
            AnchorPoint = Vector2.new(0, 0.5)
        }, {
            Icon = v3.createElement(l_ImageSetLabel_0, {
                Image = v11, 
                ImageColor3 = l_Default_0.Color3, 
                ImageTransparency = 0, 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromOffset(v21, v21), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1
            })
        }), 
        RatingText = v3.createElement("TextLabel", {
            LayoutOrder = 2, 
            Text = l_ratingText_0, 
            Size = UDim2.new(0, v24 + l_Space_50_0, if not v10 then v21 else 0, not v10 and 0 or v21), 
            Position = UDim2.new(0, v21 + l_Space_50_0, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            BackgroundTransparency = 1, 
            TextSize = v21, 
            Font = v20.Font, 
            TextTransparency = l_Default_0.Transparency, 
            TextColor3 = l_Default_0.Color3, 
            TextWrapped = false, 
            TextTruncate = Enum.TextTruncate.None, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        }), 
        PlayerCountIconSlot = v3.createElement("Frame", {
            Position = UDim2.new(0, v25, 0.5, 0), 
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(v21, v21), 
            ClipsDescendants = false, 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0, 0.5)
        }, {
            Icon = v3.createElement(l_ImageSetLabel_0, {
                Image = v12, 
                ImageColor3 = l_Default_0.Color3, 
                ImageTransparency = 0, 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromOffset(v21, v21), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1
            })
        }), 
        PlayerCountText = v3.createElement("TextLabel", {
            LayoutOrder = 2, 
            Text = v14.playerCountText, 
            Size = if not l_GetUIBloxEnableFontNameMapping_0() then UDim2.new(v26, UDim.new(0, v20.FontSize * 1.2)) else UDim2.new(v26, UDim.new(0, v20.FontSize)), 
            Position = UDim2.new(0, (v25 + v21) + l_Space_50_0, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            BackgroundTransparency = 1, 
            TextSize = if not l_GetUIBloxEnableFontNameMapping_0() then v20.FontSize * 1.2 else v20.FontSize, 
            Font = v20.Font, 
            TextTransparency = l_Default_0.Transparency, 
            TextColor3 = l_Default_0.Color3, 
            TextWrapped = false, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        })
    });
end;
