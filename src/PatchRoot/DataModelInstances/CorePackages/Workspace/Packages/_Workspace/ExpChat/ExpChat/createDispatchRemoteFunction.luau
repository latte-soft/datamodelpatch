local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_Chat_0 = game:GetService("Chat");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_List_0 = require(l_script_FirstAncestor_0.Parent.llama).List;
local v5 = require(l_script_FirstAncestor_0.Logger):new("ExpChat/" .. script.Name);
local function _(v6, v7)
    local l_status_0, l_result_0 = pcall(function()
        return l_Chat_0:CanUsersChatAsync(v6, v7) and l_Chat_0:CanUsersChatAsync(v7, v6);
    end);
    local v10 = l_status_0 and l_result_0;
    v5:debug("CanUsersChat: {}", (tostring(v10)));
    return v10;
end;
local function v18(v12, v13)
    local v14 = string.format("RBXWhisper:%d_%d", v12 < v13 and v12 or v13, v13 < v12 and v12 or v13);
    local l_TextChannel_0 = Instance.new("TextChannel");
    l_TextChannel_0.Name = v14;
    l_TextChannel_0.Parent = l_TextChatService_0:FindFirstChild("TextChannels") or l_TextChatService_0;
    l_TextChannel_0:AddUserAsync(v12);
    l_TextChannel_0:AddUserAsync(v13);
    l_TextChannel_0.ChildRemoved:Connect(function(_)
        if l_List_0.count(l_TextChannel_0:GetChildren(), function(v17)
            return v17:IsA("TextSource");
        end) < 2 then
            l_TextChannel_0:Destroy();
        end;
    end);
    return l_TextChannel_0;
end;
local function _(v19, v20, v21)
    local v22 = Instance.new(v19);
    v22.Name = v20;
    v22.Parent = v21;
    return v22;
end;
return function()
    local l_ExperienceChat_0 = l_RobloxReplicatedStorage_0:FindFirstChild("ExperienceChat");
    if not l_ExperienceChat_0 then
        local l_l_RobloxReplicatedStorage_0_0 = l_RobloxReplicatedStorage_0;
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = "ExperienceChat";
        l_Folder_0.Parent = l_l_RobloxReplicatedStorage_0_0;
        l_ExperienceChat_0 = l_Folder_0;
    end;
    local l_WhisperChat_0 = l_ExperienceChat_0:FindFirstChild("WhisperChat");
    if not l_WhisperChat_0 then
        local l_RemoteFunction_0 = Instance.new("RemoteFunction");
        l_RemoteFunction_0.Name = "WhisperChat";
        l_RemoteFunction_0.Parent = l_ExperienceChat_0;
        l_WhisperChat_0 = l_RemoteFunction_0;
    end;
    if l_WhisperChat_0:IsA("RemoteFunction") then
        l_WhisperChat_0.OnServerInvoke = function(v29, v30)
            v5:trace("WhisperChat remote invoked with: {}", (tostring(v30)));
            local v31 = tonumber(v30);
            local l_UserId_0 = v29.UserId;
            if v31 then
                local l_status_1, l_result_1 = pcall(function()
                    return l_Chat_0:CanUsersChatAsync(l_UserId_0, v31) and l_Chat_0:CanUsersChatAsync(v31, l_UserId_0);
                end);
                local v35 = l_status_1 and l_result_1;
                v5:debug("CanUsersChat: {}", (tostring(v35)));
                if v35 then
                    v5:trace("Creating whisper TextChannel");
                    return (v18(l_UserId_0, v31));
                end;
            end;
            return nil;
        end;
    end;
    return l_WhisperChat_0;
end;
