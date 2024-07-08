local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.Cryo);
local v5 = require(l_Parent_2.t);
local v6 = require(l_Parent_2.RoactGamepad);
local v7 = require(l_Parent_1.Core.Text.GenericTextLabel.GenericTextLabel);
local v8 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local v9 = require(l_Parent_1.Core.ImageSet.Validator.validateImage);
local v10 = require(l_Parent_1.Core.Style.withStyle);
local v11 = require(l_Parent_0.Container.getPageMargin);
local v12 = require(l_Parent_0.ImageSet.Enum.IconSize);
local v13 = require(l_Parent_0.ImageSet.getIconSize);
local v14 = require(l_Parent_0.ImageSet.Images);
local v15 = require(l_Parent_0.Button.Button);
local v16 = require(l_Parent_0.Button.Enum.ButtonType);
local v17 = v3.PureComponent:extend("EmptyState");
v17.validateProps = v5.strictInterface({
    text = v5.string, 
    icon = v5.optional(v9), 
    size = v5.optional(v5.UDim2), 
    position = v5.optional(v5.UDim2), 
    anchorPoint = v5.optional(v5.Vector2), 
    buttonIcon = v5.optional(v9), 
    buttonText = v5.optional(v5.string), 
    buttonType = v5.optional(v16.isEnumValue), 
    onActivated = v5.optional(v5.callback), 
    frameRef = v5.optional(v5.table), 
    NextSelectionUp = v5.optional(v5.table), 
    NextSelectionDown = v5.optional(v5.table), 
    NextSelectionLeft = v5.optional(v5.table), 
    NextSelectionRight = v5.optional(v5.table), 
    maxSizeTextLabel = v5.optional(v5.Vector2), 
    iconColor = v5.optional(v5.Color3), 
    iconSize = v5.optional(v5.UDim2), 
    titleProps = v5.optional(v5.strictInterface({
        titleText = v5.optional(v5.string)
    }))
});
v17.defaultProps = {
    icon = v14["icons/status/oof_xlarge"], 
    size = UDim2.fromScale(1, 1), 
    position = UDim2.fromScale(0.5, 0.5), 
    anchorPoint = Vector2.new(0.5, 0.5), 
    buttonIcon = v14["icons/common/refresh"], 
    buttonType = v16.Secondary, 
    iconSize = UDim2.fromOffset(v13(v12.XLarge), v13(v12.XLarge))
};
local function _(v18)
    if v18 == "" then
        return nil;
    else
        return v18;
    end;
end;
v17.init = function(v20)
    v20:setState({
        absoluteSize = Vector2.new(0, 0)
    });
    v20.onAbsoluteSizeChange = function(v21)
        v20:setState({
            absoluteSize = v21.AbsoluteSize
        });
    end;
    v20.buttonRef = v3.createRef();
end;
v17.render = function(v22)
    return v10(function(v23)
        local l_createElement_0 = v3.createElement;
        local l_Frame_0 = v6.Focusable.Frame;
        local v26 = {
            [v3.Change.AbsoluteSize] = v22.onAbsoluteSizeChange, 
            Size = v22.props.size, 
            Position = v22.props.position, 
            AnchorPoint = v22.props.anchorPoint, 
            BackgroundTransparency = 1, 
            [v3.Ref] = v22.props.frameRef, 
            NextSelectionUp = v22.props.NextSelectionUp, 
            NextSelectionDown = v22.props.NextSelectionDown, 
            NextSelectionULeft = v22.props.NextSelectionLeft, 
            NextSelectionRight = v22.props.NextSelectionRight, 
            defaultChild = v22.buttonRef
        };
        local v27 = {};
        local l_createElement_1 = v3.createElement;
        local v29 = "Frame";
        local v30 = {
            Size = UDim2.new(1, 0, 0, 187), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1
        };
        local v31 = {
            UIListLayout = v3.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Icon = v3.createElement(v8.Label, {
                AnchorPoint = Vector2.new(0.5, 0), 
                Size = v22.props.iconSize, 
                LayoutOrder = 1, 
                Image = v22.props.icon, 
                BackgroundTransparency = 1, 
                ImageColor3 = v22.props.iconColor or v23.Theme.IconEmphasis.Color, 
                ImageTransparency = v23.Theme.IconEmphasis.Transparency
            }), 
            iconTextPadding = v3.createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Size = UDim2.fromOffset(0, 12), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }), 
            TitleFrame = if not not v22.props.titleProps and v22.props.titleProps.titleText then v3.createElement("Frame", {
                Size = UDim2.fromScale(1, 0), 
                Position = UDim2.fromScale(0, 0), 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BorderSizePixel = 0, 
                LayoutOrder = 3
            }, {
                TitlePadding = v3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 14), 
                    PaddingBottom = UDim.new(0, 14)
                }), 
                TitleText = v3.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Text = v22.props.titleProps.titleText, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    Font = v23.Font.Title.Font, 
                    TextSize = v23.Font.Header1.RelativeSize * v23.Font.BaseSize, 
                    TextColor3 = v23.Theme.TextEmphasis.Color, 
                    TextTransparency = v23.Theme.TextEmphasis.Transparency, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.fromScale(1, 0), 
                    TextWrapped = true, 
                    LayoutOrder = 1
                })
            }) else nil, 
            Text = v3.createElement(v7, {
                Text = v22.props.text, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                LayoutOrder = 4, 
                fontStyle = v23.Font.Body, 
                colorStyle = v23.Theme.TextDefault, 
                maxSize = v22.props.maxSizeTextLabel
            }), 
            textButtonPadding = v3.createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Size = UDim2.fromOffset(0, 24), 
                BackgroundTransparency = 1, 
                LayoutOrder = 5
            })
        };
        local l_onActivated_0 = v22.props.onActivated;
        if l_onActivated_0 then
            l_onActivated_0 = v3.createElement;
            local v33 = "Frame";
            local v34 = {
                Size = UDim2.new(1, 0, 0, 48), 
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 6
            };
            local v35 = {
                UIPadding = v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v11(v22.state.absoluteSize.X)), 
                    PaddingRight = UDim.new(0, v11(v22.state.absoluteSize.X))
                }), 
                UISizeConstraint = v3.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(640, 48)
                })
            };
            local l_createElement_2 = v3.createElement;
            local l_v15_0 = v15;
            local v38 = {
                buttonType = v22.props.buttonType, 
                size = UDim2.fromScale(1, 1), 
                position = UDim2.fromScale(0.5, 0.5), 
                anchorPoint = Vector2.new(0.5, 0.5), 
                onActivated = v22.props.onActivated
            };
            local l_buttonIcon_0 = v22.props.buttonIcon;
            v38.icon = if l_buttonIcon_0 == "" then nil else l_buttonIcon_0;
            v38.text = v22.props.buttonText;
            v38[v3.Ref] = v22.buttonRef;
            v35.Button = l_createElement_2(l_v15_0, v38);
            l_onActivated_0 = l_onActivated_0(v33, v34, v35);
        end;
        v31.buttonFrame = l_onActivated_0;
        v27.Content = l_createElement_1(v29, v30, v31);
        return l_createElement_0(l_Frame_0, v26, v27);
    end);
end;
return v3.forwardRef(function(v40, v41)
    return v3.createElement(v17, v4.Dictionary.join(v40, {
        frameRef = v41
    }));
end);
