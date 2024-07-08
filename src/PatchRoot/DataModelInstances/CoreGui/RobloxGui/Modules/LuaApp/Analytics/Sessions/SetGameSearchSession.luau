local l_SessionType_0 = require(game:GetService("CorePackages").Workspace.Packages.RobloxAppSessionization).SessionType;
return function(v1, v2, v3)
    v1:SetSession(l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.StructuralIdentifier.GameSearch, l_SessionType_0.StructuralIdentifier.GameSearch);
    v1:SetMetadata(l_SessionType_0.StructuralIdentifier.GameSearch, l_SessionType_0.Metadata.GameSearch.SearchUuid, v2);
    v1:SetMetadata(l_SessionType_0.StructuralIdentifier.GameSearch, l_SessionType_0.Metadata.GameSearch.SearchKeyword, v3);
end;
