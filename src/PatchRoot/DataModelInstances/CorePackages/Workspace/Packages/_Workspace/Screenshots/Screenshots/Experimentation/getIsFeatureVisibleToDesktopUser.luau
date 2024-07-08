local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Players_0 = game:GetService("Players");
local l_IXPServiceWrapper_0 = require(l_Parent_1.IXPServiceWrapper).IXPServiceWrapper;
local v4 = require(l_Parent_0.Utils.getLocalUserId);
local l_FFlagEnableCapturesDesktopExperiment_0 = require(l_Parent_1.SharedFlags).FFlagEnableCapturesDesktopExperiment;
local v6 = require(l_Parent_0.Flags.FStringCapturesForDesktopEnabledIXPTreatmentKey);
local l_FStringCapturesIXPLayer_0 = require(l_Parent_1.SharedFlags).FStringCapturesIXPLayer;
return function(v8)
    if l_FFlagEnableCapturesDesktopExperiment_0 then
        if v8 then
            l_IXPServiceWrapper_0 = v8;
        end;
        local v9 = v4(l_Players_0);
        if v9 then
            assert(v9 ~= nil, "localUserIdStr must not be nil");
            local v10 = tonumber(v9);
            if v10 then
                assert(v10 ~= nil, "localUserId must not be nil");
                local _ = false;
                local l_l_IXPServiceWrapper_0_LayerData_0 = l_IXPServiceWrapper_0:GetLayerData(l_FStringCapturesIXPLayer_0);
                if l_l_IXPServiceWrapper_0_LayerData_0 then
                    assert(l_l_IXPServiceWrapper_0_LayerData_0 ~= nil, "layerData must not be nil");
                    return l_l_IXPServiceWrapper_0_LayerData_0[v6] or false;
                else
                    return false;
                end;
            else
                return false;
            end;
        else
            return false;
        end;
    else
        return false;
    end;
end;
