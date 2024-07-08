local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.RoactRodux);
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Actions.HideError);
local v5 = require(l_Parent_0.Constants);
local v6 = v1.PureComponent:extend("ErrorMessage");
v6.render = function(v7)
    local v8 = v5.Layouts[v7.props.layout];
    return v1.createElement("Frame", {
        Size = v8.ErrorFrameSize, 
        Position = v8.ErrorFramePosition, 
        BackgroundColor3 = v5.Colors.Black, 
        BackgroundTransparency = v5.ErrorFrameBackgroundTransparency, 
        BorderSizePixel = v5.ErrorFrameBorderSize, 
        Selectable = false, 
        Visible = v7.props.displayOptions.errorVisible, 
        [v1.Event.TouchTap] = function()
            v7.props.close();
        end, 
        [v1.Event.InputBegan] = function(_, v10)
            if v10.UserInputType == Enum.UserInputType.MouseButton1 then
                v7.props.close();
            end;
        end
    }, {
        AsspectRatioConstraint = v1.createElement("UIAspectRatioConstraint", {
            AspectRatio = v8.ErrorFrameAspectRatio
        }), 
        SizeConstraint = v1.createElement("UISizeConstraint", {
            MinSize = v8.ErrorFrameMinSize, 
            MaxSize = v8.ErrorFrameMaxSize
        }), 
        ErrorIcon = v1.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, v8.ErrorIconOffset, 0.5, 0), 
            Size = UDim2.new(0.2, -v8.ErrorIconOffset * 2, 1, -v8.ErrorIconOffset * 2), 
            Image = v8.ErrorIcon, 
            BackgroundTransparency = 1
        }, {
            AsspectRatioConstraint = v1.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            })
        }), 
        ErrorText = v1.createElement("TextLabel", {
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0.2, -v8.ErrorIconOffset, 0.5, 0), 
            Size = UDim2.new(0.8, 0, 1, 0), 
            Text = v7.props.displayOptions.errorText, 
            TextScaled = true, 
            TextSize = v8.ErrorTextSize, 
            TextColor3 = v5.Colors.White, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Font = v8.ErrorTextFont, 
            BackgroundTransparency = 1
        }, {
            SizeConstraint = v1.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(v8.ErrorFrameMaxSize.X, v8.ErrorTextSize + v5.TextPadding)
            }), 
            TextSizeConstraint = v1.createElement("UITextSizeConstraint", {
                MaxTextSize = v8.ErrorTextSize
            })
        })
    });
end;
return v2.connect(function(v11)
    return {
        displayOptions = v11.displayOptions, 
        layout = v11.layout
    };
end, function(v12)
    return {
        close = function()
            return v12(v4());
        end
    };
end)(v6);
