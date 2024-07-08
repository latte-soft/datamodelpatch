local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v5 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Constants);
local v6 = v2.PureComponent:extend("PeekabooFrameBorder");
v6.validateProps = v3.strictInterface({});
v6.render = function(_)
    return l_withStyle_0(function(v8)
        local l_Theme_0 = v8.Theme;
        return v2.createFragment({
            TopBorder = v2.createElement("Frame", {
                BackgroundColor3 = l_Theme_0.Divider.Color, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, v5.PeekabooBorderWidthPix), 
                Position = UDim2.fromOffset(0, 0), 
                ZIndex = 2
            }), 
            LeftBorder = v2.createElement("Frame", {
                BackgroundColor3 = l_Theme_0.Divider.Color, 
                BorderSizePixel = 0, 
                Size = UDim2.new(0, v5.PeekabooBorderWidthPix, 1, 0), 
                Position = UDim2.fromOffset(0, 0), 
                ZIndex = 2
            }), 
            RightBorder = v2.createElement("Frame", {
                BackgroundColor3 = l_Theme_0.Divider.Color, 
                BorderSizePixel = 0, 
                AnchorPoint = Vector2.new(1, 0), 
                Size = UDim2.new(0, v5.PeekabooBorderWidthPix, 1, 0), 
                Position = UDim2.fromScale(1, 0), 
                ZIndex = 2
            }), 
            BottomBorder = v2.createElement("Frame", {
                BackgroundColor3 = l_Theme_0.Divider.Color, 
                BorderSizePixel = 0, 
                AnchorPoint = Vector2.new(0, 1), 
                Size = UDim2.new(1, 0, 0, v5.PeekabooBorderWidthPix), 
                Position = UDim2.fromScale(0, 1), 
                ZIndex = 2
            })
        });
    end);
end;
return v6;
