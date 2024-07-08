local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.Cryo);
local v5 = require(l_Parent_2.t);
local v6 = require(l_Parent_0.Text.GenericTextLabel.GenericTextLabel);
local v7 = require(l_Parent_0.Control.Interactable);
local v8 = require(l_Parent_1.Core.Style.Validator.validateColorInfo);
local v9 = require(l_Parent_1.Core.Style.Validator.validateFontInfo);
local v10 = v3.PureComponent:extend("GenericCell");
v10.validateProps = v5.strictInterface({
    onActivated = v5.optional(v5.callback), 
    isSelected = v5.optional(v5.boolean), 
    isDisabled = v5.optional(v5.boolean), 
    onStateChanged = v5.callback, 
    titleText = v5.optional(v5.string), 
    subtitleText = v5.optional(v5.string), 
    renderRightContent = v5.optional(v5.callback), 
    rightContentWidth = v5.optional(v5.number), 
    renderLeftContent = v5.optional(v5.callback), 
    leftContentWidth = v5.optional(v5.number), 
    colorStyle = v8, 
    textStyle = v5.optional(v8), 
    fontStyle = v5.optional(v9), 
    subtitleTextStyle = v5.optional(v8), 
    subtitleFontStyle = v5.optional(v9), 
    dividerStyle = v5.table, 
    controlRef = v5.optional(v5.table), 
    NextSelectionLeft = v5.optional(v5.table), 
    NextSelectionRight = v5.optional(v5.table), 
    NextSelectionUp = v5.optional(v5.table), 
    NextSelectionDown = v5.optional(v5.table), 
    SelectionImageObject = v5.optional(v5.table)
});
v10.defaultProps = {
    rightContentWidth = 0, 
    leftContentWidth = 0, 
    isDisabled = false
};
v10.render = function(v11)
    assert(v11.validateProps(v11.props));
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1
    }, {
        Interactable = v3.createElement(v7, {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = v11.props.colorStyle.Color, 
            BackgroundTransparency = v11.props.colorStyle.Transparency, 
            BorderSizePixel = 0, 
            AutoButtonColor = false, 
            [v3.Event.Activated] = not v11.props.isDisabled and v11.props.onActivated, 
            [v3.Ref] = v11.props.controlRef, 
            NextSelectionUp = v11.props.NextSelectionUp, 
            NextSelectionDown = v11.props.NextSelectionDown, 
            NextSelectionLeft = v11.props.NextSelectionLeft, 
            NextSelectionRight = v11.props.NextSelectionRight, 
            SelectionImageObject = v11.props.SelectionImageObject, 
            isDisabled = v11.props.isDisabled, 
            onStateChanged = v11.props.onStateChanged
        }, {
            Contents = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                LayoutOrder = 1
            }, {
                UIPadding = v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24), 
                    PaddingTop = UDim.new(0, 12), 
                    PaddingBottom = UDim.new(0, 12)
                }), 
                UIListLayout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                Frame = v3.createElement("Frame", {
                    Size = UDim2.new(1, -v11.props.rightContentWidth - v11.props.leftContentWidth, 1, 0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                }, {
                    UIListLayout = v3.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }), 
                    TitleText = v11.props.titleText and v3.createElement(v6, {
                        Size = UDim2.new(1, 0, 1, 0), 
                        colorStyle = v11.props.textStyle, 
                        fontStyle = v11.props.fontStyle, 
                        Text = v11.props.titleText, 
                        LayoutOrder = 1, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    }), 
                    SubTitleText = v11.props.subtitleText and v3.createElement(v6, {
                        Size = UDim2.new(1, 0, 1, 0), 
                        colorStyle = v11.props.subtitleTextStyle, 
                        fontStyle = v11.props.subtitleFontStyle, 
                        Text = v11.props.subtitleText, 
                        LayoutOrder = 2, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    })
                }), 
                RightContent = v11.props.renderRightContent and v11.props.renderRightContent(), 
                LeftContent = v11.props.renderLeftContent and v11.props.renderLeftContent()
            }), 
            Divider = v3.createElement("Frame", {
                Size = UDim2.new(1, -24, 0, 1), 
                Position = UDim2.new(0, 24, 1, -1), 
                BorderSizePixel = 0, 
                BackgroundColor3 = v11.props.dividerStyle.Color, 
                BackgroundTransparency = v11.props.dividerStyle.Transparency
            })
        })
    });
end;
return v3.forwardRef(function(v12, v13)
    return v3.createElement(v10, v4.Dictionary.join(v12, {
        controlRef = v13
    }));
end);
