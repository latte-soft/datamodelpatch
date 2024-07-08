local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.enumerate);
local v4 = require(l_Modules_0.LuaApp.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v6 = require(l_Modules_0.LuaApp.Http.Requests.UsersGetUsersSearch);
local v7 = require(l_Modules_0.LuaApp.Http.Requests.SearchGetOmniSearch);
local v8 = require(l_Modules_0.LuaApp.Models.UserSearchEntry);
local v9 = require(l_Modules_0.LuaApp.Actions.AddUsersSearchResults);
local v10 = require(l_Modules_0.LuaApp.Actions.RemoveUsersSearchResults);
local v11 = require(l_Modules_0.LuaApp.Thunks.ApiFetchFriendStatuses);
local v12 = require(l_Modules_0.LuaApp.Thunks.ApiFetchFriendFollowings);
local v13 = require(l_Modules_0.LuaApp.Thunks.Search.HandleUserSearchResults);
local l_FFlagUserSearchUseNewEndpointIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUserSearchUseNewEndpointIXP;
local l_FFlagRefactorOmniSearchFetch_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagRefactorOmniSearchFetch;
local v16 = v3("UsersError", {
    Unknown = 0, 
    TooManyIds = 1, 
    TooManyUsernames = 2, 
    InvalidUserId = 3, 
    TooManyRequests = 4, 
    KeywordFiltered = 5, 
    KeywordTooShort = 6
});
local function _(v17)
    return "luaapp.users.playersearch." .. v17;
end;
return {
    Fetch = function(v19, v20)
        local v21 = nil;
        local v22 = nil;
        local v23 = nil;
        v21 = v20.keyword;
        v22 = v20.isNewSearchInitiated;
        v23 = v20.userSearchSessionId;
        return l_PerformFetch_0.Single("luaapp.users.playersearch." .. v21, function(v24)
            local v25 = nil;
            local v26 = nil;
            if not v22 then
                v25 = v24:getState().UsersSearchResults[v21];
                v26 = not not v25 and v25.nextPageCursor or nil;
            else
                v24:dispatch(v10(v21));
            end;
            if v26 == nil then
                v24:dispatch(v10(v21));
            elseif v26 == "EndOfPlayerSearch" then
                return v4.resolve("Data has been already fetched");
            end;
            return (if not not l_FFlagUserSearchUseNewEndpointIXP_0 and v20.shouldUseOmniSearchEndpoint then v7(v19, {
                searchQuery = v21, 
                pageToken = v26, 
                sessionId = v23, 
                verticalType = "user"
            }) else v6(v19, v21, 25, v26, {
                userSearchSessionId = v23
            })):andThen(function(v27)
                if not l_FFlagRefactorOmniSearchFetch_0 or not v20.shouldUseOmniSearchEndpoint then
                    if not v27 or not v27.responseBody then
                        return v4.reject();
                    else
                        local v28 = if not not l_FFlagUserSearchUseNewEndpointIXP_0 and v20.shouldUseOmniSearchEndpoint then v27.responseBody.nextPageToken else v27.responseBody.nextPageCursor;
                        if not v28 or v28 == "" then
                            v28 = "EndOfPlayerSearch";
                        end;
                        local v29 = {};
                        local v30 = {};
                        local v31 = {};
                        local l_FriendStatuses_0 = v24:getState().FriendStatuses;
                        local l_FriendFollowings_0 = v24:getState().FriendFollowings;
                        local v34 = nil;
                        v34 = if not not l_FFlagUserSearchUseNewEndpointIXP_0 and v20.shouldUseOmniSearchEndpoint then (v27.responseBody.searchResults and v27.responseBody.searchResults[1]) and v27.responseBody.searchResults[1].contents else v27.responseBody.data;
                        if v34 then
                            for v35 = 1, #v34 do
                                local v36 = v34[v35];
                                (if not not l_FFlagUserSearchUseNewEndpointIXP_0 and v20.shouldUseOmniSearchEndpoint then v8.fromOmniJsonData(v36) else v8.fromJsonData(v36)):match(function(v37)
                                    table.insert(v29, v37);
                                    local l_id_0 = v37.id;
                                    if l_FriendStatuses_0[l_id_0] == nil then
                                        table.insert(v30, l_id_0);
                                    end;
                                    if l_FriendFollowings_0[l_id_0] == nil then
                                        table.insert(v31, l_id_0);
                                    end;
                                end):matchError(function(_)
                                    warn("Failure in parsing UserSearchEntry");
                                end);
                            end;
                        end;
                        v24:dispatch(v9(v21, v28, v29));
                        if #v30 > 0 then
                            v24:dispatch(v11(v19, v30));
                        end;
                        if #v31 > 0 then
                            v24:dispatch(v12(v19, v31));
                        end;
                        return v4.resolve(v27);
                    end;
                else
                    return v24:dispatch(v13(v19, {
                        searchKeyword = v21, 
                        searchUuid = v23, 
                        shouldUseOmniSearchEndpoint = v20.shouldUseOmniSearchEndpoint
                    }, v27));
                end;
            end, function(v40)
                if v40.Body and v16.fromRawValue(l_HttpService_0:JSONDecode(v40.Body).errors[1].code) == v16.KeywordFiltered then
                    return v4.resolve();
                else
                    return v4.reject(v40);
                end;
            end);
        end);
    end, 
    GetFetchingStatus = function(v41, v42)
        return l_PerformFetch_0.GetStatus(v41, "luaapp.users.playersearch." .. v42);
    end
};
