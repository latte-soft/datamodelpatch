local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactImporter");
local v1 = require(l_script_FirstAncestor_0.devDependencies);
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_jest_0 = v1.jest;
local l_Promise_0 = v2.Promise;
return function()
    return {
        default = {
            sendSMS = l_jest_0.fn().mockReturnValue(l_Promise_0.resolve(true)), 
            supportsSMS = l_jest_0.fn().mockReturnValue(l_Promise_0.resolve(true)), 
            switchToSettingsApp = l_jest_0.fn().mockReturnValue(l_Promise_0.resolve()), 
            supportsSwitchToSettingsApp = l_jest_0.fn().mockReturnValue(l_Promise_0.resolve(true))
        }
    };
end;
