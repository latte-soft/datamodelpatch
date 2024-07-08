local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_Modules_0.Personalization.Games.DataStore.AddTopicContents);
local v4 = require(l_Modules_0.LuaApp.Actions.Games.AddGameSorts);
local v5 = require(l_Modules_0.Personalization.Games.DataStore.TopicContentsModel);
local _ = require(l_Modules_0.Personalization.DataStoreTypes);
return function(v7, v8)
    local v9 = v7 or {};
    if v8.type == v4.name then
        local v10 = {};
        for _, v12 in pairs(v8.sorts) do
            v10[v12.name] = v9[v12.name] or v5.new();
        end;
        return (v2.Dictionary.join(v9, v10));
    else
        if v8.type == v3.name then
            local l_topicContents_0 = v8.topicContents;
            local v14 = v9[v8.topicKey];
            if v14 ~= nil then
                if v8.isAppend then
                    l_topicContents_0.entries = v2.List.join(v14.entries, l_topicContents_0.entries);
                end;
                if l_topicContents_0.updatedTimestamp == nil then
                    l_topicContents_0.updatedTimestamp = v14.updatedTimestamp;
                end;
            end;
            if l_topicContents_0.updatedTimestamp == nil then
                l_topicContents_0.updatedTimestamp = tick();
            end;
            v9 = v2.Dictionary.join(v9, {
                [v8.topicKey] = l_topicContents_0
            });
        end;
        return v9;
    end;
end;
