local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v3.Style.withStyle;
local l_TextButton_0 = v3.App.Button.TextButton;
local v6 = require(script.Parent.CheckboxRow);
local v7 = v1.PureComponent:extend("ReportActionSelection");
local function v8()
end;
v7.defaultProps = {
    titleText = "Thanks for your report", 
    subtitleText = "We've received your report and will take action soon if needed. Your feedback helps keep our community safe.", 
    instructionText = "Other steps you can take:", 
    muteText = "Mute {DISPLAYNAME}(@username)", 
    blockText = "Block {DISPLAYNAME}(@username)", 
    doneText = "Done", 
    showVoiceMuting = true, 
    isVoiceMuted = false, 
    isBlocked = false, 
    onMuteCheckboxActivated = v8, 
    onBlockCheckboxActivated = v8, 
    onDoneActivated = v8, 
    ZIndex = 1, 
    uiScale = 1.3
};
v7.validateProps = v2.interface({
    titleText = v2.string, 
    subtitleText = v2.string, 
    instructionText = v2.string, 
    muteText = v2.string, 
    blockText = v2.string, 
    doneText = v2.string, 
    showVoiceMuting = v2.boolean, 
    isVoiceMuted = v2.optional(v2.boolean), 
    isBlocked = v2.optional(v2.boolean), 
    onMuteCheckboxActivated = v2.optional(v2.callback), 
    onBlockCheckboxActivated = v2.optional(v2.callback), 
    onDoneActivated = v2.callback, 
    ZIndex = v2.number
});
v7.init = function(v9)
    v9.onMuteCheckboxActivated = function(v10)
        v9:setState({
            isVoiceMuted = v10
        });
        v9.props.onMuteCheckboxActivated(v10);
    end;
    v9.onBlockCheckboxActivated = function(v11)
        v9:setState({
            isBlocked = v11
        });
        v9.props.onBlockCheckboxActivated(v11);
    end;
    v9.onDoneActivated = function()
        v9.props.onDoneActivated(v9.state.isBlocked, v9.state.isVoiceMuted);
    end;
    v9:setState({
        isVoiceMuted = v9.props.isVoiceMuted, 
        isBlocked = v9.props.isBlocked
    });
end;
v7.render = function(v12)
    return l_withStyle_0(function(v13)
        local l_BaseSize_0 = v13.Font.BaseSize;
        return v1.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            BackgroundTransparency = 1, 
            ZIndex = v12.props.ZIndex
        }, {
            uiScale = v1.createElement("UIScale", {
                Scale = v12.props.uiScale
            }), 
            layout = v1.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, 22), 
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            title = v1.createElement("TextLabel", {
                Text = v12.props.titleText, 
                TextColor3 = v13.Theme.TextEmphasis.Color, 
                TextTransparency = v13.Theme.TextEmphasis.Transparency, 
                TextSize = v13.Font.Header1.RelativeSize * l_BaseSize_0, 
                Font = v13.Font.Header1.Font, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 1
            }), 
            subtitle = v1.createElement("TextLabel", {
                Size = UDim2.fromOffset(612, 0), 
                Text = v12.props.subtitleText, 
                TextColor3 = v13.Theme.TextEmphasis.Color, 
                TextTransparency = v13.Theme.TextEmphasis.Transparency, 
                TextSize = v13.Font.CaptionHeader.RelativeSize * l_BaseSize_0, 
                Font = v13.Font.CaptionHeader.Font, 
                TextWrapped = true, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = 2
            }), 
            actions = v1.createElement("Frame", {
                Size = UDim2.fromOffset(584, 0), 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = 3
            }, {
                layout = v1.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, 18), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                instruction = v1.createElement("TextLabel", {
                    Size = UDim2.fromScale(1, 0), 
                    Text = v12.props.instructionText, 
                    TextColor3 = v13.Theme.TextDefault.Color, 
                    TextTransparency = v13.Theme.TextDefault.Transparency, 
                    TextSize = v13.Font.CaptionHeader.RelativeSize * l_BaseSize_0, 
                    Font = v13.Font.CaptionHeader.Font, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    LayoutOrder = 1
                }), 
                muteCheckbox = v12.props.showVoiceMuting and v1.createElement(v6, {
                    height = 28, 
                    image = "icons/controls/microphone", 
                    descriptionText = v12.props.muteText, 
                    actionDisabled = v12.state.isBlocked, 
                    checkboxSelected = v12.state.isBlocked or v12.state.isVoiceMuted, 
                    onCheckboxActivated = v12.onMuteCheckboxActivated, 
                    LayoutOrder = 2
                }), 
                div = v12.props.showVoiceMuting and v1.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    BackgroundColor3 = v13.Theme.Divider.Color, 
                    BackgroundTransparency = v13.Theme.Divider.Transparency, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 3
                }), 
                blockCheckbox = v1.createElement(v6, {
                    height = 28, 
                    image = "icons/actions/block", 
                    descriptionText = v12.props.blockText, 
                    checkboxSelected = v12.state.isBlocked, 
                    onCheckboxActivated = v12.onBlockCheckboxActivated, 
                    LayoutOrder = 4
                }), 
                doneContainer = v1.createElement("Frame", {
                    BackgroundColor3 = v13.Theme.SystemPrimaryContent.Color, 
                    BackgroundTransparency = v13.Theme.SystemPrimaryContent.Transparency, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 44), 
                    LayoutOrder = 5
                }, {
                    uiCorner = v1.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 4)
                    }), 
                    doneButton = v1.createElement(l_TextButton_0, {
                        size = UDim2.fromScale(1, 1), 
                        text = v12.props.doneText, 
                        onActivated = v12.onDoneActivated
                    })
                })
            })
        });
    end);
end;
return v7;
