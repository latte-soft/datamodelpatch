local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v3.Style.withStyle;
local l_TextButton_0 = v3.App.Button.TextButton;
local v6 = v1.PureComponent:extend("ReportActionSelection");
local function v7()
end;
v6.defaultProps = {
    isMuted = true, 
    isBlocked = true, 
    onCancelActivated = v7, 
    onConfirmActivated = v7, 
    ZIndex = 1, 
    uiScale = 1.3
};
v6.validateProps = v2.strictInterface({
    mutedTitleText = v2.string, 
    blockedTitleText = v2.string, 
    mutedAndBlockedTitleText = v2.string, 
    mutedSubtitleText = v2.string, 
    blockedSubtitleText = v2.string, 
    mutedAndBlockedSubtitleText = v2.string, 
    cancelText = v2.string, 
    confirmText = v2.string, 
    isMuted = v2.boolean, 
    isBlocked = v2.boolean, 
    onCancelActivated = v2.callback, 
    onConfirmActivated = v2.callback, 
    ZIndex = v2.optional(v2.number), 
    uiScale = v2.optional(v2.number)
});
v6.init = function(v8)
    v8.onCancelActivated = function()
        v8.props.onCancelActivated();
    end;
    v8.onConfirmActivated = function()
        v8.props.onConfirmActivated();
    end;
    local v9 = nil;
    local v10 = nil;
    if not v8.props.isMuted or not v8.props.isBlocked then
        if not v8.props.isMuted then
            if v8.props.isBlocked then
                v9 = v8.props.blockedTitleText;
                v10 = v8.props.blockedSubtitleText;
            end;
        else
            v9 = v8.props.mutedTitleText;
            v10 = v8.props.mutedSubtitleText;
        end;
    else
        v9 = v8.props.mutedAndBlockedTitleText;
        v10 = v8.props.mutedAndBlockedSubtitleText;
    end;
    v8:setState({
        titleText = v9, 
        subtitleText = v10
    });
end;
v6.render = function(v11)
    return l_withStyle_0(function(v12)
        local l_BaseSize_0 = v12.Font.BaseSize;
        return v1.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            BackgroundTransparency = 1, 
            ZIndex = v11.props.ZIndex
        }, {
            uiScale = v1.createElement("UIScale", {
                Scale = v11.props.uiScale
            }), 
            layout = v1.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, 22), 
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            title = v1.createElement("TextLabel", {
                Text = v11.state.titleText, 
                TextColor3 = v12.Theme.TextEmphasis.Color, 
                TextTransparency = v12.Theme.TextEmphasis.Transparency, 
                TextSize = v12.Font.Header1.RelativeSize * l_BaseSize_0, 
                Font = v12.Font.Header1.Font, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 1
            }), 
            subtitle = v1.createElement("TextLabel", {
                Size = UDim2.fromOffset(612, 0), 
                Text = v11.state.subtitleText, 
                TextColor3 = v12.Theme.TextEmphasis.Color, 
                TextTransparency = v12.Theme.TextEmphasis.Transparency, 
                TextSize = v12.Font.CaptionHeader.RelativeSize * l_BaseSize_0, 
                Font = v12.Font.CaptionHeader.Font, 
                TextWrapped = true, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = 2
            }), 
            spacer = v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromOffset(0, 62), 
                LayoutOrder = 3
            }), 
            actions = v1.createElement("Frame", {
                Size = UDim2.fromOffset(584, 0), 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = 4
            }, {
                layout = v1.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, 70), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                cancelContainer = v1.createElement("Frame", {
                    BackgroundColor3 = v12.Theme.SystemPrimaryContent.Color, 
                    BackgroundTransparency = v12.Theme.SystemPrimaryContent.Transparency, 
                    BorderSizePixel = 0, 
                    Size = UDim2.fromOffset(234, 44), 
                    LayoutOrder = 1
                }, {
                    uiCorner = v1.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 4)
                    }), 
                    cancelButton = v1.createElement(l_TextButton_0, {
                        size = UDim2.fromScale(1, 1), 
                        text = v11.props.cancelText, 
                        onActivated = v11.onCancelActivated
                    })
                }), 
                confirmContainer = v1.createElement("Frame", {
                    BackgroundColor3 = v3.App.Style.Colors.Blue, 
                    BackgroundTransparency = 0, 
                    BorderSizePixel = 0, 
                    Size = UDim2.fromOffset(234, 44), 
                    LayoutOrder = 2
                }, {
                    uiCorner = v1.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 4)
                    }), 
                    confirmButton = v1.createElement(l_TextButton_0, {
                        size = UDim2.fromScale(1, 1), 
                        text = v11.props.confirmText, 
                        onActivated = v11.onConfirmActivated
                    })
                })
            })
        });
    end);
end;
return v6;
