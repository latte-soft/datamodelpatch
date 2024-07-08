local l_game_EngineFeature_0 = game:GetEngineFeature("AXMarketplaceRecentSearchesStorageKey");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(script:FindFirstAncestor("AvatarExperienceSearch").Flags.GetFIntAXMaxRecentSearchTerms);
local l_l_AppStorageService_0_0 = l_AppStorageService_0;
local function v11()
    return {
        storage = {}, 
        GetItem = function(v5, v6)
            return v5.storage[v6];
        end, 
        SetItem = function(v7, v8, v9)
            v7.storage[v8] = v9;
        end, 
        Flush = function(_)
        end
    };
end;
if not l_game_EngineFeature_0 then
    l_l_AppStorageService_0_0 = v11();
end;
local function v14()
    local v12 = l_l_AppStorageService_0_0:GetItem("AXMarketplaceRecentSearches") or "{}";
    local v13 = {};
    pcall(function()
        v13 = l_HttpService_0:JSONDecode(v12);
    end);
    return v13;
end;
local function v19(v15)
    local v16 = v14();
    for v17, v18 in v16, nil, nil do
        if string.lower(v18) == string.lower(v15) then
            table.remove(v16, v17);
            return v16;
        end;
    end;
    return v16;
end;
local function _(v20)
    l_l_AppStorageService_0_0:SetItem("AXMarketplaceRecentSearches", (l_HttpService_0:JSONEncode(v20)));
    l_l_AppStorageService_0_0:Flush();
end;
return {
    __mockAppStorageService = function(v22)
        l_l_AppStorageService_0_0 = v22 or v11();
    end, 
    clearTerms = function()
        l_l_AppStorageService_0_0:SetItem("AXMarketplaceRecentSearches", "{}");
        l_l_AppStorageService_0_0:Flush();
    end, 
    getTerms = function()
        return (v14());
    end, 
    removeTerm = function(v23)
        if not (v23 ~= nil) or v23 == "" then
            return (v14());
        else
            local v24 = v19(v23);
            l_l_AppStorageService_0_0:SetItem("AXMarketplaceRecentSearches", (l_HttpService_0:JSONEncode(v24)));
            l_l_AppStorageService_0_0:Flush();
            return v24;
        end;
    end, 
    addTerm = function(v25)
        if not (v25 ~= nil) or v25 == "" then
            return (v14());
        else
            local v26 = v19(v25);
            table.insert(v26, 1, v25);
            if v3() < #v26 then
                table.remove(v26);
            end;
            l_l_AppStorageService_0_0:SetItem("AXMarketplaceRecentSearches", (l_HttpService_0:JSONEncode(v26)));
            l_l_AppStorageService_0_0:Flush();
            return v26;
        end;
    end, 
    findTermsForQuery = function(v27)
        local v28 = v14();
        if not (v27 ~= nil) or v27 == "" then
            return v28;
        else
            local v29 = {};
            for _, v31 in v28, nil, nil do
                if string.lower((string.sub(v31, 1, (string.len(v27))))) == string.lower(v27) then
                    table.insert(v29, v31);
                end;
            end;
            return v29;
        end;
    end
};
