local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Models.UserSearchEntry);
local v3 = require(l_Modules_0.LuaApp.Actions.AddUsersSearchResults);
local v4 = require(l_Modules_0.LuaApp.Thunks.ApiFetchFriendStatuses);
local v5 = require(l_Modules_0.LuaApp.Thunks.ApiFetchFriendFollowings);
local v6 = require(l_Modules_0.LuaApp.Promise);
local l_FFlagUserSearchUseNewEndpointIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUserSearchUseNewEndpointIXP;
return function(v8, v9, v10)
    return function(v11)
        if v10 and v10.responseBody then
            local v12 = if not not l_FFlagUserSearchUseNewEndpointIXP_0 and v9.shouldUseOmniSearchEndpoint then v10.responseBody.nextPageToken else v10.responseBody.nextPageCursor;
            if not v12 or v12 == "" then
                v12 = "EndOfPlayerSearch";
            end;
            local v13 = {};
            local v14 = {};
            local v15 = {};
            local l_FriendStatuses_0 = v11:getState().FriendStatuses;
            local l_FriendFollowings_0 = v11:getState().FriendFollowings;
            local v18 = nil;
            v18 = if not not l_FFlagUserSearchUseNewEndpointIXP_0 and v9.shouldUseOmniSearchEndpoint then (v10.responseBody.searchResults and v10.responseBody.searchResults[1]) and v10.responseBody.searchResults[1].contents else v10.responseBody.data;
            if v18 then
                for v19 = 1, #v18 do
                    local v20 = v18[v19];
                    (if not not l_FFlagUserSearchUseNewEndpointIXP_0 and v9.shouldUseOmniSearchEndpoint then v2.fromOmniJsonData(v20) else v2.fromJsonData(v20)):match(function(v21)
                        table.insert(v13, v21);
                        local l_id_0 = v21.id;
                        if l_FriendStatuses_0[l_id_0] == nil then
                            table.insert(v14, l_id_0);
                        end;
                        if l_FriendFollowings_0[l_id_0] == nil then
                            table.insert(v15, l_id_0);
                        end;
                    end):matchError(function(_)
                        warn("Failure in parsing UserSearchEntry");
                    end);
                end;
            end;
            v11:dispatch(v3(v9.searchKeyword, v12, v13));
            if #v14 > 0 then
                v11:dispatch(v4(v8, v14));
            end;
            if #v15 > 0 then
                v11:dispatch(v5(v8, v15));
            end;
            return v6.resolve(v10);
        else
            return v6.reject();
        end;
    end;
end;
