local l_VRService_0 = game:GetService("VRService");
local v1 = require(script:FindFirstAncestor("Responsive").Parent.React);
return function()
    local v2, v3 = v1.useState(l_VRService_0.VREnabled);
    v1.useEffect(function()
        v3(l_VRService_0.VREnabled);
        local v4 = l_VRService_0:GetPropertyChangedSignal("VREnabled"):Connect(function()
            v3(l_VRService_0.VREnabled);
        end);
        return function()
            v4:Disconnect();
        end;
    end, {});
    return v2;
end;
