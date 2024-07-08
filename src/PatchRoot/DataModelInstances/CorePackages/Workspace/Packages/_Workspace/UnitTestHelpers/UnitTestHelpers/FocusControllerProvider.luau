local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v2.Focusable;
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = v1.Component:extend("FocusControllerProvider");
v5.validateProps = v4.strictInterface({
    captureFocusOnMount = v4.boolean, 
    [v1.Children] = v4.table, 
    focusController = v4.optional(v4.table)
});
v5.init = function(v6)
    v6.focusController = v6.props.focusController or v2.createFocusController();
end;
v5.render = function(v7)
    return v1.createElement(l_Focusable_0.Frame, {
        focusController = v7.focusController, 
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1)
    }, v7.props[v1.Children]);
end;
v5.didMount = function(v8)
    if v8.props.captureFocusOnMount then
        v8.focusController.captureFocus();
    end;
end;
return v5;
