game:DefineFastFlag("InternationalNamesIXPSetupEnabled_v2", false);
game:DefineFastFlag("InternationalNamesIXPEnabled", false);
game:DefineFastFlag("InternationalNamesEnabledForAll", false);
local v0 = game:DefineFastString("InternationalNamesIXPLayer", "Social.InternationalDisplayName");
local v1 = game:DefineFastString("InternationalNamesIXPExperimentDefinition", "enableInternationalNames");
local l_IXPService_0 = game:GetService("IXPService");
local l_useUserExperiment_0 = require(script:FindFirstAncestor("EditProfile").Parent.RoactAppExperiment).useUserExperiment;
local function v4()
    return game:GetFastFlag("InternationalNamesIXPSetupEnabled_v2");
end;
local function _()
    return game:GetFastFlag("InternationalNamesIXPEnabled");
end;
local function _()
    return game:GetFastFlag("InternationalNamesEnabledForAll");
end;
local function v10(v7)
    local v8 = (v7 or {})[v0] or {};
    local v9;
    if game:GetFastFlag("InternationalNamesIXPEnabled") then
        v9 = true;
        if not (v8[v1] ~= true) then
            goto label0;
        end;
    end;
    v9 = game:GetFastFlag("InternationalNamesEnabledForAll");
    ::label0::;
    return v9;
end;
return {
    FFlagIsSetupEnabled = v4, 
    FFlagIsExperimentEnabled = v10, 
    useIsExperimentEnabled = function(v11)
        return l_useUserExperiment_0({
            v0
        }, v10, (v11 or {
            isExposureEnabled = false
        }).isExposureEnabled);
    end, 
    logExposure = function()
        l_IXPService_0:LogUserLayerExposure(v0);
    end
};
