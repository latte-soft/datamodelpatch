local l_HttpService_0 = game:GetService("HttpService");
local l_SessionType_0 = require(game:GetService("CorePackages").Workspace.Packages.RobloxAppSessionization).SessionType;
return {
    generateUuid = function()
        return l_HttpService_0:GenerateGUID(true);
    end, 
    create = function(v2, v3, v4, v5)
        local v6 = true;
        if v2:SessionExists(l_SessionType_0.StructuralIdentifier.OmniSearch) and v2:GetMetadata(l_SessionType_0.StructuralIdentifier.OmniSearch, l_SessionType_0.Metadata.OmniSearch.OmniSearchUuid) == v3 then
            v6 = false;
        end;
        if v6 then
            v2:SetSession(l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.StructuralIdentifier.OmniSearch, l_SessionType_0.StructuralIdentifier.OmniSearch);
            v2:SetMetadata(l_SessionType_0.StructuralIdentifier.OmniSearch, l_SessionType_0.Metadata.OmniSearch.OmniSearchUuid, v3);
        end;
        v2:SetMetadata(l_SessionType_0.StructuralIdentifier.OmniSearch, l_SessionType_0.Metadata.OmniSearch.SearchKeyword, v4);
        v2:SetMetadata(l_SessionType_0.StructuralIdentifier.OmniSearch, l_SessionType_0.Metadata.OmniSearch.SearchType, v5);
    end, 
    updateSearchType = function(v7, v8)
        if v7:SessionExists(l_SessionType_0.StructuralIdentifier.OmniSearch) then
            v7:SetMetadata(l_SessionType_0.StructuralIdentifier.OmniSearch, l_SessionType_0.Metadata.OmniSearch.SearchType, v8);
        end;
    end
};
