local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericChallenges");
local v1 = require(l_script_FirstAncestor_0.Utils.constants);
local v2 = require(l_script_FirstAncestor_0.Types.GenericType);
local v3 = require(l_script_FirstAncestor_0.Utils.Base64);
local l_HttpService_0 = game:GetService("HttpService");
local v5 = {};
v5.__index = v5;
v5.new = function(v6)
    local v7 = {
        challengeId = v6[v1.challengeIdHeader]
    };
    local v8 = v3.Decode(v6[v1.challengeMetadataHeader]);
    v7.challengeMetadata = {
        raw = v6[v1.challengeMetadataHeader], 
        decoded = v8, 
        typed = l_HttpService_0:JSONDecode(v8)
    };
    v7.challengeType = {
        raw = v6[v1.challengeTypeHeader], 
        typed = v2.fromRawValue(v6[v1.challengeTypeHeader])
    };
    return (setmetatable(v7, v5));
end;
return v5;
