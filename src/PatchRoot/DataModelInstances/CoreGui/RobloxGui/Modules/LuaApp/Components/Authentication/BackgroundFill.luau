local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Common_0 = l_Modules_0.Common;
local v2 = require(l_Common_0.Roact);
local v3 = require(l_Common_0.RoactRodux);
local v4 = require(game:GetService("CorePackages").UIBlox);
local v5 = v2.PureComponent:extend("BackgroundFill");
local l_Colors_0 = v4.App.Style.Colors;
local v7 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableBackgroundFillOptions);
v5.render = function(v8)
    local l_Image_0 = v8.props.Image;
    local l_AspectRatio_0 = v8.props.AspectRatio;
    local v11 = math.max(v8.props.screenSize.X, v8.props.screenSize.Y);
    if not v7() then
        return v2.createElement("ImageLabel", {
            Image = l_Image_0, 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BorderSizePixel = 0
        }, {
            UIAspectRatioConstraint = v2.createElement("UIAspectRatioConstraint", {
                AspectRatio = l_AspectRatio_0
            }), 
            UISizeConstraint = v2.createElement("UISizeConstraint", {
                MinSize = Vector2.new(v11, v11)
            })
        });
    else
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            BackgroundImage = v2.createElement("ImageLabel", {
                Image = l_Image_0, 
                Size = UDim2.new(1, 0, 1, 0), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BorderSizePixel = 0
            }, {
                UIAspectRatioConstraint = v2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = l_AspectRatio_0
                }), 
                UISizeConstraint = v2.createElement("UISizeConstraint", {
                    MinSize = Vector2.new(v11, v11)
                }), 
                UIGradient = if not v8.props.TopGradient then nil else v2.createElement("UIGradient", {
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, l_Colors_0.Black), 
                        ColorSequenceKeypoint.new(0.5, l_Colors_0.White), 
                        ColorSequenceKeypoint.new(1, l_Colors_0.White)
                    }), 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0), 
                        NumberSequenceKeypoint.new(1, 0)
                    }), 
                    Rotation = 90
                })
            }), 
            BottomContentBackground = if not v8.props.BottomContentSize then nil else v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v8.props.BottomContentSize), 
                Position = UDim2.new(0, 0, 1, 0), 
                AnchorPoint = Vector2.new(0, 1), 
                BackgroundColor3 = l_Colors_0.Flint, 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                ZIndex = 2
            })
        });
    end;
end;
return (v3.connect(function(v12, _)
    return {
        screenSize = v12.ScreenSize
    };
end)(v5));
