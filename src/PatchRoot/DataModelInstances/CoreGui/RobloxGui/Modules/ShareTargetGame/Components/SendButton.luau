local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Promise);
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.UIBlox);
local l_Text_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text;
local l_ShimmerPanel_0 = v3.App.Loading.ShimmerPanel;
local v6 = v2.PureComponent:extend("SendButton");
v6.defaultProps = {
    sendText = "Send", 
    sentText = "Sent", 
    sendingText = "Sending..", 
    failedText = "Failed", 
    sentStatus = nil, 
    isLoading = false, 
    onActivated = function()
        return v1.resolve();
    end
};
v6.render = function(v7)
    return v3.Style.withStyle(function(v8)
        local v9 = nil;
        v9 = if v7.props.sentStatus == "sent" then v7.props.sentText else if v7.props.sentStatus == "sending" then v7.props.sendingText else if v7.props.sentStatus == "failed" then v7.props.failedText else v7.props.sendText;
        local l_Font_0 = v8.Font.Body.Font;
        local v11 = v8.Font.BaseSize * v8.Font.Body.RelativeSize;
        local v12 = l_Text_0.GetTextWidth(v9, l_Font_0, v11);
        return not v7.props.isLoading and v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, v12 + 14, 0, 32)
        }, {
            layout = v2.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            element = not not v7.props.sentStatus and v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                inactiveButton = v2.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    TextSize = v11, 
                    TextColor3 = v8.Theme.TextDefault.Color, 
                    TextTransparency = v8.Theme.TextDefault.Transparency, 
                    Font = l_Font_0, 
                    TextXAlignment = Enum.TextXAlignment.Right, 
                    Text = v9
                })
            }) or v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                layout = v2.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                activeButton = v2.createElement("ImageButton", {
                    BackgroundTransparency = 1, 
                    ImageColor3 = v8.Theme.SecondaryDefault.Color, 
                    ImageTransparency = v8.Theme.SecondaryDefault.Transparency, 
                    Image = "rbxasset:///textures/ui/LuaDiscussions/buttonStroke.png", 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(8, 8, 8, 8), 
                    Size = UDim2.new(1, 0, 1, 0), 
                    [v2.Event.Activated] = v7.props.onActivated
                }, {
                    layout = v2.createElement("UIListLayout", {
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    }), 
                    interior = v2.createElement("Frame", {
                        BackgroundColor3 = v8.Theme.BackgroundUIDefault.Color, 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Size = UDim2.new(1, -2, 1, -2)
                    }, {
                        layout = v2.createElement("UIListLayout", {
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center
                        }), 
                        Label = v2.createElement("TextLabel", {
                            Size = UDim2.new(0, v12, 0, v11), 
                            BackgroundTransparency = 1, 
                            Text = v9, 
                            Font = l_Font_0, 
                            TextSize = v11, 
                            TextColor3 = v8.Theme.SecondaryContent.Color, 
                            TextTransparency = v8.Theme.SecondaryContent.Transparency
                        })
                    })
                })
            })
        }) or v2.createElement(l_ShimmerPanel_0, {
            Size = UDim2.new(0, v12 + 14, 0, 32), 
            cornerRadius = UDim.new(0, 4)
        });
    end);
end;
return v6;
