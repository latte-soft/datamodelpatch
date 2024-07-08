local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsCarousel");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_t_0 = v1.t;
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_memoize_0 = v1.memoize;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_Interactable_0 = l_UIBlox_0.Core.Control.Interactable;
local l_ControlState_0 = l_UIBlox_0.Core.Control.Enum.ControlState;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_IconSize_0 = l_UIBlox_0.App.Constant.IconSize;
local l_Badge_0 = l_UIBlox_0.App.Indicator.Badge;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local v14 = require(l_script_FirstAncestor_0.Utils.getTextHeight);
local l_Colors_0 = require(l_script_FirstAncestor_0.Parent.Style).Colors;
local v16 = l_Images_0["icons/graphic/findfriends_large"];
local function _(v17, v18)
    return 1 - (1 - v17) / v18;
end;
local v20 = l_Roact_0.PureComponent:extend("AddFriendsTileSquare");
v20.defaultProps = {
    badgeValue = nil, 
    tileSize = 100, 
    labelText = ""
};
v20.validateProps = l_t_0.strictInterface({
    badgeValue = l_t_0.optional(l_t_0.union(l_t_0.string, l_t_0.integer)), 
    onActivated = l_t_0.callback, 
    tileSize = l_t_0.number, 
    labelText = l_t_0.string
});
v20.init = function(v21)
    v21.state = {};
    v21.onStateChanged = function(v22, v23, v24)
        local l_Transparency_0 = v23.Transparency;
        local l_Transparency_1 = v24.Transparency;
        if v22 == l_ControlState_0.Pressed then
            l_Transparency_0 = 1 - (1 - v23.Transparency) / 2;
            l_Transparency_1 = 1 - (1 - v24.Transparency) / 2;
        elseif v22 == l_ControlState_0.Hover then
            l_Transparency_0 = 1 - (1 - v23.Transparency) / 2;
            l_Transparency_1 = 1 - (1 - v24.Transparency) / 2;
        end;
        v21:setState({
            iconTransparency = l_Transparency_0, 
            backgroundTransparency = l_Transparency_1
        });
    end;
    v21.onStateChangedSetup = l_memoize_0(function(v27, v28)
        return function(_, v30)
            v21.onStateChanged(v30, v27, v28);
        end;
    end);
    v21.getTextHeight = l_memoize_0(function(v31, v32, v33)
        return v14(v31, v32, v33);
    end);
end;
v20.render = function(v34)
    local l_state_0 = v34.state;
    local l_props_0 = v34.props;
    local l_backgroundTransparency_0 = l_state_0.backgroundTransparency;
    local l_iconTransparency_0 = l_state_0.iconTransparency;
    return l_withStyle_0(function(v39)
        local l_Theme_0 = v39.Theme;
        local l_Font_0 = v39.Font;
        local l_IconEmphasis_0 = l_Theme_0.IconEmphasis;
        local l_BackgroundUIDefault_0 = l_Theme_0.BackgroundUIDefault;
        return l_Roact_0.createFragment({
            AddFriendsTileSquare = l_Roact_0.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromOffset(l_props_0.tileSize, 0), 
                BackgroundTransparency = 1
            }, {
                UIListLayout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 8)
                }), 
                AddFriendButton = l_Roact_0.createElement(l_Interactable_0, {
                    LayoutOrder = 1, 
                    Size = UDim2.fromOffset(l_props_0.tileSize, l_props_0.tileSize), 
                    BackgroundTransparency = 1, 
                    onStateChanged = v34.onStateChangedSetup(l_IconEmphasis_0, l_BackgroundUIDefault_0), 
                    [l_Roact_0.Event.Activated] = l_props_0.onActivated
                }, {
                    Background = l_Roact_0.createElement("Frame", {
                        Size = UDim2.fromScale(1, 1), 
                        BackgroundTransparency = l_backgroundTransparency_0, 
                        BackgroundColor3 = l_BackgroundUIDefault_0.Color
                    }, {
                        UICorner = l_Roact_0.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 8)
                        }), 
                        Icon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            BackgroundTransparency = 1, 
                            ImageTransparency = l_iconTransparency_0, 
                            ImageColor3 = l_Colors_0.White, 
                            Image = v16, 
                            Size = UDim2.fromOffset(l_IconSize_0.Large, l_IconSize_0.Large), 
                            Position = UDim2.fromScale(0.5, 0.5)
                        }), 
                        Badge = l_props_0.badgeValue and l_Roact_0.createElement(l_Badge_0, {
                            anchorPoint = Vector2.new(1, 0), 
                            position = UDim2.fromOffset(l_props_0.tileSize - 8, 8), 
                            value = l_props_0.badgeValue
                        })
                    })
                }), 
                AddFriendsLabel = l_Roact_0.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 2, 
                    text = l_props_0.labelText, 
                    fontStyle = l_Font_0.CaptionHeader, 
                    colorStyle = l_Theme_0.TextEmphasis, 
                    size = UDim2.fromOffset(l_props_0.tileSize, v34.getTextHeight(l_props_0.labelText, l_Font_0.CaptionHeader.Font, l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize) * 2), 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    textXAlignment = Enum.TextXAlignment.Center, 
                    textYAlignment = Enum.TextYAlignment.Top, 
                    fluidSizing = false, 
                    richText = false, 
                    lineHeight = 1
                })
            })
        });
    end);
end;
return v20;
