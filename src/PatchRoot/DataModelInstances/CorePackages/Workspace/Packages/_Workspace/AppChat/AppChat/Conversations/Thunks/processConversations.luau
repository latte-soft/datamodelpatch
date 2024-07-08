local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Http.NetworkingChat);
local v3 = require(l_script_FirstAncestor_0.Http.NetworkingPresence);
local l_llama_0 = require(l_Parent_0.LuaSocialLibrariesDeps).llama;
local l_UserModel_0 = require(l_Parent_0.UserLib).Models.UserModel;
local l_AddUsers_0 = require(l_Parent_0.UserLib).Actions.AddUsers;
local v7 = require(l_script_FirstAncestor_0.Flags.isAppChatChannelsAPIEnabled);
local function v22(v8, v9)
    local v10 = {};
    local v11 = {};
    for _, v13 in v8, nil, nil do
        table.insert(v10, v13.id);
        if not v7() or not v13.participant_user_ids then
            for _, v15 in ipairs(v13.participants) do
                if not v11[tostring(v15.targetId)] then
                    local v16 = v9[tostring(v15.targetId)] or l_UserModel_0.fromDataTable({
                        id = v15.targetId, 
                        name = v15.name, 
                        displayName = v15.displayName, 
                        isFriend = false
                    });
                    v11[v16.id] = v16;
                end;
            end;
        else
            for _, v18 in v13.participant_user_ids, nil, nil do
                v18 = tostring(v18);
                if not v11[v18] then
                    local l_user_data_0 = v13.user_data;
                    if l_user_data_0 then
                        local v20 = l_user_data_0[v18];
                        if v20 then
                            local v21 = v9[v18] or l_UserModel_0.fromDataTable({
                                id = v20.id, 
                                name = v20.name, 
                                displayName = v20.display_name, 
                                isFriend = false
                            });
                            v11[v21.id] = v21;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return v10, v11, (l_llama_0.Dictionary.keys(v11));
end;
return function(v23)
    return function(v24)
        if v23 then
            local v25, v26, v27 = v22(v23, v24:getState().Users or {});
            v24:dispatch(l_AddUsers_0(v26));
            if not v7() then
                v24:dispatch(v2.GetLatestMessages.API(v25, 1)):catch(function(v28)
                    warn("NetworkingChat failure in processConversations, Status: " .. tostring(v28));
                end);
            end;
            v24:dispatch(v3.GetPresencesFromUserIds.API(v27)):catch(function(v29)
                warn("NetworkingPresence failure in processConversations, Status: " .. tostring(v29));
            end);
            return ;
        else
            return ;
        end;
    end;
end;
