local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(script.Parent.SceneInteractionEventsContext);
return function(v4)
    return function(v5)
        return v2.createElement(v3.Consumer, {
            render = function(v6)
                return v2.createElement(v4, v1.Dictionary.join(v5, {
                    interactionEvents = v6
                }));
            end
        });
    end;
end;
