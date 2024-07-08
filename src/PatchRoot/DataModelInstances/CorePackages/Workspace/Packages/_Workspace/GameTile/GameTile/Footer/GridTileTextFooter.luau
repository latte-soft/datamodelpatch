local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.DiscoveryStyleApi).useDesignTokens;
local v4 = require(l_script_FirstAncestor_0.Footer.getGameTileMetadataFont);
local l_GetUIBloxEnableFontNameMapping_0 = require(l_Parent_0.SharedFlags).UIBlox.GetUIBloxEnableFontNameMapping;
local v6 = require(l_script_FirstAncestor_0.Flags.FFlagLuaAppTextLabelHeightIsOffset);
return function(v7)
    local v8 = l_useDesignTokens_0();
    local l_Space_250_0 = v8.Global.Space_250;
    local l_Default_0 = v8.Semantic.Color.Text.Default;
    local v11 = v4(v7.useLargerFont, v8);
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_Space_250_0), 
        Position = v7.Position, 
        ClipsDescendants = false, 
        BackgroundTransparency = 1
    }, {
        Text = v2.createElement("TextLabel", {
            Text = v7.text, 
            Size = if not l_GetUIBloxEnableFontNameMapping_0() then UDim2.new(1, 0, if not v6 then v11.FontSize * 1.2 else 0, not v6 and 0 or v11.FontSize * 1.2) else UDim2.new(1, 0, if not v6 then v11.FontSize else 0, not v6 and 0 or v11.FontSize), 
            Position = UDim2.new(0, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            BackgroundTransparency = 1, 
            TextSize = if not l_GetUIBloxEnableFontNameMapping_0() then v11.FontSize * 1.2 else v11.FontSize, 
            Font = v11.Font, 
            TextTransparency = l_Default_0.Transparency, 
            TextColor3 = l_Default_0.Color3, 
            TextWrapped = false, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        })
    });
end;
