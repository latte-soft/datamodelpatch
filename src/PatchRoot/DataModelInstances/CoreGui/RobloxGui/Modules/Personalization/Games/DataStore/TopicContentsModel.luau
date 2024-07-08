local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Personalization.Games.DataStore.TopicContentsEntryModel);
local _ = require(l_Modules_0.Personalization.DataStoreTypes);
local v3 = {
    new = function()
        return {
            entries = {}, 
            rowsRequested = 0, 
            hasMoreRows = false, 
            nextPageExclusiveStartId = 0, 
            updatedTimestamp = nil, 
            nextPageToken = ""
        };
    end
};
v3.mock = function()
    local v4 = v3.new();
    v4.entries = {
        v1.mock()
    };
    v4.rowsRequested = 1;
    v4.hasMoreRows = false;
    v4.nextPageExclusiveStartId = 0;
    v4.updatedTimestamp = nil;
    v4.nextPageToken = "";
    return v4;
end;
v3.fromData = function(v5)
    return {
        entries = v5.entries, 
        rowsRequested = v5.rowsRequested, 
        hasMoreRows = v5.hasMoreRows, 
        nextPageExclusiveStartId = v5.nextPageExclusiveStartId, 
        updatedTimestamp = v5.updatedTimestamp, 
        nextPageToken = not v5.nextPageToken and "" or v5.nextPageToken
    };
end;
v3.fromContentList = function(v6, v7, v8, v9)
    local v10 = v3.new();
    v10.updatedTimestamp = v9;
    v10.entries = {};
    v10.hasMoreRows = false;
    if v6 then
        for _, v12 in ipairs(v6) do
            if not v10.hasMoreRows then
                v1.fromOmniRecommendations(v12):match(function(v13)
                    local v14 = v7(v12.contentType);
                    if v14 ~= nil then
                        local v15 = v8(v13, v14);
                        if v15 ~= nil then
                            table.insert(v10.entries, v15);
                            return ;
                        else
                            v10.hasMoreRows = true;
                        end;
                    end;
                end):matchError(function(v16)
                    warn(v16);
                end);
            else
                return v10;
            end;
        end;
    end;
    return v10;
end;
return v3;
