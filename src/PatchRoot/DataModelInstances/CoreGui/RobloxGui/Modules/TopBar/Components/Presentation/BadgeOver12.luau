local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_useStyle_0 = require(l_CorePackages_0.UIBlox).Core.Style.useStyle;
return function(v4)
    local v5 = l_useStyle_0();
    return v1.createElement("TextLabel", {
        AnchorPoint = Vector2.new(0, 1), 
        Position = v4.position, 
        Text = "12+", 
        Font = l_AppFonts_0.default:getMedium(), 
        TextSize = 9, 
        TextColor3 = v5.Theme.TextEmphasis.Color, 
        BackgroundColor3 = v5.Theme.BackgroundUIContrast.Color, 
        BackgroundTransparency = 0, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        LineHeight = 1.25, 
        ZIndex = 2
    }, {
        Padding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 2), 
            PaddingRight = UDim.new(0, 2)
        }), 
        Shape = v1.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        })
    });
end;
