local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = v1.PureComponent:extend("BottomInsetBackground");
v4.validateProps = v3.strictInterface({
    globalGuiInset = v3.strictInterface({
        left = v3.integer, 
        top = v3.integer, 
        right = v3.integer, 
        bottom = v3.integer
    })
});
v4.renderWithStyle = function(v5, v6)
    local l_Theme_0 = v6.Theme;
    return v1.createElement("Frame", {
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
        BorderSizePixel = 0, 
        Position = UDim2.new(0, 0, 1, 0), 
        Size = UDim2.new(1, 0, 0, v5.props.globalGuiInset.bottom), 
        ZIndex = 3
    });
end;
v4.render = function(v8)
    return l_withStyle_0(function(v9)
        return v8:renderWithStyle(v9);
    end);
end;
return v4;
