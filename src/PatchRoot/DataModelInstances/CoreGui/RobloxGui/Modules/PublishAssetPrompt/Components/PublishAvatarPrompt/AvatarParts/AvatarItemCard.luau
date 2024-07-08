local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = require(l_CorePackages_0.UIBlox).Core.Style.useStyle;
local v3 = require(script.Parent.AvatarPartViewport);
return function(v4)
    local v5 = l_useStyle_0();
    local l_Font_0 = v5.Font;
    local l_Theme_0 = v5.Theme;
    local l_asset_0 = v4.asset;
    local v9 = true;
    if typeof(l_asset_0) ~= "table" then
        v9 = l_asset_0:IsA("MeshPart") or l_asset_0:IsA("Accessory");
    end;
    assert(v9, "Assert that asset is a table, MeshPart, or Accessory");
    return v1.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        LayoutOrder = v4.LayoutOrder, 
        BackgroundTransparency = 1
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 5)
        }), 
        AvatarPartViewport = v1.createElement(v3, {
            asset = l_asset_0, 
            LayoutOrder = 1, 
            viewportSize = v4.viewportSize
        }), 
        TitleText = v4.titleText and v1.createElement("TextLabel", {
            LayoutOrder = 2, 
            BackgroundTransparency = 1, 
            Text = v4.titleText, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            Size = UDim2.new(1, 0, 0, 50), 
            TextColor3 = l_Theme_0.TextDefault.Color, 
            TextWrapped = true, 
            Font = l_Font_0.Header2.Font, 
            TextSize = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize, 
            TextTruncate = Enum.TextTruncate.AtEnd
        })
    });
end;
