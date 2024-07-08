local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.DiscoveryStyleApi).useDesignTokens;
local l_ImageSetLabel_0 = require(l_Parent_0.DiscoveryUiBloxApi).ImageSetLabel;
local v5 = require(l_script_FirstAncestor_0.Footer.getGameTileMetadataFont);
local v6 = require(l_script_FirstAncestor_0.Flags.getFFlagLuaAppSponsoredGridTiles);
local l_GetUIBloxEnableFontNameMapping_0 = require(l_Parent_0.SharedFlags).UIBlox.GetUIBloxEnableFontNameMapping;
local v8 = require(l_script_FirstAncestor_0.Flags.FFlagLuaAppTextLabelHeightIsOffset);
return function(v9)
    local v10 = l_useDesignTokens_0();
    local l_Space_250_0 = v10.Global.Space_250;
    local l_Space_75_0 = v10.Global.Space_75;
    local l_Default_0 = v10.Semantic.Color.Text.Default;
    local v14 = v5(v9.useLargerFont, v10);
    local v15 = if not l_GetUIBloxEnableFontNameMapping_0() then v14.FontSize * 1.2 else v14.FontSize;
    local v16 = nil;
    local v17 = nil;
    if not v9.iconSize then
        v17 = v15;
        v16 = v15;
    else
        v17 = v9.iconSize;
        v16 = v10.Global.Size_250;
    end;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_Space_250_0), 
        Position = v9.Position, 
        ClipsDescendants = false, 
        BackgroundTransparency = 1
    }, {
        IconSlot = v2.createElement("Frame", {
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(v16, v16), 
            ClipsDescendants = false, 
            BackgroundTransparency = 1, 
            Position = UDim2.fromScale(0, 0.5), 
            AnchorPoint = Vector2.new(0, 0.5)
        }, {
            Icon = if not not v6() and v9.iconElement then v9.iconElement else v2.createElement(l_ImageSetLabel_0, {
                Image = v9.icon, 
                ImageColor3 = l_Default_0.Color3, 
                ImageTransparency = 0, 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromOffset(v17, v17), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1
            })
        }), 
        Text = v2.createElement("TextLabel", {
            LayoutOrder = 2, 
            Text = v9.text, 
            Size = UDim2.new(1, -(v16 + l_Space_75_0), if not v8 then v15 else 0, not v8 and 0 or v15), 
            Position = UDim2.new(0, v16 + l_Space_75_0, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            BackgroundTransparency = 1, 
            TextSize = v15, 
            Font = v14.Font, 
            TextTransparency = l_Default_0.Transparency, 
            TextColor3 = l_Default_0.Color3, 
            TextWrapped = false, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        })
    });
end;
