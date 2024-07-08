local l_Parent_0 = script:FindFirstAncestor("GraphQLServer").Parent;
local l_DataLoader_0 = require(l_Parent_0.DataLoader).DataLoader;
local v2 = require(l_Parent_0.Cryo);
local l_fetchProfilesByIds_0 = require(script.Parent.Parent.connectors.UserProfileConnector).fetchProfilesByIds;
local v4 = {};
v4.__index = v4;
local v5 = game:DefineFastInt("UserProfilesDataLoaderClearTime_v1", 15);
local l_getFFlagRemoveDataLoaderTimer_0 = require(l_Parent_0.SharedFlags).getFFlagRemoveDataLoaderTimer;
v4.new = function()
    local v7 = {
        loader = nil, 
        lastTime = 0, 
        fieldsSet = {}, 
        dataLoaderOptions = {
            batchSize = 50, 
            batchDelay = 0
        }
    };
    setmetatable(v7, v4);
    return v7;
end;
convertToSet = function(v8)
    local v9 = {};
    for _, v11 in v8, nil, nil do
        v9[v11] = true;
    end;
    return v9;
end;
v4.getFields = function(v12)
    local v13 = {};
    for v14, _ in v12.fieldsSet, nil, nil do
        table.insert(v13, v14);
    end;
    return v13;
end;
v4.makeDataLoader = function(v16, v17, v18, v19)
    v16.fieldsSet = v2.Dictionary.join(v16.fieldsSet, convertToSet(v18));
    local v20 = v19 or v16.dataLoaderOptions;
    return l_DataLoader_0.new(function(v21)
        return l_fetchProfilesByIds_0(v21, v16:getFields(), v17);
    end, {
        cache = true, 
        maxBatchSize = v20.batchSize, 
        batchScheduleFn = function(v22)
            task.delay(v20.batchDelay, v22);
        end
    });
end;
v4.getLoader = function(v23, v24, v25, v26)
    v23.fieldsSet = v2.Dictionary.join(v23.fieldsSet, convertToSet(v25));
    local v27 = os.clock();
    local v28 = if not l_getFFlagRemoveDataLoaderTimer_0() then v5 < v27 - v23.lastTime else false;
    if not (v23.loader and not v28) then
        v23.lastTime = v27;
        v23.loader = v23:makeDataLoader(v24, v25, v26);
    end;
    return v23.loader;
end;
return v4;
