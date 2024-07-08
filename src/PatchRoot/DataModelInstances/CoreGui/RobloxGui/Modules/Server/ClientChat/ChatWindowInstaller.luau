local l_Chat_0 = game:GetService("Chat");
local l_Players_0 = game:GetService("Players");
local l_StarterPlayerScripts_0 = game:GetService("StarterPlayer"):WaitForChild("StarterPlayerScripts");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v4 = require(l_RobloxGui_0.Modules.Common.Flags.FFlagEnableForkedChatAnalytics);
local v5 = require(l_RobloxGui_0.Modules.Server.ServerUtil);
local v6 = nil;
if v4 then
    v6 = require(l_RobloxGui_0.Modules.Server.SendChatAnalytics);
end;
local v7 = game:DefineFastFlag("ChatWindowInstallerCheckClassName", false);
local v8 = false;
local l_status_0, l_result_0 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2");
end);
v8 = l_status_0 and l_result_0;
l_status_0 = function(v11, v12, v13)
    local v14 = v11:WaitForChild(v12);
    if v7 and v14.ClassName ~= "ModuleScript" then
        return v14:Clone();
    else
        local l_LocalScript_0 = Instance.new("LocalScript");
        l_LocalScript_0.Name = v12;
        if not v5.getFFlagServerCoreScriptSourceCode() then
            l_LocalScript_0.Source = v14.Source;
        else
            l_LocalScript_0.Source = v5.getSourceForServerScript(v14);
        end;
        l_LocalScript_0.Parent = v13;
        return l_LocalScript_0;
    end;
end;
l_result_0 = function(v16, v17, v18)
    local v19 = v16:WaitForChild(v17);
    if v7 and v19.ClassName ~= "ModuleScript" then
        return v19:Clone();
    else
        local l_ModuleScript_0 = Instance.new("ModuleScript");
        l_ModuleScript_0.Name = v17;
        if not v5.getFFlagServerCoreScriptSourceCode() then
            l_ModuleScript_0.Source = v19.Source;
        else
            l_ModuleScript_0.Source = v5.getSourceForServerScript(v19);
        end;
        l_ModuleScript_0.Parent = v18;
        return l_ModuleScript_0;
    end;
end;
local function _(v21, v22, v23)
    local l_v21_FirstChild_0 = v21:FindFirstChild(v22);
    if not l_v21_FirstChild_0 or not l_v21_FirstChild_0:IsA("BoolValue") then
        return v23;
    else
        return l_v21_FirstChild_0.Value;
    end;
end;
return function()
    local v26 = {};
    local v27 = true;
    local l_ChatScript_0 = l_Chat_0:FindFirstChild("ChatScript");
    if l_ChatScript_0 then
        if v4 then
            v26.ChatScript = "True";
        end;
    else
        v27 = false;
        l_ChatScript_0 = l_status_0(script.Parent, "ChatScript", l_Chat_0);
        local v29 = l_result_0(script.Parent, "ChatMain", l_ChatScript_0);
        l_result_0(script.Parent, "ChannelsBar", v29);
        l_result_0(script.Parent, "ChatBar", v29);
        l_result_0(script.Parent, "ChatChannel", v29);
        l_result_0(script.Parent, "MessageLogDisplay", v29);
        l_result_0(script.Parent, "ChatWindow", v29);
        l_result_0(script.Parent, "MessageLabelCreator", v29);
        l_result_0(script.Parent, "CommandProcessor", v29);
        l_result_0(script.Parent, "ChannelsTab", v29);
        l_result_0(script.Parent.Parent.Parent.Common, "ObjectPool", v29);
        l_result_0(script.Parent, "MessageSender", v29);
        l_result_0(script.Parent, "CurveUtil", v29);
        if v8 then
            local l_BoolValue_0 = Instance.new("BoolValue");
            l_BoolValue_0.Name = "ChatTranslationEnabled";
            l_BoolValue_0.Value = false;
            l_BoolValue_0.Parent = v29;
        end;
    end;
    local v31 = true;
    local l_BubbleChat_0 = l_Chat_0:FindFirstChild("BubbleChat");
    if l_BubbleChat_0 then
        if v4 then
            v26.BubbleChat = "True";
        end;
    else
        v31 = false;
        l_BubbleChat_0 = l_status_0(script.Parent.BubbleChat, "BubbleChat", l_Chat_0);
    end;
    local l_ClientChatModules_0 = l_Chat_0:FindFirstChild("ClientChatModules");
    if l_ClientChatModules_0 then
        if v4 then
            v26.ClientChatModules = "True";
        end;
    else
        l_ClientChatModules_0 = Instance.new("Folder");
        l_ClientChatModules_0.Name = "ClientChatModules";
        l_ClientChatModules_0.Archivable = false;
        l_ClientChatModules_0.Parent = l_Chat_0;
    end;
    if l_ClientChatModules_0:FindFirstChild("ChatSettings") then
        if v4 then
            v26.ChatSettings = "True";
        end;
    else
        l_result_0(script.Parent.DefaultClientChatModules, "ChatSettings", l_ClientChatModules_0);
    end;
    if l_ClientChatModules_0:FindFirstChild("ChatConstants") then
        if v4 then
            v26.ChatConstants = "True";
        end;
    else
        l_result_0(script.Parent.DefaultClientChatModules, "ChatConstants", l_ClientChatModules_0);
    end;
    if l_ClientChatModules_0:FindFirstChild("ChatLocalization") then
        if v4 then
            v26.ChatLocalization = "True";
        end;
    else
        l_result_0(script.Parent.DefaultClientChatModules, "ChatLocalization", l_ClientChatModules_0);
    end;
    local l_MessageCreatorModules_0 = l_ClientChatModules_0:FindFirstChild("MessageCreatorModules");
    if not l_MessageCreatorModules_0 then
        l_MessageCreatorModules_0 = Instance.new("Folder");
        l_MessageCreatorModules_0.Name = "MessageCreatorModules";
        l_MessageCreatorModules_0.Archivable = false;
        local l_BoolValue_1 = Instance.new("BoolValue");
        l_BoolValue_1.Name = "InsertDefaultModules";
        l_BoolValue_1.Value = true;
        l_BoolValue_1.Parent = l_MessageCreatorModules_0;
        l_MessageCreatorModules_0.Parent = l_ClientChatModules_0;
    end;
    local l_InsertDefaultModules_0 = l_MessageCreatorModules_0:FindFirstChild("InsertDefaultModules");
    if not not l_InsertDefaultModules_0 and if l_InsertDefaultModules_0:IsA("BoolValue") then l_InsertDefaultModules_0.Value else false then
        local l_Children_0 = script.Parent.DefaultClientChatModules.MessageCreatorModules:GetChildren();
        for v38 = 1, #l_Children_0 do
            if l_MessageCreatorModules_0:FindFirstChild(l_Children_0[v38].Name) then
                if v4 then
                    v26[l_Children_0[v38].Name] = "True";
                end;
            else
                l_result_0(script.Parent.DefaultClientChatModules.MessageCreatorModules, l_Children_0[v38].Name, l_MessageCreatorModules_0);
            end;
        end;
    end;
    local l_CommandModules_0 = l_ClientChatModules_0:FindFirstChild("CommandModules");
    if not l_CommandModules_0 then
        l_CommandModules_0 = Instance.new("Folder");
        l_CommandModules_0.Name = "CommandModules";
        l_CommandModules_0.Archivable = false;
        l_InsertDefaultModules_0 = Instance.new("BoolValue");
        l_InsertDefaultModules_0.Name = "InsertDefaultModules";
        l_InsertDefaultModules_0.Value = true;
        l_InsertDefaultModules_0.Parent = l_CommandModules_0;
        l_CommandModules_0.Parent = l_ClientChatModules_0;
    end;
    local l_InsertDefaultModules_1 = l_CommandModules_0:FindFirstChild("InsertDefaultModules");
    if not not l_InsertDefaultModules_1 and if l_InsertDefaultModules_1:IsA("BoolValue") then l_InsertDefaultModules_1.Value else false then
        local l_Children_1 = script.Parent.DefaultClientChatModules.CommandModules:GetChildren();
        for v42 = 1, #l_Children_1 do
            if l_CommandModules_0:FindFirstChild(l_Children_1[v42].Name) then
                if v4 then
                    v26[l_Children_1[v42].Name] = "True";
                end;
            else
                l_result_0(script.Parent.DefaultClientChatModules.CommandModules, l_Children_1[v42].Name, l_CommandModules_0);
            end;
        end;
    end;
    if not l_StarterPlayerScripts_0:FindFirstChild("ChatScript") then
        local v43 = l_ChatScript_0:Clone();
        v43.Parent = l_StarterPlayerScripts_0;
        v43.Archivable = false;
        for _, v45 in pairs((l_Players_0:GetPlayers())) do
            if v45:FindFirstChildOfClass("PlayerGui") then
                local v46 = l_status_0(script.Parent, "ChatInstallVerifier", v45.PlayerGui);
                local l_StringValue_0 = Instance.new("StringValue");
                l_StringValue_0.Name = "ScriptToVerify";
                l_StringValue_0.Value = "ChatScript";
                l_StringValue_0.Parent = v46;
            end;
        end;
    end;
    l_ChatScript_0.Archivable = v27;
    if not l_StarterPlayerScripts_0:FindFirstChild("BubbleChat") then
        local v48 = l_BubbleChat_0:Clone();
        v48.Parent = l_StarterPlayerScripts_0;
        v48.Archivable = false;
        for _, v50 in pairs((l_Players_0:GetPlayers())) do
            if v50:FindFirstChildOfClass("PlayerGui") then
                local v51 = l_status_0(script.Parent, "ChatInstallVerifier", v50.PlayerGui);
                local l_StringValue_1 = Instance.new("StringValue");
                l_StringValue_1.Name = "ScriptToVerify";
                l_StringValue_1.Value = "BubbleChat";
                l_StringValue_1.Parent = v51;
            end;
        end;
    end;
    l_BubbleChat_0.Archivable = v31;
    if v4 then
        v6("LoadClientDefaultChatForkedModules", v26);
    end;
end;
