local l_DataLoader_0 = require(script:FindFirstAncestor("GraphQLServer").Parent.DataLoader).DataLoader;
local l_batchFetchThumbnailsByUniverseId_0 = require(script.Parent.Parent.connectors.ExperienceConnector).batchFetchThumbnailsByUniverseId;
local v2 = {
    batchSize = 100, 
    batchDelay = 0
};
return function(v3, v4)
    local v5 = v4 or v2;
    return l_DataLoader_0.new(function(v6)
        return l_batchFetchThumbnailsByUniverseId_0(v6, v3);
    end, {
        maxBatchSize = v5.batchSize, 
        batchScheduleFn = function(v7)
            task.delay(v5.batchDelay, v7);
        end
    });
end;
