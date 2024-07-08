local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v4.Core.Style.withStyle;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local v7 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.RobloxTranslator);
local v8 = v2.PureComponent:extend("MenuCell");
v8.validateProps = v3.strictInterface({
    layoutOrder = v3.integer, 
    icon = v3.optional(v3.union(v3.table, v3.string)), 
    iconComponent = v3.optional(v3.table), 
    localizationKey = v3.string, 
    height = v3.numberPositive, 
    hasDivider = v3.boolean, 
    isSelected = v3.boolean
});
v8.render = function(v9)
    return l_withStyle_0(function(v10)
        local l_Theme_0 = v10.Theme;
        local l_Font_0 = v10.Font;
        local v13 = v7:FormatByKey(v9.props.localizationKey);
        local l_createElement_0 = v2.createElement;
        local v15 = "Frame";
        local v16 = {
            LayoutOrder = v9.props.layoutOrder, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v9.props.height)
        };
        local v17 = {
            SelectedFrame = v9.props.isSelected and v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 4, 1, 4), 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5)
            }, {
                TopBorder = v2.createElement("Frame", {
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 2), 
                    BackgroundTransparency = l_Theme_0.SystemPrimaryOnHover.Transparency, 
                    BackgroundColor3 = l_Theme_0.SystemPrimaryOnHover.Color
                }), 
                LeftBorder = v2.createElement("Frame", {
                    BorderSizePixel = 0, 
                    Size = UDim2.new(0, 2, 1, 0), 
                    BackgroundTransparency = l_Theme_0.SystemPrimaryOnHover.Transparency, 
                    BackgroundColor3 = l_Theme_0.SystemPrimaryOnHover.Color
                }), 
                RightBorder = v2.createElement("Frame", {
                    BorderSizePixel = 0, 
                    Size = UDim2.new(0, 2, 1, 0), 
                    Position = UDim2.fromScale(1, 0), 
                    AnchorPoint = Vector2.new(1, 0), 
                    BackgroundTransparency = l_Theme_0.SystemPrimaryOnHover.Transparency, 
                    BackgroundColor3 = l_Theme_0.SystemPrimaryOnHover.Color
                }), 
                BottomBorder = v2.createElement("Frame", {
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 2), 
                    Position = UDim2.fromScale(0, 1), 
                    AnchorPoint = Vector2.new(0, 1), 
                    BackgroundTransparency = l_Theme_0.SystemPrimaryOnHover.Transparency, 
                    BackgroundColor3 = l_Theme_0.SystemPrimaryOnHover.Color
                })
            })
        };
        local l_createElement_1 = v2.createElement;
        local v19 = "Frame";
        local v20 = {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1)
        };
        local v21 = {
            Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 12)
            }), 
            Padding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 12), 
                PaddingRight = UDim.new(0, 12)
            })
        };
        local l_createElement_2 = v2.createElement;
        local v23 = "Frame";
        local v24 = {
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(36, 36)
        };
        local v25 = {};
        local v26 = false;
        if v9.props.icon ~= nil then
            v26 = v2.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = v9.props.icon, 
                Size = UDim2.fromScale(1, 1), 
                ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                ImageColor3 = l_Theme_0.IconEmphasis.Color
            });
        end;
        v25.IconLabel = v26;
        v26 = false;
        if v9.props.iconComponent ~= nil then
            v26 = v2.createElement(v9.props.iconComponent);
        end;
        v25.IconComponent = v26;
        v21.IconFrame = l_createElement_2(v23, v24, v25);
        v21.Text = v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Size = UDim2.new(1, -48, 1, 0), 
            Text = v13, 
            Font = l_Font_0.Header2.Font, 
            TextSize = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            TextTransparency = l_Theme_0.TextEmphasis.TextTransparency, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextTruncate = Enum.TextTruncate.AtEnd
        });
        v17.CellContents = l_createElement_1(v19, v20, v21);
        v17.Divider = v9.props.hasDivider and v2.createElement("Frame", {
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 1), 
            Position = UDim2.fromScale(0, 1), 
            AnchorPoint = Vector2.new(0, 1), 
            BackgroundTransparency = l_Theme_0.Divider.Transparency, 
            BackgroundColor3 = l_Theme_0.Divider.Color
        });
        return l_createElement_0(v15, v16, v17);
    end);
end;
return v8;
