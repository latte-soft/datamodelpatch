local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v4.Style.withStyle;
local l_withAnimation_0 = v4.Core.Animation.withAnimation;
local l_Placement_0 = v4.App.Navigation.Enum.Placement;
local v8 = require(l_CoreGui_0.RobloxGui.Modules.AvatarExperience.Common.Components.AvatarHeadshotLocalIcon);
local v9 = {
    frequency = 3
};
local v10 = v2.PureComponent:extend("AvatarHeadshotSystemBarIcon");
v10.validateProps = v3.strictInterface({
    placement = l_Placement_0.isEnumValue, 
    hovered = v3.boolean, 
    selected = v3.boolean, 
    pressed = v3.boolean, 
    badgeValue = v3.optional(v3.union(v3.number, v3.string)), 
    size = v3.optional(v3.number)
});
v10.render = function(v11)
    local v12 = v11.props.size or 42;
    return l_withStyle_0(function(_)
        local v14 = 0;
        local v15 = 0;
        if v11.props.hovered then
            if v11.props.placement == l_Placement_0.Bottom then
                v15 = -4;
            else
                v14 = 4;
            end;
        end;
        return l_withAnimation_0({
            hoverOffsetX = v14, 
            hoverOffsetY = v15
        }, function(v16)
            return v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Position = UDim2.new(0.5, math.floor(v16.hoverOffsetX + 0.5), 0.5, (math.floor(v16.hoverOffsetY + 0.5))), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Size = UDim2.fromOffset(42, 42)
            }, {
                AvatarHeadshotLocalIcon = v2.createElement(v8, {
                    ZIndex = 2, 
                    Size = v12
                })
            });
        end, v9);
    end);
end;
return v10;
