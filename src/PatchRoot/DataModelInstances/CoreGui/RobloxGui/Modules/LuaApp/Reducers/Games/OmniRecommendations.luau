local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Actions.Games.AddOmniRecommendations);
local v3 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedConstants);
local v4 = require(l_CorePackages_0.Cryo);
local v5 = require(l_CorePackages_0.Logging);
local v6 = require(l_Modules_0.LuaApp.Util.Omni.OmniUtils);
local v7 = require(l_Modules_0.Personalization.Flags.getFFlagLuaAppHomePartialOmniResponse);
return function(v8, v9)
    v8 = v8 or {};
    if v9.type == v2.name then
        if not v7() and v9.isAppend or v7() and v9.omniResponseType == v3.OmniResponseType.Append then
            for v10, v11 in pairs(v9.recommendations) do
                local v12 = v8[v10];
                if v12 then
                    local v13 = v4.List.join(v12.sorts, v11.sorts);
                    local v14 = v4.Dictionary.join(v12, v11);
                    v14.sorts = v13;
                    local v15 = v4.Dictionary.join({}, v12.metadata);
                    for v16, v17 in pairs(v12.metadata) do
                        if not v15[v16] then
                            v15[v16] = {};
                        end;
                        v15[v16] = v4.Dictionary.join(v15[v16], v17);
                    end;
                    v14.metadata = v15;
                    v8 = v4.Dictionary.join(v8, {
                        [v10] = v14
                    });
                end;
            end;
            return v8;
        elseif v7() and v9.omniResponseType == v3.OmniResponseType.PartialFeed then
            for v18, v19 in pairs(v8) do
                local v20 = {};
                local v21 = {};
                local v22 = v4.Dictionary.join({}, v19);
                for v23 = 1, #v19.sorts do
                    local v24 = v19.sorts[v23];
                    local l_topicId_0 = v24.topicId;
                    local l_v24_0 = v24;
                    if not l_topicId_0 or not v9.recommendations[v18] then
                        table.insert(v21, l_v24_0);
                    elseif not v20[l_topicId_0] then
                        local v27 = v6.getSortDataForTopicId(l_topicId_0, v9.recommendations[v18].sorts);
                        if v27 then
                            local l_retrievalStatus_0 = v27.retrievalStatus;
                            if l_retrievalStatus_0 == v3.OmniSortRetrievalStatus.Success then
                                l_v24_0 = v27;
                                v20[l_topicId_0] = true;
                            elseif l_retrievalStatus_0 ~= v3.OmniSortRetrievalStatus.Exception then
                                v5.warn("Unexpected retrievalStatus from omni-recommendations API");
                            end;
                        end;
                        table.insert(v21, l_v24_0);
                    end;
                end;
                v22.sorts = v21;
                v8 = v4.Dictionary.join(v8, {
                    [v18] = v22
                });
            end;
            return v8;
        else
            v8 = v4.Dictionary.join(v8, v9.recommendations);
        end;
    end;
    return v8;
end;
