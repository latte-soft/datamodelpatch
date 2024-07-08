local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Roact);
local v2 = require(l_Modules_0.LuaApp.RoactMotion);
local v3 = v1.PureComponent:extend("UIScaler");
v3.render = function(v4)
    return v1.createElement(v2.SimpleMotion, {
        style = {
            scale = v4.props.scaleValue
        }, 
        onRested = v4.props.onRested, 
        render = function(v5)
            return v1.createElement("UIScale", {
                Scale = v5.scale
            });
        end
    });
end;
return v3;
