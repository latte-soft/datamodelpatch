local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.PlayerList.PlayerListManager);
local v3 = require(l_CorePackages_0.Workspace.Packages.GameInvite);
local l_renderCoreScriptGameInviteModalContainer_0 = v3.renderCoreScriptGameInviteModalContainer;
local l_GameInviteModalManager_0 = v3.GameInviteModalManager;
local v6 = require(l_CoreGui_0.RobloxGui.Modules.ApolloClient);
local function v8(v7)
    if not v7 then
        v2:HideTemp("GameInviteMenu", false);
        return ;
    else
        v2:HideTemp("GameInviteMenu", true);
        return ;
    end;
end;
l_renderCoreScriptGameInviteModalContainer_0(v6);
l_GameInviteModalManager_0.ToggleGameInviteModalEvent.Event:Connect(v8);
