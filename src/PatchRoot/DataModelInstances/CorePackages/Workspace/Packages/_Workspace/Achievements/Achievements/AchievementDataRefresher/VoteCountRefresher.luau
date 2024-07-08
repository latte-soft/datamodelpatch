local l_script_FirstAncestor_0 = script:FindFirstAncestor("Achievements");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.Signal);
local v3 = require(l_script_FirstAncestor_0.Logger);
local v4 = require(l_script_FirstAncestor_0.Requests.GetUserVoteCount);
local v5 = require(l_Parent_0.Promise);
local _ = require(l_Parent_0.LuauPolyfill);
local v7 = require(l_Parent_0.Dash);
return {
    init = function(v8, v9, v10, v11, v12)
        v8.fireVoteCountChanged = v9;
        v8.store = v10;
        v8.requestImpl = v11;
        v8.platformCloudStorageService = v12;
    end, 
    start = function(v13)
        v13.storeChangedConnection = v13.store.changed:connect(function(v14, v15)
            local l_LocalUserGameVoteCounter_0 = v15.LocalUserGameVoteCounter;
            local l_LocalUserGameVoteCounter_1 = v14.LocalUserGameVoteCounter;
            if l_LocalUserGameVoteCounter_0 ~= l_LocalUserGameVoteCounter_1 and l_LocalUserGameVoteCounter_1.voteCountSinceAppStart > 0 then
                v13:_checkPollster(l_LocalUserGameVoteCounter_1.lastUniverseId):catch(function(v18)
                    v3:warning(v18);
                end);
            end;
        end);
    end, 
    _checkPollster = function(v19, v20)
        if not v19.platformCloudStorageService or not v19.platformCloudStorageService:IsUserDataAvailable() then
            return v4(v19.requestImpl):andThen(function(v21)
                if v21.responseBody == nil then
                    v3:warning("Response has no body.");
                    return ;
                else
                    local l_voteCount_0 = v21.responseBody.voteCount;
                    if l_voteCount_0 == nil then
                        v3:warning("Response has no voteCount field.");
                        return ;
                    else
                        v19.fireVoteCountChanged(l_voteCount_0);
                        return ;
                    end;
                end;
            end);
        else
            return v5.new(function()
                local v23 = v19.platformCloudStorageService:GetUserDataAsync("UniversesVoted").data or {};
                if not (not (#v23 < 5) or v7.includes(v23, v20)) then
                    table.insert(v23, v20);
                    v19.platformCloudStorageService:SetUserDataAsync("UniversesVoted", {
                        data = v23
                    });
                end;
                v19.fireVoteCountChanged(#v23);
            end);
        end;
    end, 
    stop = function(v24)
        if v24.storeChangedConnection then
            v24.storeChangedConnection:disconnect();
            v24.storeChangedConnection = nil;
        end;
    end
};
