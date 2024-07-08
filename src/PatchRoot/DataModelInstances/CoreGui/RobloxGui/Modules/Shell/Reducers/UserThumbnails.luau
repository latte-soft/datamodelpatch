local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Immutable);
local v2 = require(l_Modules_0.Shell.Actions.FetchUserThumbnail);
local v3 = require(l_Modules_0.Shell.Actions.SetUserThumbnail);
local v4 = require(l_Modules_0.Shell.Actions.ResetUserThumbnails);
return function(v5, v6)
    v5 = v5 or {};
    assert(v5, "");
    if v6.type == v2.name then
        local v7 = table.concat({
            v6.rbxuid, 
            v6.thumbnailType.Name, 
            v6.thumbnailSize.Name
        });
        return (v1.Set(v5, v7, (v1.Set(v5[v7] or {}, "isFetching", true))));
    elseif v6.type == v3.name then
        local v8 = table.concat({
            v6.rbxuid, 
            v6.thumbnailType.Name, 
            v6.thumbnailSize.Name
        });
        local v9 = v5[v8] or {};
        if not v6.success or not v6.isFinal then
            return (v1.Set(v5, v8, v1.JoinDictionaries(v9, {
                fetchSuccess = false, 
                isFetching = false, 
                lastUpdated = v6.timestamp
            })));
        else
            return (v1.Set(v5, v8, v1.JoinDictionaries(v9, {
                fetchSuccess = true, 
                isFetching = false, 
                imageUrl = v6.imageUrl, 
                lastUpdated = v6.timestamp
            })));
        end;
    else
        if v6.type == v4.name then
            v5 = {};
        end;
        return v5;
    end;
end;
