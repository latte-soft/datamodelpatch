local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Util.makeEvents);
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(script.Parent.SceneInteractionCallbacksContext);
local v4 = require(script.Parent.SceneInteractionEventsContext);
local v5 = v2.PureComponent:extend("SceneInteractionProvider");
v5.init = function(v6)
    local v7, v8, v9 = v1({
        "panByDistance", 
        "panByPixels", 
        "rotateByRadians", 
        "rotateByPixels", 
        "setAngularVelocityByPixels", 
        "zoomStraight", 
        "zoomToPoint"
    });
    v6.events = v7;
    v6.callbacks = v8;
    v6.cleanups = v9;
end;
v5.render = function(v10)
    return v2.createElement(v3.Provider, {
        value = v10.callbacks
    }, {
        SceneInteractionEventsProvider = v2.createElement(v4.Provider, {
            value = v10.events
        }, v10.props[v2.Children])
    });
end;
v5.willUnmount = function(v11)
    for _, v13 in v11.cleanups, nil, nil do
        v13();
    end;
end;
return v5;
