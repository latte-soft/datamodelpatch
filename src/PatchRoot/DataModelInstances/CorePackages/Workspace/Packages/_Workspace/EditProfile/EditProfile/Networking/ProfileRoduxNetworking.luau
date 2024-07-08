local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.LuaSocialLibrariesDeps);
local v3 = require(l_Parent_0.RoduxNetworking);
local l_httpRequest_0 = v2.httpRequest;
return (v3.config({
    keyPath = require(l_script_FirstAncestor_0.Common.Constants).RODUX_KEY .. ".NetworkStatus", 
    networkImpl = l_httpRequest_0.config({
        requestFunction = function(v5, v6, v7)
            return l_httpRequest_0.requestFunctions.RequestInternal(v5, v6, v7);
        end, 
        maxRetryCount = game:DefineFastInt("EditProfileMaxHttpRetries", 5)
    })
}));
