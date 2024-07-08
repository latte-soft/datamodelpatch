local l_Parent_0 = script.Parent.Parent.Parent;
local l_React_0 = require(l_Parent_0.dependencies).React;
local v2 = require(l_Parent_0.Components.DiscoverabilityContext.DiscoverabilityContext);
local v3 = require(l_Parent_0.Components.DiscoverabilityOverlay.DiscoverabilityOverlayContainer);
return function(v4)
    return l_React_0.createElement(v2(v3), v4);
end;
