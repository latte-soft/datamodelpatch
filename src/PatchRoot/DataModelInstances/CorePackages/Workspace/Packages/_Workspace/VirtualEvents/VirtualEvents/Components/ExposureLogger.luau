local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Parent.RoactAppExperiment);
local v3 = require(l_script_FirstAncestor_0.Hooks.useRefImpression);
local l_useIXPService_0 = v2.useIXPService;
return function(v5)
    local v6 = v1.useRef(nil);
    local v7 = l_useIXPService_0();
    v3(v6, function()
        v7:LogUserLayerExposure(v5.exposureLayer);
        if v5.onExposure then
            v5.onExposure();
        end;
    end);
    return v1.createElement("Frame", {
        Position = UDim2.fromScale(0.5, 0.5), 
        Size = UDim2.fromOffset(0, 0), 
        BackgroundTransparency = 1, 
        ref = v6
    });
end;
