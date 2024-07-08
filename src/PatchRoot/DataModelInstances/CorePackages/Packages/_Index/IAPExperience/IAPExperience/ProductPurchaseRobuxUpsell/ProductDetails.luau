local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local _ = require(l_Parent_1.t);
local v4 = require(l_Parent_1.RoactFitComponents);
local l_FitFrameVertical_0 = v4.FitFrameVertical;
local l_FitTextLabel_0 = v4.FitTextLabel;
local v7 = require(l_Parent_1.UIBlox);
local l_Images_0 = v7.App.ImageSet.Images;
local l_ImageSetLabel_0 = v7.Core.ImageSet.ImageSetLabel;
local l_IconSize_0 = v7.App.Constant.IconSize;
local l_withStyle_0 = v7.Core.Style.withStyle;
local v12 = require(l_Parent_0.Generic.HumanoidViewport);
local v13 = require(l_Parent_0.Generic.Constants);
local v14 = require(l_Parent_0.Flags.getEnableCondenseRobuxUpsell);
local v15 = require(l_Parent_0.Flags.getEnableHumanoidViewportItemIcon);
local v16 = l_Images_0["icons/common/robux"];
local v17 = l_Images_0["icons/status/imageunavailable"];
local v18 = v2.Component:extend(script.Name);
v18.init = function(v19)
    v19.contentRef = v2.createRef();
    v19.state = {
        contentSize = Vector2.new(0, 0)
    };
    v19.changeContentSize = function(v20)
        if v19.state.contentSize ~= v20.AbsoluteSize then
            v19:setState({
                contentSize = v20.AbsoluteSize
            });
        end;
    end;
end;
v18.render = function(v21)
    local l_props_0 = v21.props;
    return l_withStyle_0(function(v23)
        local l_Theme_0 = v23.Theme;
        local l_Font_0 = v23.Font;
        local v26 = l_props_0.itemIcon ~= nil and v13.NORMAL_ICON_SIZE or l_IconSize_0.Large;
        if v15() and l_props_0.model ~= nil then
            v26 = v13.NORMAL_ICON_SIZE;
        end;
        local l_v26_0 = v26;
        local l_v26_1 = v26;
        if v14() then
            l_v26_0 = l_props_0.itemIconWidth == nil and v26 or l_props_0.itemIconWidth;
            l_v26_1 = l_props_0.itemIconHeight == nil and v26 or l_props_0.itemIconHeight;
        end;
        local v29 = if not l_props_0.itemIcon then v2.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 5, 0, 5), 
            Size = UDim2.new(0, l_v26_0, 0, l_v26_1), 
            ScaleType = Enum.ScaleType.Stretch, 
            Image = v17, 
            ImageColor3 = l_Theme_0.UIDefault.Color, 
            ImageTransparency = l_Theme_0.UIDefault.Transparency
        }) else v2.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 5, 0, 5), 
            Size = UDim2.new(0, l_v26_0, 0, l_v26_1), 
            ScaleType = Enum.ScaleType.Stretch, 
            Image = l_props_0.itemIcon, 
            ImageTransparency = 0
        });
        if v15() and l_props_0.model ~= nil then
            v29 = v2.createElement(v12, {
                model = l_props_0.model, 
                Position = UDim2.fromOffset(5, 5), 
                Size = UDim2.fromOffset(l_v26_0, l_v26_1)
            });
        end;
        return v2.createElement(l_FitFrameVertical_0, {
            LayoutOrder = l_props_0.layoutOrder, 
            BackgroundTransparency = 1, 
            width = UDim.new(1, 0), 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            contentPadding = UDim.new(0, 6), 
            [v2.Ref] = v21.contentRef, 
            [v2.Change.AbsoluteSize] = v21.changeContentSize
        }, {
            ItemIconFrame = v2.createElement(l_FitFrameVertical_0, {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                width = UDim.new(0.45, 0), 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                margin = {
                    top = 0, 
                    bottom = 0, 
                    left = 0, 
                    right = 20
                }
            }, {
                ItemIcon = v29
            }), 
            ItemDetailsFrame = v2.createElement(l_FitFrameVertical_0, {
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                width = UDim.new(0.55, 0), 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                contentPadding = UDim.new(0, 5)
            }, {
                ItemName = v2.createElement(l_FitTextLabel_0, {
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    width = l_FitTextLabel_0.Width.FitToText, 
                    maximumWidth = v21.state.contentSize.X * 0.55, 
                    Font = l_Font_0.Header2.Font, 
                    Text = l_props_0.itemName, 
                    TextSize = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize, 
                    TextColor3 = l_Theme_0.TextEmphasis.Color, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                ItemCostFrame = v2.createElement(l_FitFrameVertical_0, {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    width = UDim.new(0.5, 0), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    contentPadding = UDim.new(0, 2)
                }, {
                    RobuxIcon = v2.createElement(l_ImageSetLabel_0, {
                        LayoutOrder = 1, 
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(0, 5, 0, 5), 
                        Size = UDim2.new(0, 24, 0, 24), 
                        ScaleType = Enum.ScaleType.Stretch, 
                        Image = v16, 
                        ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                        ImageTransparency = l_Theme_0.IconEmphasis.Transparency
                    }), 
                    ItemCost = v2.createElement(l_FitTextLabel_0, {
                        LayoutOrder = 2, 
                        BackgroundTransparency = 1, 
                        TextWrapped = true, 
                        width = l_FitTextLabel_0.Width.FitToText, 
                        maximumWidth = v21.state.contentSize.X, 
                        Font = l_Font_0.Header2.Font, 
                        Text = tostring(l_props_0.itemRobuxCost), 
                        TextSize = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize, 
                        TextColor3 = l_Theme_0.TextEmphasis.Color
                    })
                })
            })
        });
    end);
end;
return v18;
