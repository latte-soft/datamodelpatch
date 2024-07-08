local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v3.Style.withStyle;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v3.App.ImageSet.Images;
local l_Checkbox_0 = v3.App.InputButton.Checkbox;
local v8 = v1.PureComponent:extend("CheckboxRow");
v8.defaultProps = {
    height = 28, 
    image = "icons/controls/microphone", 
    descriptionText = "Description Text", 
    checkboxSelected = false, 
    actionDisabled = false, 
    onCheckboxActivated = function()
    end, 
    LayoutOrder = 1
};
v8.validateProps = v2.interface({
    height = v2.number, 
    image = v2.string, 
    descriptionText = v2.string, 
    checkboxSelected = v2.boolean, 
    actionDisabled = v2.boolean, 
    onCheckboxActivated = v2.callback, 
    LayoutOrder = v2.optional(v2.number)
});
v8.render = function(v9)
    return l_withStyle_0(function(v10)
        local l_BaseSize_0 = v10.Font.BaseSize;
        local v12 = nil;
        local v13 = nil;
        if not v9.props.actionDisabled then
            v12 = v10.Theme.TextEmphasis;
            v13 = v10.Theme.IconEmphasis;
        else
            v12 = v10.Theme.TextMuted;
            v13 = v10.Theme.IconDefault;
        end;
        return v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v9.props.height), 
            BackgroundTransparency = 1, 
            LayoutOrder = v9.props.LayoutOrder
        }, {
            layout = v1.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, 12), 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            image = v1.createElement(l_ImageSetLabel_0, {
                Size = UDim2.fromOffset(v9.props.height, v9.props.height), 
                Image = l_Images_0[v9.props.image], 
                ImageColor3 = v13.Color, 
                ImageTransparency = v13.Transparency, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }), 
            text = v1.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, -(v9.props.height + 12) * 4, 1, 0), 
                Text = v9.props.descriptionText, 
                TextColor3 = v12.Color, 
                TextTransparency = v12.Transparency, 
                TextSize = v10.Font.Header2.RelativeSize * l_BaseSize_0, 
                Font = v10.Font.Header2.Font, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                LayoutOrder = 2
            }), 
            checkbox = v1.createElement(l_Checkbox_0, {
                size = UDim2.fromOffset(v9.props.height, v9.props.height), 
                isDisabled = v9.props.actionDisabled, 
                isSelected = v9.props.checkboxSelected, 
                onActivated = v9.props.onCheckboxActivated, 
                text = "", 
                layoutOrder = 3
            })
        });
    end);
end;
return v8;
