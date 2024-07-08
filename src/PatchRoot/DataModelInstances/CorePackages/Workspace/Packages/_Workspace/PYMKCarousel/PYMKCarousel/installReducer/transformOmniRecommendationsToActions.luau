local l_script_FirstAncestor_0 = script:FindFirstAncestor("PYMKCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_llama_0 = require(l_script_FirstAncestor_0.dependencies).llama;
local v3 = require(l_Parent_0.SocialCommon);
local _ = require(l_script_FirstAncestor_0.Common.OmniTypes);
local v5 = require(script.Parent.getRecommendationsMetadata);
local l_ContextualInfoTypes_0 = v3.Enums.ContextualInfoTypes;
local v7 = require(l_script_FirstAncestor_0.Flags.getFFlagTempFixInfiniteHomePYMK);
local l_FFlagContactRecs_0 = require(l_Parent_0.SharedFlags).FFlagContactRecs;
local function v14(v9, v10)
    local v11 = v9.sorts or {};
    local v13 = l_llama_0.List.findWhere(v11, function(v12)
        return v12.treatmentType == v10;
    end);
    if not v13 then
        return nil;
    else
        return v11[v13];
    end;
end;
return function(v15, v16, v17, v18)
    local v19 = {};
    local l_contentType_0 = v16.contentType;
    local l_treatmentType_0 = v16.treatmentType;
    for _, v23 in pairs(v15) do
        local v24 = v5(v23, l_contentType_0);
        local v25 = v14(v23, l_treatmentType_0);
        local v26 = if not v25 then {} else v25.recommendations or {};
        if not v7() or #v26 ~= 0 then
            if v18 then
                v19 = l_llama_0.List.push(v19, v18(v25, v24));
            end;
            v19 = l_llama_0.List.reduce(v26, function(v27, v28, v29)
                local v30 = v24[if not not l_FFlagContactRecs_0 and v28.contentMetadata.contextType == l_ContextualInfoTypes_0.Contacts then v28.contentStringId else tostring(v28.contentId)];
                local l_contentMetadata_0 = v28.contentMetadata;
                if v30 then
                    if not v17 then
                        return v27;
                    else
                        return l_llama_0.List.push(v27, v17(v30, v29, l_contentMetadata_0));
                    end;
                else
                    return v27;
                end;
            end, v19);
        end;
    end;
    return v19;
end;
