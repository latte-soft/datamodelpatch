local v0 = require(script.Parent.SessionType);
return function(v1, v2, v3)
    assert(v1, "sessionManager can't be nil");
    v1:RemoveSessionsWithMetadataKey(v0.Metadata.GamePlay.GamePlaySession);
    v1:SetSession(v0.StructuralIdentifier.Level1, v2, v2);
    v1:SetMetadata(v2, v0.Metadata.GamePlay.GamePlaySession, "True");
    if v3 then
        v1:SetMetadata(v2, v0.Metadata.GamePlay.DeleteOnGameLeave, "True");
    end;
end;
