local v0 = require(script:FindFirstAncestor("GenericChallenges").Utils.constants);
return function(v1, v2)
    local v3 = false;
    if v1 == v0.forbiddenStatusCode then
        v3 = false;
        if v2[v0.challengeTypeHeader] ~= nil then
            v3 = false;
            if v2[v0.challengeIdHeader] ~= nil then
                v3 = v2[v0.challengeMetadataHeader] ~= nil;
            end;
        end;
    end;
    return v3;
end;
