local v0 = require(script:FindFirstAncestor("CentralOverlay").Actions.SetCentralOverlay);
return function(v1, v2)
    v1 = v1 or {
        OverlayType = nil, 
        Arguments = {}, 
        Configs = {}
    };
    if v2.type == v0.name then
        v1 = {
            OverlayType = v2.overlayType, 
            Arguments = not not v2.arguments and v2.arguments or {}, 
            Configs = not not v2.configs and v2.configs or {}
        };
    end;
    return v1;
end;
