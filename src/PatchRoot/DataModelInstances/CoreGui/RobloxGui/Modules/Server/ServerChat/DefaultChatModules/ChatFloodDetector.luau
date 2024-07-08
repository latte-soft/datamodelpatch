local l_ChatConstants_0 = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatConstants"));
local v1 = false;
local l_status_0, l_result_0 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserAddChatThrottlingToAllChannels");
end);
if l_status_0 then
    v1 = l_result_0;
end;
l_status_0 = true;
if v1 then
    l_status_0 = false;
end;
l_result_0 = {};
local v4 = {};
local v5 = nil;
pcall(function()
    v5 = require(game:GetService("Chat").ClientChatModules.ChatLocalization);
end);
if v5 == nil then
    v5 = {};
end;
if not (v5.FormatMessageToSend and v5.LocalizeFormattedMessage) then
    v5.FormatMessageToSend = function(_, _, v8)
        return v8;
    end;
end;
local function _(v9)
    table.insert(v9, tick() + 15);
end;
return function(v11)
    v11:RegisterProcessCommandsFunction("flood_detection", function(v12, _, v14)
        if not v4[v12] then
            local l_v11_Speaker_0 = v11:GetSpeaker(v12);
            if l_v11_Speaker_0 then
                if l_v11_Speaker_0:GetPlayer() then
                    if not l_result_0[v12] then
                        l_result_0[v12] = {};
                    end;
                    local v16 = nil;
                    if not l_status_0 then
                        v16 = l_result_0[v12];
                    else
                        if not l_result_0[v12][v14] then
                            l_result_0[v12][v14] = {};
                        end;
                        v16 = l_result_0[v12][v14];
                    end;
                    local v17 = tick();
                    while #v16 > 0 and v16[1] < v17 do
                        table.remove(v16, 1);
                    end;
                    if #v16 < 7 then
                        table.insert(v16, tick() + 15);
                        return false;
                    else
                        local v18 = math.ceil(v16[1] - v17);
                        l_v11_Speaker_0:SendSystemMessage(v5:FormatMessageToSend("GameChat_ChatFloodDetector_MessageDisplaySeconds", string.format("You must wait %d %s before sending another message", v18, v18 > 1 and "seconds" or "second"), "RBX_NUMBER", (tostring(v18))), v14);
                        return true;
                    end;
                else
                    return false;
                end;
            else
                return false;
            end;
        else
            return false;
        end;
    end, l_ChatConstants_0.LowPriority);
    v11.SpeakerRemoved:connect(function(v19)
        l_result_0[v19] = nil;
    end);
end;
