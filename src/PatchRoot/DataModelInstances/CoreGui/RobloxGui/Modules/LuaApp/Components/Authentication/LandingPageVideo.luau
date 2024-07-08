local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local l_useStyle_0 = require(l_CorePackages_0.UIBlox).Core.Style.useStyle;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Flags.GetFStringLandingVideoAsset)();
return function(v5)
    local v6 = l_useStyle_0();
    local v7 = math.max(v5.screenSize.X, v5.screenSize.Y);
    local v8 = v3.useRef(false);
    v3.useEffect(function()
        l_RunService_0:setThrottleFramerateEnabled(false);
        return function()
            l_RunService_0:setThrottleFramerateEnabled(true);
        end;
    end, {});
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5)
    }, {
        UIListLayout = v3.createElement("UIListLayout", {
            Padding = UDim.new(0, 0), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        UIAspectRatioConstraint = v3.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1
        }), 
        UISizeConstraint = v3.createElement("UISizeConstraint", {
            MinSize = Vector2.new(v7, v7)
        }), 
        Video = v3.createElement("VideoFrame", {
            Video = v4, 
            Size = UDim2.new(1, 0, 1, -250), 
            Looped = true, 
            Playing = true, 
            Volume = 0, 
            LayoutOrder = 0, 
            BorderSizePixel = 0, 
            ref = v8
        }, {
            UIGradient = v3.createElement("UIGradient", {
                Rotation = 90, 
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, v6.Theme.UIEmphasis.Color), 
                    ColorSequenceKeypoint.new(1, v6.Theme.BackgroundUIContrast.Color)
                }), 
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0), 
                    NumberSequenceKeypoint.new(1, 0)
                })
            })
        }), 
        BlackBackground = v3.createElement("Frame", {
            Visible = true, 
            Size = UDim2.new(1, 0, 0, 250), 
            LayoutOrder = 2, 
            BackgroundColor3 = v6.Theme.BackgroundUIContrast.Color, 
            BackgroundTransparency = 0, 
            BorderSizePixel = 0
        })
    });
end;
