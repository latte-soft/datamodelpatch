local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local v2 = require(l_script_FirstAncestor_0.Flags.getFFlagDeprecatedSocialLibrariesCells);
local l_Roact_0 = v1.Roact;
local l_ImageSetLabel_0 = v1.UIBlox.Core.ImageSet.ImageSetLabel;
local v5 = require(script.Parent.BaseCell);
local v6 = l_Roact_0.PureComponent:extend("IconWithTextCell");
v6.defaultProps = {
    Text = "titleText", 
    primaryIcon = nil, 
    primaryIconSize = 32, 
    onPrimaryIconActivated = nil, 
    Size = UDim2.new(1, 0, 1, 0), 
    onActivated = function()
        print("IconWithTextCell onActivated");
    end, 
    secondaryIcon = "", 
    secondaryIconSize = 24, 
    iconCellWidth = 60, 
    LayoutOrder = 0, 
    style = require(script:FindFirstAncestor("Components").Style.TestStyle), 
    showDivider = true
};
v6.init = function(_)
    assert(not v2(), "social-libraries Cells are deprecated, please use Cell components from app-chat rotriever package");
end;
v6.render = function(v8)
    local l_style_0 = v8.props.style;
    local l_Theme_0 = l_style_0.Theme;
    local l_Font_0 = l_style_0.Font;
    return l_Roact_0.createElement(v5, {
        Size = v8.props.Size, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
        onPressedBackgroundColor3 = l_Theme_0.BackgroundOnPress.Color, 
        onPressedBackgroundTransparency = l_Theme_0.BackgroundOnPress.Transparency, 
        LayoutOrder = v8.props.LayoutOrder, 
        onActivated = v8.props.onActivated, 
        showDivider = v8.props.showDivider, 
        dividerColor3 = l_Theme_0.Divider.Color, 
        dividerTransparency = l_Theme_0.Divider.Transparency
    }, {
        leftFrame = l_Roact_0.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.fromScale(0, 0.5), 
            Size = UDim2.new(1, -v8.props.iconCellWidth, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            leftListLayout = l_Roact_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            imageFrame = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(0, v8.props.iconCellWidth, 0, v8.props.primaryIconSize), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                primaryIcon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    Position = UDim2.fromScale(0.5, 0.5), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Image = v8.props.primaryIcon, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(0, v8.props.primaryIconSize, 0, v8.props.primaryIconSize), 
                    ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                    BackgroundTransparency = 1
                })
            }), 
            text = l_Roact_0.createElement("TextLabel", {
                Size = UDim2.new(1, -v8.props.iconCellWidth, 1, 0), 
                Text = v8.props.Text, 
                TextSize = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize, 
                Font = l_Font_0.Header2.Font, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            })
        }), 
        rightFrame = l_Roact_0.createElement("Frame", {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.fromScale(1, 0.5), 
            Size = UDim2.fromOffset(v8.props.iconCellWidth, v8.props.iconCellWidth), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            secondaryIcon = v8.props.secondaryIcon and l_Roact_0.createElement("ImageLabel", {
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = v8.props.secondaryIcon, 
                BackgroundTransparency = 1, 
                Size = UDim2.fromOffset(v8.props.secondaryIconSize, v8.props.secondaryIconSize)
            })
        })
    });
end;
return v6;
