local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(game:GetService("CorePackages").Cryo);
local v2 = require(l_Modules_0.Personalization.OmniFeed.DataStore.SetGameGridFlexFeedItemInput);
local v3 = require(l_Modules_0.Personalization.OmniFeed.DataStore.ClearGameGridFlexFeedItemBounds);
local _ = require(l_Modules_0.Personalization.DataStoreTypes);
local function v11(v5, v6)
    local v7 = v1.Dictionary.join(v5 or {});
    local v8 = 1;
    for _, v10 in ipairs(v6) do
        v7[v10.sortKey] = {
            firstIndex = v8, 
            numberOfTiles = v10.numberOfTiles
        };
        v8 = v8 + v10.numberOfTiles;
    end;
    return v7;
end;
return function(v12, v13)
    v12 = v12 or {};
    if v13.type == v2.name then
        local v14 = v12[v13.topicId] or {};
        local v15 = v14.flexItemsInput or {};
        local v16 = {};
        local v17 = false;
        for _, v19 in ipairs(v15) do
            if v17 then
                table.insert(v16, v19);
            elseif v19.sortKey == v13.sortIndex then
                table.insert(v16, {
                    sortKey = v13.sortIndex, 
                    numberOfTiles = v13.numberOfTiles
                });
                v17 = true;
            elseif v13.sortIndex < v19.sortKey then
                table.insert(v16, {
                    sortKey = v13.sortIndex, 
                    numberOfTiles = v13.numberOfTiles
                });
                table.insert(v16, v19);
                v17 = true;
            else
                table.insert(v16, v19);
            end;
        end;
        if not v17 then
            table.insert(v16, {
                sortKey = v13.sortIndex, 
                numberOfTiles = v13.numberOfTiles
            });
            v17 = true;
        end;
        return (v1.Dictionary.join(v12, {
            [v13.topicId] = {
                flexItemsInput = v16, 
                flexItemsBounds = v11(v14.flexItemsBounds, v16)
            }
        }));
    else
        if v13.type == v3.name then
            local v20 = v12[v13.topicId] or {};
            local v21 = v20.flexItemsInput or {};
            local v22 = {};
            for _, v24 in ipairs(v21) do
                if v24.sortKey ~= v13.sortIndex then
                    table.insert(v22, v24);
                end;
            end;
            v12 = v1.Dictionary.join(v12, {
                [v13.topicId] = {
                    flexItemsInput = v22, 
                    flexItemsBounds = v11(v20.flexItemsBounds, v22)
                }
            });
        end;
        return v12;
    end;
end;
