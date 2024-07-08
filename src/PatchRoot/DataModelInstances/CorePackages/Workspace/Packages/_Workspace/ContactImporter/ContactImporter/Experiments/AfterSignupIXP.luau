local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_IXPService_0 = game:GetService("IXPService");
local l_useUserExperiment_0 = require(l_Parent_1.RoactAppExperiment).useUserExperiment;
local v4 = require(l_Parent_0.Flags.FStringPVCIAfterSignupLayer);
local v5 = require(l_Parent_0.Flags.FStringPVCIAfterSignupVariantKey);
local v6 = game:DefineFastFlag("PVAndCIAfterSignupExperimentEnabled", false);
local v7 = game:DefineFastFlag("DEVPVAndCIAfterSignupDevelopmentEnabled", false);
local v8 = game:DefineFastString("DEVPVAndCIAfterSignupDevelopmentVariant", "control");
local function v10(v9)
    return (v9[v4] or {})[v5];
end;
return {
    FFlagPVandCIAfterSignupExperimentEnabled = v6, 
    usePVAndCIAfterSignupVariant = function(v11)
        local v12 = l_useUserExperiment_0({
            v4
        }, v10, (v11 or {
            isExposureEnabled = false
        }).isExposureEnabled);
        if not v7 then
            return v12;
        else
            return v8;
        end;
    end, 
    logExposure = function()
        l_IXPService_0:LogUserLayerExposure(v4);
    end
};
