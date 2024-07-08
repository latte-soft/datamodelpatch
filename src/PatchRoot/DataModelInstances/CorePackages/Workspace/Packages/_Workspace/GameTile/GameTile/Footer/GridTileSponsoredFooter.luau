local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameTile");
local v1 = require(l_script_FirstAncestor_0.Footer.GridTileIconTextFooter);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_SponsoredTooltipHover_0 = require(l_Parent_0.Ads).SponsoredTooltipHover;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_TooltipOrientation_0 = require(l_Parent_0.DiscoveryUiBloxApi).TooltipOrientation;
GridTileSponsoredFooter = function(v7)
    local v8 = l_useLocalization_0({
        sponsoredText = "Feature.GamePage.Label.Sponsored"
    });
    local v9 = not v7.useLargerFont and 20 or 24;
    return v3.createElement(v1, {
        iconElement = v3.createElement(l_SponsoredTooltipHover_0, {
            tooltipOrientation = l_TooltipOrientation_0.Bottom, 
            onActivateTooltip = v7.onActivateSponsoredTooltip, 
            size = UDim2.fromOffset(v9, v9), 
            position = UDim2.fromScale(0.5, 0.5), 
            anchorPoint = Vector2.new(0.5, 0.5)
        }), 
        text = v8.sponsoredText, 
        iconSize = not v7.useLargerFont and 20 or 24, 
        useLargerFont = v7.useLargerFont
    });
end;
return GridTileSponsoredFooter;
