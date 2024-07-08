local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ShareGame_0 = l_RobloxGui_0.Modules.Settings.Pages.ShareGame;
local v4 = require(l_ShareGame_0.Constants);
local l_ClearShareInviteLink_0 = require(l_CorePackages_0.Workspace.Packages.NotificationsCommon).ReducerDependencies.RoduxShareLinks.Actions.ClearShareInviteLink;
local v6 = require(l_ShareGame_0.Actions.OpenPage);
local v7 = require(l_ShareGame_0.Actions.ClosePage);
local v8 = require(l_Modules_0.Settings.Flags.GetFFlagShareInviteLinkContextMenuV1Enabled);
local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
l_NewPage_0.TabHeader = nil;
l_NewPage_0.PageListLayout.Parent = nil;
l_NewPage_0.ShouldShowBottomBar = false;
l_NewPage_0.ShouldShowHubBar = false;
l_NewPage_0.IsPageClipped = false;
l_NewPage_0.Page.Name = "ShareGameDummy";
l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, 0);
l_NewPage_0.ConnectHubToApp = function(_, v11, v12)
    l_NewPage_0:SetHub(v11);
    v12.store.changed:connect(function(v13, v14)
        local l_Page_0 = v13.Page;
        local l_IsOpen_0 = v14.Page.IsOpen;
        if not ((not (l_Page_0.Route == v4.PageRoute.SHARE_GAME) or not l_IsOpen_0) or l_Page_0.IsOpen) then
            l_NewPage_0.HubRef:PopMenu(nil, true);
        end;
    end);
    l_NewPage_0.Displayed.Event:Connect(function()
        if not v12.store:getState().Page.IsOpen then
            v12.store:dispatch(v6(v4.PageRoute.SETTINGS_HUB));
        end;
    end);
    l_NewPage_0.Hidden.Event:Connect(function()
        if v12.store:getState().Page.IsOpen then
            v12.store:dispatch(v7(v4.PageRoute.SETTINGS_HUB));
        end;
    end);
    v12.store:dispatch(v7(v4.PageRoute.SETTINGS_HUB));
end;
l_NewPage_0.ClearShareInviteLink = function(_, v18)
    if v8() and v18.store:getState().ShareLinks.Invites.ShareInviteLink ~= nil then
        v18.store:dispatch(l_ClearShareInviteLink_0());
    end;
end;
return l_NewPage_0;
