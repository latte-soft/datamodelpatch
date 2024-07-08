local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_script_FirstAncestor_0.Components.ChatConversation.Utils.filterForLinksWithPolicy);
local v5 = require(l_script_FirstAncestor_0.Components.ChatConversation.Utils.messageSortPredicate);
local v6 = require(l_script_FirstAncestor_0.Conversations.populateMessageWithState);
local v7 = {};
local v8 = {};
local v9 = {};
return function(v10, v11)
    local v12 = v2(v10, string.format("ChatAppReducer.Conversations.%s", v11 or ""));
    if v12 and v12.messages then
        if not (v12.messages == v7[v11]) or v12.sendingMessages ~= v9[v11] then
            local v13 = v2(v12.messages, "values");
            local v14 = {};
            if v12.sendingMessages then
                v14 = v2(v12.sendingMessages, "values");
                v13 = v3.Dictionary.join(v13, v14);
            end;
            local v15 = v3.List.sort(v3.Dictionary.values(v13), v5);
            local v16 = {};
            local v17 = nil;
            local v18 = nil;
            v17 = table.clone(v8[v11] or {});
            v18 = if #v17 > 0 and v17[#v17].sent then v17[#v17].sent:GetUnixTimestamp() else math.huge;
            for _, v20 in ipairs(v15) do
                local v21 = not not v14[v20.id] or false;
                for _, v23 in pairs(v4(v20)) do
                    local v24 = v6(v10, v23, v20.id, v12, v16[#v16], v21);
                    local l_messageId_0 = v24.messageId;
                    if not (not v24.sent or v24.sent:GetUnixTimestamp() >= v18) or #v17 == 0 then
                        v24.stable_key = l_messageId_0;
                    else
                        v24.stable_key = table.remove(v17, #v17).stable_key;
                    end;
                    table.insert(v16, v24);
                end;
            end;
            v7[v11] = v12.messages;
            v9[v11] = v12.sendingMessages;
            v8[v11] = v3.List.reverse(v16);
        end;
        return v8[v11];
    else
        return {};
    end;
end;
