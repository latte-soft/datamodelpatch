local l_RunService_0 = game:GetService("RunService");
while not l_RunService_0:IsRunning() do
    wait();
end;
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_ScriptContext_0 = game:GetService("ScriptContext");
local v5 = game:GetService("CoreGui"):WaitForChild("RobloxGui", math.huge);
assert(v5 ~= nil, "RobloxGui should exist");
local v6 = require(v5.Modules.Server.ServerUtil);
if v6.getFFlagServerCoreScriptSourceCode() then
    v6.initSourceCodeFolder();
end;
if game:DefineFastFlag("OpenCloudCoreScriptLuaEnabled", false) then
    l_ScriptContext_0:AddCoreScriptLocal("ServerCoreScripts/OpenCloud/OpenCloudV2", script.Parent);
end;
l_ScriptContext_0:AddCoreScriptLocal("ServerCoreScripts/ServerInGameMenu", script.Parent);
l_ScriptContext_0:AddCoreScriptLocal("ServerCoreScripts/ServerSocialScript", script.Parent);
l_ScriptContext_0:AddCoreScriptLocal("ServerCoreScripts/ServerLeaderstats", script.Parent);
l_ScriptContext_0:AddCoreScriptLocal("ServerCoreScripts/PlayerRagdollRigCreator", script.Parent);
game:DefineFastFlag("DebugFreeCameraForAdmins", true);
local v7 = nil;
local v8 = require(v5.Modules.Common.Flags.FFlagEnableForkedChatAnalytics);
if v8 then
    v7 = require(v5.Modules.Server.SendChatAnalytics);
end;
l_ScriptContext_0:AddCoreScriptLocal("ServerCoreScripts/ServerDialog", script.Parent);
local l_RemoteFunction_0 = Instance.new("RemoteFunction");
l_RemoteFunction_0.Name = "GetServerVersion";
l_RemoteFunction_0.Parent = l_RobloxReplicatedStorage_0;
l_RemoteFunction_0.OnServerInvoke = function()
    local l_l_RunService_0_RobloxVersion_0 = l_RunService_0:GetRobloxVersion();
    local v11 = nil;
    v11 = l_l_RunService_0_RobloxVersion_0 == "?" and "DEBUG_SERVER" or (l_RunService_0:IsStudio() and "ROBLOX Studio" or l_l_RunService_0_RobloxVersion_0);
    if l_RunService_0:IsStudio() then
        return v11;
    else
        return string.format("%s (%.6s)", v11, l_RunService_0.ClientGitHash);
    end;
end;
local v12 = game:DefineFastFlag("EnableTenFootInterfaceCheckForLegacyChat", false);
if not (function()
    if not v12 then
        return game:GetService("Chat").LoadDefaultChat and game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.LegacyChatService;
    else
        local l_LoadDefaultChat_0 = game:GetService("Chat").LoadDefaultChat;
        if l_LoadDefaultChat_0 then
            l_LoadDefaultChat_0 = false;
            if game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.LegacyChatService then
                l_LoadDefaultChat_0 = not game:GetService("GuiService"):IsTenFootInterface();
            end;
        end;
        return l_LoadDefaultChat_0;
    end;
end)() then
    if v8 then
        v7("NoLoadDefaultChat");
    end;
else
    require(game:GetService("CoreGui").RobloxGui.Modules.Server.ClientChat.ChatWindowInstaller)();
    require(game:GetService("CoreGui").RobloxGui.Modules.Server.ServerChat.ChatServiceInstaller)();
end;
if game:GetFastFlag("DebugFreeCameraForAdmins") then
    require(game:GetService("CoreGui").RobloxGui.Modules.Server.FreeCamera.FreeCameraInstaller)();
end;
require(game:GetService("CoreGui").RobloxGui.Modules.Server.ServerSound.SoundDispatcherInstaller)();
if game:GetEngineFeature("AssetServiceUGCValidation") then
    require(game:GetService("CoreGui").RobloxGui.Modules.Server.UGCValidation.UGCValidationFunctionInstaller)();
end;
local l_ChatVersion_0 = game:GetService("TextChatService").ChatVersion;
if l_ChatVersion_0 == Enum.ChatVersion.TextChatService then
    require(l_CorePackages_0.UIBlox).init();
    require(l_CorePackages_0.ExperienceChat).mountServerApp({});
end;
if l_RunService_0:IsStudio() == false then
    l_RbxAnalyticsService_0:ReportCounter(l_ChatVersion_0 == Enum.ChatVersion.TextChatService and "textChatServiceChatVersionTextChatService" or "textChatServiceChatVersionLegacy", 1);
end;
if game:DefineFastFlag("VersionedFlags_Dev", false) then
    l_ScriptContext_0:AddCoreScriptLocal("ServerCoreScripts/VersionedFlagTest", script.Parent);
end;
if require(v5.Modules.Common.Flags.GetFFlagContactListEnabled)() then
    l_ScriptContext_0:AddCoreScriptLocal("ServerCoreScripts/ServerContactList", script.Parent);
end;
l_ScriptContext_0:AddCoreScriptLocal("ServerCoreScripts/PlayerViewCapability", script.Parent);
if require(v5.Modules.Common.Flags.GetFFlagEnableVoiceDefaultServerScript)() then
    l_ScriptContext_0:AddCoreScriptLocal("ServerCoreScripts/VoiceDefault", script.Parent);
end;
local _ = nil;
local l_status_0, l_result_0 = pcall(function()
    return UserSettings():IsUserFeatureEnabled("UserVRAvatarGestures");
end);
if l_status_0 and l_result_0 then
    require(game:GetService("CoreGui").RobloxGui.Modules.Server.VR.VRAvatarGesturesServer).new();
end;
