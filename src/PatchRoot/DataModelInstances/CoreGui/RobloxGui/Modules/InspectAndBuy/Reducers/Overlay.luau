local v0 = require(game:GetService("CorePackages").Rodux);
local l_Parent_0 = script.Parent.Parent;
return v0.createReducer({
    overlay = nil, 
    overlayProps = {}
}, {
    [require(l_Parent_0.Actions.OpenOverlay).name] = function(_, v3)
        return {
            overlay = v3.overlay, 
            overlayProps = v3.overlayProps
        };
    end, 
    [require(l_Parent_0.Actions.CloseOverlay).name] = function(_, _)
        return {
            overlay = nil, 
            overlayProps = {}
        };
    end
});
