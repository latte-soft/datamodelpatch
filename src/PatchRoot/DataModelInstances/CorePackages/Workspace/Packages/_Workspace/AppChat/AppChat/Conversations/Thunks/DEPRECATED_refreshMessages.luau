local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Parent.AppChatNetworking);
local v3 = require(l_script_FirstAncestor_0.Http.NetworkingChat);
local l_DateTime_0 = require(l_Parent_0.Time).DateTime;
local v5 = require(l_script_FirstAncestor_0.Flags.isAppChatChannelsAPIEnabled);
local function _(v6, v7)
    return v6.messages:Get(v7) ~= nil;
end;
local function v18(v9, v10, v11)
    local v12 = nil;
    v12 = function(v13)
        local l_responseBody_0 = v13.responseBody;
        local v15 = l_responseBody_0[#l_responseBody_0];
        if not ((not l_responseBody_0 or not l_responseBody_0[30]) or v10.messages:Get(v15.id) ~= nil) then
            v9:dispatch(v3.GetMessages.API(v10.id, 30, v15.id)):andThen(v12):catch(function(v16)
                warn("NetworkingChat failure in refreshing new messages", v16);
            end);
        end;
    end;
    v9:dispatch(v3.GetMessages.API(v10.id, 30, v11)):andThen(v12):catch(function(v17)
        warn("NetworkingChat failure in refreshing new messages", v17);
    end);
end;
local function v30(v19, v20, _)
    local v22 = nil;
    v22 = function(v23)
        if v23.responseBody then
            local l_responseBody_1 = v23.responseBody;
            local l_messages_0 = l_responseBody_1.messages;
            local v26 = (not not l_responseBody_1.next_cursor and l_responseBody_1.next_cursor ~= "") and l_responseBody_1.next_cursor or nil;
            local v27 = (not not l_messages_0 and #l_messages_0 > 0) and l_messages_0[#l_messages_0].id or nil;
            if not ((not v26 or not v27) or v20.messages:Get(v27) ~= nil) then
                v19:dispatch(v2.rodux.GetOlderMessages.API(v20.id, v26)):andThen(v22):catch(function(v28)
                    warn("AppChatNetworking failure in fetchOlderMessages of refreshing new messages", v28);
                end);
            end;
            return ;
        else
            return ;
        end;
    end;
    v19:dispatch(v2.rodux.GetOlderMessages.API(v20.id, nil)):andThen(v22):catch(function(v29)
        warn("AppChatNetworking failure in refreshing first batch of new messages", v29);
    end);
end;
return function(v31, v32)
    return v32:dispatch(v3.GetLatestMessages.API({
        v31.id
    }, 1)):andThen(function(v33)
        local v34 = (not not v33.responseBody and v33.responseBody[1]) and v33.responseBody[1].chatMessages or {};
        local v35 = false;
        if v31.messages and v31.messages:Length() > 0 then
            local l_UnixTimestamp_0 = v31.messages:Last().sent:GetUnixTimestamp();
            for _, v38 in ipairs(v34) do
                if l_UnixTimestamp_0 < l_DateTime_0.fromIsoDate(v38.sent):GetUnixTimestamp() then
                    v35 = true;
                    break;
                end;
            end;
            if v35 then
                if not v5() then
                    v18(v32, v31, v34[1].id);
                else
                    v30(v32, v31, v34[1].id);
                    return v35;
                end;
            end;
            return v35;
        else
            return #v34 > 0;
        end;
    end):catch(function(v39)
        warn("NetworkingChat failure in GetNewMessages", v39);
    end);
end;
