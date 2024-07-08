local l_Parent_0 = script:FindFirstAncestor("ApolloLocalState").Parent;
local l_GetFFlagApolloClientFetchThumbnails_0 = require(l_Parent_0.SharedFlags).GetFFlagApolloClientFetchThumbnails;
local l_GetFFlagApolloClientFetchExperiences_0 = require(l_Parent_0.SharedFlags).GetFFlagApolloClientFetchExperiences;
local l_GetFFlagEnableMergeOmniFeedSorts_0 = require(script.Parent.Parent.Flags).GetFFlagEnableMergeOmniFeedSorts;
local _ = require(l_Parent_0.ApolloClient);
local v5 = require(script.Parent.utils.makeMergeOverlappingArraysPolicy);
local v6 = require(script.Parent.utils.makeDefaultReadPolicy);
return {
    keyFields = if not l_GetFFlagApolloClientFetchThumbnails_0() then nil else {
        "topicId"
    }, 
    fields = {
        topicLayoutData = {
            read = v6({})
        }, 
        recommendations = {
            read = v6({}), 
            merge = if not l_GetFFlagEnableMergeOmniFeedSorts_0() then nil else v5("contentId")
        }, 
        experiences = {
            merge = if not l_GetFFlagApolloClientFetchExperiences_0() then nil else function(_, v8, v9, v10)
                if v8 == nil then
                    return v9;
                else
                    local v11 = {};
                    local v12 = {};
                    for v13, v14 in v8, nil, nil do
                        v11[v10:readField("universeId", v14)] = v13;
                        table.insert(v12, v14);
                    end;
                    for _, v16 in v9, nil, nil do
                        local v17 = v10:readField("universeId", v16);
                        if v11[v17] == nil then
                            table.insert(v12, v16);
                        else
                            v12[v11[v17]] = v16;
                        end;
                    end;
                    return v12;
                end;
            end
        }, 
        hasMoreRows = {
            read = if not l_GetFFlagApolloClientFetchExperiences_0() then nil else function(_, _, v20)
                local v21 = v20:readField("experiences");
                local v22 = v20:readField("recommendations");
                if v22 == nil then
                    return false;
                elseif v21 == nil then
                    return #v22 > 0;
                else
                    return #v21 < #v22;
                end;
            end
        }
    }
};
