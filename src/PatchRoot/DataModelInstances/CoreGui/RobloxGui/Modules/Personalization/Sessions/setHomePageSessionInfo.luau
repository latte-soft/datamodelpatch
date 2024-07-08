local l_SessionType_0 = require(game:GetService("CorePackages").Workspace.Packages.RobloxAppSessionization).SessionType;
return function(v1, v2, v3)
    if v1 == nil then
        return ;
    else
        v1:SetSession(l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.StructuralIdentifier.HomePageSessionInfo, l_SessionType_0.StructuralIdentifier.HomePageSessionInfo);
        if v2 then
            v1:SetMetadata(l_SessionType_0.StructuralIdentifier.HomePageSessionInfo, l_SessionType_0.Metadata.HomePageSessionInfo.RequestId, v2);
        end;
        if v3 then
            v1:SetMetadata(l_SessionType_0.StructuralIdentifier.HomePageSessionInfo, l_SessionType_0.Metadata.HomePageSessionInfo.OmniSessionId, v3);
        end;
        return ;
    end;
end;
