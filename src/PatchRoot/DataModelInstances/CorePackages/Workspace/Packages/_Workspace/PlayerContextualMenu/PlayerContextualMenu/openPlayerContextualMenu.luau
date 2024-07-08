local l_Parent_0 = script:FindFirstAncestor("PlayerContextualMenu").Parent;
local v1 = require(l_Parent_0.CentralOverlay);
local v2 = require(l_Parent_0.RobloxAppEnums);
local _ = require(script.Parent.Components);
return function(v4)
    return function(v5)
        v5:dispatch(v1.Actions.SetCentralOverlay(v2.CentralOverlayType.PlayerContextualMenu, v4));
    end;
end;
