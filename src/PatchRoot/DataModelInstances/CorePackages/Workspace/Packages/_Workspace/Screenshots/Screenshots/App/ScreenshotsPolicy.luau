local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.PolicyProvider);
local v2 = v1.GetPolicyImplementations.MemStorageService("app-policy");
local v3 = v1.withGetPolicyImplementation(v2);
local v4 = require(l_Parent_0.Experimentation.getIsFeatureVisibleToDesktopUser);
v3.Mapper = function(v5)
    return {
        eligibleForCapturesFeature = function()
            return v5.EligibleForCapturesFeature or v4();
        end, 
        eligibleForVideoCapture = function()
            return v5.EligibleForVideoCapture or false;
        end, 
        enableCapturesBulkManagement = function()
            return v5.EnableCapturesBulkManagement or false;
        end, 
        enableShareCaptureCTA = function()
            return v5.EnableShareCaptureCTA or false;
        end
    };
end;
v3.PolicyImplementation = v2;
return v3;
