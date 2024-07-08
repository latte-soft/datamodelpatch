local l_Players_0 = game:GetService("Players");
local l_Teams_0 = game:GetService("Teams");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_List_0 = require(l_script_FirstAncestor_0.Parent.llama).List;
local v5 = require(l_script_FirstAncestor_0.createDispatchRemoteFunction);
local v6 = require(script.createStore);
local v7 = require(l_script_FirstAncestor_0.watchForErrors);
local v8 = require(l_script_FirstAncestor_0.countParticipantsInTextChannel);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v10 = require(l_Actions_0.PlayerAdded);
local v11 = require(l_Actions_0.PlayerRemoved);
local _ = require(l_script_FirstAncestor_0.Commands.types);
local v13 = require(l_script_FirstAncestor_0.Commands);
local v14 = require(l_script_FirstAncestor_0.Config);
local v15 = require(l_script_FirstAncestor_0.Analytics);
local v16 = require(l_script_FirstAncestor_0.Logger):new("ExpChat/" .. script.Name);
local v17 = game:DefineFastFlag("FixTeamChannelReferenceTextChat", false);
local function _()
    return #l_List_0.filter(l_TextChatService_0:GetDescendants(), function(v18)
        return v18:IsA("TextChannel");
    end);
end;
local function _()
    return #l_List_0.filter(l_TextChatService_0:GetDescendants(), function(v20)
        return v20:IsA("TextChatCommand");
    end);
end;
return function(v22)
    v16:trace("mountServerApp started");
    local v23 = v6();
    v5();
    if not (not v22 or not v22.analytics) then
        v15.with(v22.analytics);
    end;
    v7(game:GetService("ScriptContext"), v22.script, true);
    local v24 = {};
    if l_TextChatService_0.CreateDefaultTextChannels then
        v16:trace("Creating default TextChannels");
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = "TextChannels";
        l_Folder_0.Parent = l_TextChatService_0;
        local function v29(v26)
            for _, v28 in pairs(l_TextChatService_0:GetDescendants()) do
                if v28:IsA("TextChannel") and v28.Name == v26 then
                    return v28;
                end;
            end;
            return nil;
        end;
        local l_l_Folder_0_0 = l_Folder_0 --[[ copy: 3 -> 17 ]];
        local function _(v31)
            local v32 = v29(v31);
            if not v32 then
                v32 = Instance.new("TextChannel");
                v32.Name = v31;
                v32.Parent = l_l_Folder_0_0;
            end;
            return v32;
        end;
        local function v38(v34, v35)
            for _, v37 in pairs(v34:GetChildren()) do
                if v37:IsA("TextSource") and v37.UserId == v35 then
                    return v37;
                end;
            end;
            return nil;
        end;
        local function v52(v39)
            local v40 = "RBXTeam" .. tostring(v39.TeamColor.Name);
            local v41 = v29(v40);
            if not v41 then
                v41 = Instance.new("TextChannel");
                v41.Name = v40;
                v41.Parent = l_l_Folder_0_0;
            end;
            local l_v41_0 = v41;
            v16:debug("Creating team TextChannel: {}", l_v41_0.Name);
            v39.PlayerAdded:Connect(function(v43)
                if not v17 then
                    l_v41_0:AddUserAsync(v43.UserId).CanSend = true;
                    return ;
                else
                    local v44 = "RBXTeam" .. tostring(v39.TeamColor.Name);
                    local v45 = v29(v44);
                    if not v45 then
                        v45 = Instance.new("TextChannel");
                        v45.Name = v44;
                        v45.Parent = l_l_Folder_0_0;
                    end;
                    v45:AddUserAsync(v43.UserId).CanSend = true;
                    return ;
                end;
            end);
            v39.PlayerRemoved:Connect(function(v46)
                if not v17 then
                    local v47 = v38(l_v41_0, v46.UserId);
                    if v47 then
                        v47:Destroy();
                    end;
                else
                    local v48 = "RBXTeam" .. tostring(v39.TeamColor.Name);
                    local v49 = v29(v48);
                    if not v49 then
                        v49 = Instance.new("TextChannel");
                        v49.Name = v48;
                        v49.Parent = l_l_Folder_0_0;
                    end;
                    v48 = v38(v49, v46.UserId);
                    if v48 then
                        v48:Destroy();
                        return ;
                    end;
                end;
            end);
            v39:GetPropertyChangedSignal("TeamColor"):Connect(function()
                if not v17 then
                    l_v41_0.Name = "RBXTeam" .. tostring(v39.TeamColor.Name);
                    return ;
                else
                    local v50 = "RBXTeam" .. tostring(v39.TeamColor.Name);
                    local v51 = v29(v50);
                    if not v51 then
                        v51 = Instance.new("TextChannel");
                        v51.Name = v50;
                        v51.Parent = l_l_Folder_0_0;
                    end;
                    v51.Name = "RBXTeam" .. tostring(v39.TeamColor.Name);
                    return ;
                end;
            end);
        end;
        for _, v54 in pairs(l_Teams_0:GetTeams()) do
            if v54:IsA("Team") then
                v52(v54);
            end;
        end;
        local l_v52_0 = v52 --[[ copy: 7 -> 18 ]];
        l_Teams_0.ChildAdded:Connect(function(v56)
            if v56:IsA("Team") then
                l_v52_0(v56);
            end;
        end);
        l_Teams_0.ChildRemoved:Connect(function(v57)
            if v57:IsA("Team") then
                local v58 = v29("RBXTeam" .. tostring(v57.TeamColor.Name));
                if v58 then
                    v16:debug("Destroying team TextChannel: {}", v58.Name);
                    v58:Destroy();
                end;
            end;
        end);
        for v59, _ in pairs(v14.DefaultChannelNames) do
            v16:trace("Creating default channel: {}", v59);
            local v61 = v29(v59);
            if not v61 then
                v61 = Instance.new("TextChannel");
                v61.Name = v59;
                v61.Parent = l_Folder_0;
            end;
            table.insert(v24, v61);
        end;
        local function v66(v62)
            for _, v64 in ipairs(v24) do
                v16:trace("Adding user {} to TextChannel: {}", tostring(v62.UserId), v64.Name);
                local v65 = v64:AddUserAsync(v62.UserId);
                if v64.Name == "RBXGeneral" then
                    v65.CanSend = true;
                elseif v64.Name == "RBXSystem" then
                    v65.CanSend = false;
                end;
            end;
        end;
        for _, v68 in pairs(l_Players_0:GetPlayers()) do
            if v68:IsA("Player") then
                v66(v68);
            end;
        end;
        l_Players_0.PlayerAdded:Connect(v66);
        v15.FireRccAnalyticsWithEventName("DefaultChannelsCreated");
    end;
    if l_TextChatService_0.CreateDefaultCommands then
        v16:trace("Creating default TextChatCommands");
        local l_Folder_1 = Instance.new("Folder");
        l_Folder_1.Name = "TextChatCommands";
        l_Folder_1.Parent = l_TextChatService_0;
        for _, v71 in ipairs(v13) do
            local l_TextChatCommand_0 = Instance.new("TextChatCommand");
            l_TextChatCommand_0.Name = v71.name;
            l_TextChatCommand_0.PrimaryAlias = v71.alias[1];
            l_TextChatCommand_0.SecondaryAlias = v71.alias[2] or "";
            l_TextChatCommand_0.Parent = l_Folder_1;
        end;
        v15.FireRccAnalyticsWithEventName("DefaultCommandsCreated");
    end;
    v15.FireRccAnalyticsWithEventName("ExperienceChatLoaded", {
        loadedChannels = #l_List_0.filter(l_TextChatService_0:GetDescendants(), function(v73)
            return v73:IsA("TextChannel");
        end), 
        loadedCommands = #l_List_0.filter(l_TextChatService_0:GetDescendants(), function(v74)
            return v74:IsA("TextChatCommand");
        end)
    });
    v16:debug("Start watching for new channels and commands");
    l_TextChatService_0.DescendantAdded:Connect(function(v75)
        if not v75:IsA("TextChannel") then
            if not v75:IsA("TextChatCommand") then
                if v75:IsA("TextSource") then
                    local l_Parent_0 = v75.Parent;
                    if not (not l_Parent_0 or not l_Parent_0:IsA("TextChannel")) then
                        v15.FireRccAnalyticsWithEventName("ChannelJoined", {
                            channelName = l_Parent_0.Name, 
                            totalParticipants = v8(l_Parent_0)
                        });
                    end;
                end;
                return ;
            else
                v15.FireRccAnalyticsWithEventName("CommandCreated", {
                    commandName = v75.Name
                });
                return ;
            end;
        else
            v15.FireRccAnalyticsWithEventName("ChannelCreated", {
                channelName = v75.Name, 
                totalChannels = #l_List_0.filter(l_TextChatService_0:GetDescendants(), function(v77)
                    return v77:IsA("TextChannel");
                end)
            });
            return ;
        end;
    end);
    l_TextChatService_0.DescendantRemoving:Connect(function(v78)
        if not v78:IsA("TextChannel") then
            if not v78:IsA("TextChatCommand") then
                if v78:IsA("TextSource") then
                    local l_Parent_1 = v78.Parent;
                    if not (not l_Parent_1 or not l_Parent_1:IsA("TextChannel")) then
                        v15.FireRccAnalyticsWithEventName("ChannelLeft", {
                            channelName = l_Parent_1.Name, 
                            totalParticipants = v8(l_Parent_1)
                        });
                    end;
                end;
                return ;
            else
                v15.FireRccAnalyticsWithEventName("CommandRemoved", {
                    commandName = v78.Name
                });
                return ;
            end;
        else
            v15.FireRccAnalyticsWithEventName("ChannelRemoved", {
                channelName = v78.Name, 
                totalChannels = #l_List_0.filter(l_TextChatService_0:GetDescendants(), function(v80)
                    return v80:IsA("TextChannel");
                end) - 1
            });
            return ;
        end;
    end);
    for _, v82 in pairs(l_Players_0:GetPlayers()) do
        v23:dispatch(v10(v82.UserId, v82.Name, v82.DisplayName));
    end;
    l_Players_0.PlayerAdded:Connect(function(v83)
        v23:dispatch(v10(v83.UserId, v83.Name, v83.DisplayName));
    end);
    l_Players_0.PlayerRemoving:Connect(function(v84)
        v23:dispatch(v11(v84.UserId));
    end);
end;
