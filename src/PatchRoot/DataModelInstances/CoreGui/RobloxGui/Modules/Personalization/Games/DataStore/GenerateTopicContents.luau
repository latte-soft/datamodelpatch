local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_Modules_0.Personalization.Games.DataStore.TopicContentsModel);
local v4 = require(l_Modules_0.LuaApp.Util.Omni.OmniUtils);
local v5 = require(l_Modules_0.Personalization.Games.DataStore.AddTopicContents);
local _ = require(l_Modules_0.Personalization.DataStoreTypes);
local function _(v7)
    return function(v8)
        return v4.storeForContentType(v7:getState(), v8);
    end;
end;
local function _()
    return function(v10, v11)
        local v12 = v11[v10.contentId];
        if v12 ~= nil then
            return (v2.Dictionary.join(v12, v10));
        else
            return nil;
        end;
    end;
end;
local function _(v14, v15, v16, v17)
    if not v14 then
        return nil;
    else
        return v3.fromContentList(v14, v15, v16, v17);
    end;
end;
return function(v19, v20, v21)
    return function(v22)
        local v23 = v22:getState();
        local function v25(v24)
            return v4.storeForContentType(v22:getState(), v24);
        end;
        local function v29(v26, v27)
            local v28 = v27[v26.contentId];
            if v28 ~= nil then
                return (v2.Dictionary.join(v28, v26));
            else
                return nil;
            end;
        end;
        local v30 = v23.OmniRecommendations[v19];
        local v31 = {};
        for _, v33 in ipairs(v30.sorts) do
            if v33.topicId then
                local v34 = tostring(v33.topicId);
                if not (v20 ~= nil) or v20 == v33.topicId then
                    local l_recommendations_0 = v33.recommendations;
                    local v36 = if not l_recommendations_0 then nil else v3.fromContentList(l_recommendations_0, v25, v29, v21);
                    if v36 then
                        if not v31[v34] then
                            v22:dispatch(v5(v34, v36));
                            v31[v34] = true;
                        else
                            v22:dispatch(v5(v34, v36, true));
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
