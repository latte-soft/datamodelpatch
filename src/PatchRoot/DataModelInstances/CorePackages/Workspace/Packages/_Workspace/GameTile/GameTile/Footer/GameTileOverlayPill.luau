local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local v1 = require(l_Parent_0.React);
local l_ImageSetLabel_0 = require(l_Parent_0.DiscoveryUiBloxApi).ImageSetLabel;
local l_useDesignTokens_0 = require(l_Parent_0.DiscoveryStyleApi).useDesignTokens;
local l_Colors_0 = require(l_Parent_0.DiscoveryStyleApi).Colors;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
return function(v6)
    local v7 = l_useDesignTokens_0();
    local l_Space_50_0 = v7.Global.Space_50;
    local l_Space_100_0 = v7.Global.Space_100;
    local l_Space_150_0 = v7.Global.Space_150;
    local l_Space_300_0 = v7.Global.Space_300;
    if v6.icons then
        local v12 = 2 * l_Space_100_0 + (l_Space_150_0 + l_Space_50_0) * #v6.icons;
        local v13 = {
            Corner = v1.createElement("UICorner", {
                CornerRadius = UDim.new(0, l_Space_100_0)
            }), 
            Padding = v1.createElement("UIPadding", {
                PaddingRight = UDim.new(0, l_Space_100_0), 
                PaddingLeft = UDim.new(0, l_Space_100_0)
            }), 
            Layout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, l_Space_100_0)
            })
        };
        for v14, v15 in pairs(v6.icons) do
            v13["PillIcon" .. tostring(v14)] = v1.createElement(l_ImageSetLabel_0, {
                Size = UDim2.fromOffset(l_Space_150_0, l_Space_150_0), 
                SizeConstraint = Enum.SizeConstraint.RelativeYY, 
                BackgroundTransparency = 1, 
                LayoutOrder = v14, 
                Image = v15, 
                ImageColor3 = l_Colors_0.White, 
                ImageTransparency = 0, 
                ScaleType = Enum.ScaleType.Fit
            });
        end;
        return v1.createElement("Frame", {
            Size = UDim2.new(0, v12, 0, l_Space_300_0), 
            Position = v6.Position, 
            AnchorPoint = v6.AnchorPoint, 
            BackgroundTransparency = 0.2, 
            BackgroundColor3 = Color3.fromRGB(17, 18, 20)
        }, v13);
    else
        l_mutedError_0("Creating a gameTileOverlayPill without anything to display");
        return nil;
    end;
end;
