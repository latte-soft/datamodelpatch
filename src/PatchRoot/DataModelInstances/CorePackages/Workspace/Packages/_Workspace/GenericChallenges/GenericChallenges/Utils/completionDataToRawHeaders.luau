local v0 = require(script.Parent.constants);
local v1 = require(script.Parent.Base64);
local l_HttpService_0 = game:GetService("HttpService");
return function(v3)
    assert(v3.challengeId ~= nil, "challenge id must not be nil");
    assert(v3.challengeType ~= nil, "challenge type must not be nil");
    assert(v3.metadata ~= nil, "metadata must not be nil");
    return {
        [v0.challengeIdHeader] = v3.challengeId, 
        [v0.challengeTypeHeader] = v3.challengeType, 
        [v0.challengeMetadataHeader] = v1.Encode(l_HttpService_0:JSONEncode(v3.metadata))
    };
end;
