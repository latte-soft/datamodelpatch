local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_script_FirstAncestor_0.Http.NetworkingFriends);
local v4 = require(l_script_FirstAncestor_0.Http.NetworkingPresence);
local v5 = require(l_Parent_0.Promise);
local v6 = require(l_script_FirstAncestor_0.Http.RoduxNetworking);
local l_AddUsers_0 = require(l_Parent_0.UserLib).Actions.AddUsers;
local l_SetUserIsFriend_0 = require(l_Parent_0.UserLib).Actions.SetUserIsFriend;
local l_UserModel_0 = require(l_Parent_0.UserLib).Models.UserModel;
local l_llama_0 = require(l_Parent_0.LuaSocialLibrariesDeps).llama;
return function()
    return function(v11)
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        assert(l_LocalPlayer_0, "Local Player not found");
        local l_UserId_0 = l_LocalPlayer_0.UserId;
        if v3.GetFriendsFromUserId.getStatus(v11:getState(), l_UserId_0) == v6.Enum.NetworkStatus.Fetching then
            return v5.resolve({});
        else
            return v11:dispatch(v3.GetFriendsFromUserId.API(l_UserId_0)):andThen(function(v14)
                local l_responseBody_0 = v14.responseBody;
                local v16 = v11:getState().Users or {};
                local v17 = {};
                for _, v19 in ipairs(l_responseBody_0) do
                    local v20 = tostring(v19.id);
                    if v16[v20] == nil then
                        v17[v20] = l_UserModel_0.fromDataTable({
                            id = v19.id, 
                            name = v19.name, 
                            displayName = v19.displayName, 
                            isFriend = true
                        });
                    else
                        v11:dispatch(l_SetUserIsFriend_0(v20, v19.isFriend));
                    end;
                end;
                local v21 = l_llama_0.Dictionary.keys(v17);
                v11:dispatch(l_AddUsers_0(v17));
                v11:dispatch(v4.GetPresencesFromUserIds.API(v21)):catch(function(v22)
                    warn("NetworkingPresence failure in getAllFriendsAsync, Status: " .. tostring(v22));
                end);
                return v14;
            end):catch(function(v23)
                warn("NetworkingFriends failure in getAllFriendsAsync, Status: " .. tostring(v23));
            end);
        end;
    end;
end;
