local l_Parent_0 = script:FindFirstAncestor("DiscoveryOtaPatch").Parent;
local l_requireOtaPackage_0 = require(l_Parent_0.OtaPatchLoader).requireOtaPackage;
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local l_OtaPatchName_0 = require(l_Parent_0.RobloxAppEnums).OtaPatchName;
local l_FFlagLuaAppAddDiscoveryOtaVersion_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddDiscoveryOtaVersion;
local v5 = game:DefineFastString("DiscoveryOtaBehavior", "app-patch-discovery");
return function(v6, v7, v8, v9)
    return l_requireOtaPackage_0(v6, v7, v8, {
        patchName = not l_FFlagLuaAppAddDiscoveryOtaVersion_0 and "discovery-ota" or l_OtaPatchName_0.DiscoveryOta, 
        patchBehavior = v5, 
        patchConfig = "rbxasset://configs/OtaPatchConfigs/DiscoveryOtaPatchConfig.json", 
        patchPackagesRoot = {
            "DataModelInstances", 
            "OtaPatch", 
            "Packages"
        }, 
        patchStarterScriptPath = {
            "DataModelInstances", 
            "OtaPatch", 
            "DiscoveryOtaStarterScript"
        }
    }, l_default_0, v9);
end;
