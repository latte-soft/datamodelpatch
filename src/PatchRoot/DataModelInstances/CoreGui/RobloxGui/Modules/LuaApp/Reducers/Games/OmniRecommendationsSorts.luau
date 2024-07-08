local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_Modules_0.LuaApp.Actions.Games.AddOmniRecommendations);
local v4 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedConstants);
local v5 = require(l_Modules_0.LuaApp.Util.Omni.OmniUtils);
local v6 = require(l_CorePackages_0.Logging);
local v7 = require(l_Modules_0.Personalization.Flags.getFFlagLuaAppHomePartialOmniResponse);
local l_GetFFlagLuaAppSortSubtitlesEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppSortSubtitlesEnabled;
return function(v9, v10)
    v9 = v9 or {};
    if v10.type == v3.name then
        if v7() and v10.omniResponseType == v4.OmniResponseType.PartialFeed then
            for v11, v12 in pairs(v9) do
                local v13 = {};
                local v14 = {};
                for _, v16 in ipairs(v12) do
                    local l_v16_0 = v16;
                    if not v10.recommendations[v11] or not v10.recommendations[v11].sorts then
                        table.insert(v14, l_v16_0);
                    elseif not v13[v16.topicId] then
                        local v18 = v5.getSortDataForTopicId(v16.topicId, v10.recommendations[v11].sorts);
                        if v18 then
                            local l_retrievalStatus_0 = v18.retrievalStatus;
                            if l_retrievalStatus_0 == v4.OmniSortRetrievalStatus.Success then
                                l_v16_0 = {
                                    topicId = v16.topicId, 
                                    displayName = v18.topic, 
                                    subtitle = if not l_GetFFlagLuaAppSortSubtitlesEnabled_0() then nil else v16.subtitle, 
                                    treatmentType = v18.treatmentType
                                };
                                v13[v16.topicId] = true;
                            elseif l_retrievalStatus_0 ~= v4.OmniSortRetrievalStatus.Exception then
                                v6.warn("Unexpected retrievalStatus from omni-recommendations API");
                            end;
                        end;
                        table.insert(v14, l_v16_0);
                    end;
                end;
                v9 = v2.Dictionary.join(v9, {
                    [v11] = v14
                });
            end;
            return v9;
        elseif not v7() and v10.isAppend or v7() and v10.omniResponseType == v4.OmniResponseType.Append then
            for v20, v21 in pairs(v10.recommendations) do
                local v22 = {};
                for _, v24 in ipairs(v21.sorts) do
                    table.insert(v22, {
                        displayName = v24.topic, 
                        topicId = v24.topicId, 
                        subtitle = if not l_GetFFlagLuaAppSortSubtitlesEnabled_0() then nil else v24.subtitle, 
                        treatmentType = v24.treatmentType
                    });
                end;
                v9 = v2.Dictionary.join(v9, {
                    [v20] = v2.List.join(v9[v20] or {}, v22)
                });
            end;
            return v9;
        else
            local v25 = {};
            for v26, v27 in pairs(v10.recommendations) do
                v25[v26] = {};
                for _, v29 in ipairs(v27.sorts) do
                    table.insert(v25[v26], {
                        displayName = v29.topic, 
                        topicId = v29.topicId, 
                        subtitle = if not l_GetFFlagLuaAppSortSubtitlesEnabled_0() then nil else v29.subtitle, 
                        treatmentType = v29.treatmentType
                    });
                end;
            end;
            v9 = v2.Dictionary.join(v9, v25);
        end;
    end;
    return v9;
end;
