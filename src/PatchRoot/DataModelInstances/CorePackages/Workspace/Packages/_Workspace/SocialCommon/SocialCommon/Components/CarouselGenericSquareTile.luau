local l_Parent_0 = script:FindFirstAncestor("SocialCommon").Parent;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.Dash);
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_ImageSetButton_0 = v3.Core.ImageSet.ImageSetButton;
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_IconSize_0 = v3.App.Constant.IconSize;
local l_Badge_0 = v3.App.Indicator.Badge;
local l_Colors_0 = v3.App.Style.Colors;
local l_useImpressionsTagger_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).useImpressionsTagger;
local v14 = {
    badgeValue = nil, 
    icon = "", 
    labelText = "", 
    onActivated = function()
    end, 
    tileSize = 100, 
    iconSize = l_IconSize_0.Large, 
    borderThickness = 0, 
    cornerRadius = UDim.new(0, 8), 
    styleProps = {
        textXAlignment = Enum.TextXAlignment.Center, 
        containFooterInTileSize = false
    }
};
return function(v15)
    local v16 = v4.join(v14, v15 or {});
    local v17 = l_useStyle_0();
    local l_Font_0 = v17.Font;
    local l_styleProps_0 = v16.styleProps;
    local v20 = if not l_styleProps_0.font then l_Font_0.CaptionHeader else l_styleProps_0.font;
    local v21 = l_Text_0.GetTextHeight(v16.labelText, v20.Font, l_Font_0.BaseSize * v20.RelativeSize);
    local v22 = v16.tileSize - v16.borderThickness;
    local l_v22_0 = v22;
    if v16.styleProps.containFooterInTileSize then
        l_v22_0 = (v22 - v21 * 2) - 8;
    end;
    local v24 = nil;
    if v16.impressionsTag then
        v24 = v2.useRef(nil);
        l_useImpressionsTagger_0(v24, v16.impressionsTag, v16.LayoutOrder);
    end;
    return v2.createElement("Frame", {
        LayoutOrder = v16.LayoutOrder, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromOffset(l_v22_0, 0), 
        BackgroundTransparency = 1, 
        ref = v24
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v16.borderThickness)
        }), 
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 8)
        }), 
        Tile = v2.createElement(l_ImageSetButton_0, {
            Size = UDim2.fromOffset(l_v22_0, l_v22_0), 
            BackgroundColor3 = v17.Theme.BackgroundUIDefault.Color, 
            BackgroundTransparency = v17.Theme.BackgroundUIDefault.Transparency, 
            [v2.Event.Activated] = v16.onActivated, 
            LayoutOrder = 1
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = v16.cornerRadius
            }), 
            UIStroke = v2.createElement("UIStroke", {
                Color = v17.Theme.Divider.Color, 
                Transparency = v17.Theme.Divider.Transparency, 
                Thickness = v16.borderThickness
            }), 
            Icon = v2.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                ImageTransparency = v17.Theme.IconEmphasis.Transparency, 
                ImageColor3 = l_Colors_0.White, 
                Image = v16.icon, 
                Size = UDim2.fromOffset(v16.iconSize, v16.iconSize), 
                Position = UDim2.fromScale(0.5, 0.5)
            }), 
            Badge = v16.badgeValue and v2.createElement(l_Badge_0, {
                anchorPoint = Vector2.new(1, 0), 
                position = UDim2.fromOffset(v16.tileSize - 8, 8), 
                value = v16.badgeValue
            })
        }), 
        Label = v2.createElement(l_ImageSetButton_0, {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            [v2.Event.Activated] = v16.onActivated, 
            LayoutOrder = 2
        }, {
            Text = v2.createElement(l_StyledTextLabel_0, {
                text = v16.labelText, 
                fontStyle = v20, 
                colorStyle = v17.Theme.TextEmphasis, 
                size = UDim2.fromOffset(l_v22_0, v21 * 2), 
                textTruncate = Enum.TextTruncate.AtEnd, 
                textXAlignment = l_styleProps_0.textXAlignment, 
                textYAlignment = Enum.TextYAlignment.Top, 
                fluidSizing = false, 
                richText = false, 
                lineHeight = 1
            })
        })
    });
end;
