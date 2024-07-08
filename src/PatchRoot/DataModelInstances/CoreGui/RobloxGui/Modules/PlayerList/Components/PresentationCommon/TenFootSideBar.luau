local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local v5 = require(l_CorePackages_0.Roact);
local v6 = require(l_CorePackages_0.RoactRodux);
local l_Parent_0 = script.Parent.Parent.Parent;
local v8 = require(l_Parent_0.Actions.ClosePlayerDropDown);
local v9 = require(l_Parent_0.Actions.SetPlayerListVisibility);
local v10 = require(l_CoreGui_0.RobloxGui.Modules.isNewInGameMenuEnabled);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v12 = v5.PureComponent:extend("TenFootSideBar");
local function _(v13)
    pcall(function()
        local l_PlatformService_0 = game:GetService("PlatformService");
        if v13 and #v13 > 0 then
            l_PlatformService_0:PopupProfileUI(Enum.UserInputType.Gamepad1, v13);
        end;
    end);
end;
v12.init = function(v16)
    v16.sideBar = nil;
end;
v12.render = function(_)
    return nil;
end;
v12.shouldShowSidebar = function(_, v19, v20)
    if not l_RunService_0:IsStudio() then
        local v21 = false;
        if v19 ~= l_Players_0.LocalPlayer then
            v21 = true;
        end;
        local v22 = false;
        if v20 and #v20 > 0 then
            v22 = true;
        end;
        return v21, v22;
    else
        return false, false;
    end;
end;
v12.openSidebar = function(v23, v24)
    local v25 = nil;
    pcall(function()
        v25 = game:GetService("PlatformService"):GetPlatformId(v24.UserId);
    end);
    local v26, v27 = v23:shouldShowSidebar(v24, v25);
    if v26 or v27 then
        local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
        local v29 = require(l_RobloxGui_0.Modules:FindFirstChild("ScreenManager") or l_RobloxGui_0.Modules.Shell.ScreenManager);
        local v30 = require(l_RobloxGui_0.Modules:FindFirstChild("LocalizedStrings") or l_RobloxGui_0.Modules.Shell.LocalizedStrings);
        if not v23.sideBar then
            v23.sideBar = require(l_RobloxGui_0.Modules:FindFirstChild("SideBar") or l_RobloxGui_0.Modules.Shell.SideBar)();
        end;
        v23.sideBar:RemoveAllItems();
        if v27 then
            v23.sideBar:AddItem(v30:LocalizedString("ViewGamerCardWord"), function()
                local l_v25_0 = v25;
                pcall(function()
                    local l_PlatformService_1 = game:GetService("PlatformService");
                    if l_v25_0 and #l_v25_0 > 0 then
                        l_PlatformService_1:PopupProfileUI(Enum.UserInputType.Gamepad1, l_v25_0);
                    end;
                end);
            end);
        end;
        if v26 then
            v23.sideBar:AddItem(v30:LocalizedString("ReportPlayer"), function()
                v23.props.closePlayerList();
                l_GuiService_0.SelectedCoreObject = nil;
                if not v10() then
                    require(l_RobloxGui_0.Modules.Settings.Pages.ReportAbuseMenuNewContainerPage):ReportPlayer(v24, v23.__componentName);
                    return ;
                else
                    require(l_RobloxGui_0.Modules.InGameMenuInit).openReportDialog(v24, v23.__componentName);
                    return ;
                end;
            end);
        end;
        local v33 = nil;
        v33 = v23.sideBar.Closed:connect(function()
            v33:disconnect();
            v23.props.closeSideBar();
            if v23.props.playerListVisible then
                if not l_SelectedCoreObject_0 or not l_SelectedCoreObject_0.Parent then
                    v23.props.closePlayerList();
                    v23.props.openPlayerList();
                else
                    l_GuiService_0.SelectedCoreObject = l_SelectedCoreObject_0;
                    return ;
                end;
            end;
        end);
        v29:OpenScreen(v23.sideBar, false);
        return ;
    else
        v23.props.closeSideBar();
        return ;
    end;
end;
v12.didMount = function(v34)
    if v34.props.sideBarVisible then
        v34:openSidebar(v34.props.selectedPlayer);
    end;
end;
v12.didUpdate = function(v35, v36)
    if v35.props.sideBarVisible and v35.props.sideBarVisible ~= v36.sideBarVisible then
        v35:openSidebar(v35.props.selectedPlayer);
    end;
end;
return v6.connect(function(v37)
    return {
        selectedPlayer = v37.playerDropDown.selectedPlayer, 
        sideBarVisible = v37.displayOptions.isTenFootInterface and v37.playerDropDown.isVisible, 
        playerListVisible = v37.displayOptions.isVisible
    };
end, function(v38)
    return {
        closeSideBar = function()
            return v38(v8());
        end, 
        closePlayerList = function()
            return v38(v9(false));
        end, 
        openPlayerList = function()
            return v38(v9(true));
        end
    };
end)(v12);
