local v0 = require(script.Parent.Parent.Service);
local v1 = require(script.Parent.Parent.Service.ChromeUtils);
local l_MappedSignal_0 = v1.MappedSignal;
local v3 = require(script.Parent.CommonIcon);
local l_VRService_0 = game:GetService("VRService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v6 = require(l_RobloxGui_0.Modules.PlayerList.PlayerListManager);
local v7 = require(l_RobloxGui_0.Modules.EmotesMenu.EmotesMenuMaster);
local v8 = require(l_RobloxGui_0.Modules.BackpackScript);
local v9 = l_MappedSignal_0.new(v6:GetSetVisibleChangedEvent().Event, function()
    return v6:GetSetVisible();
end);
v1.setCoreGuiAvailability(v0:register({
    id = "leaderboard", 
    label = "CoreScripts.TopBar.Leaderboard", 
    activated = function(_)
        if not l_VRService_0.VREnabled then
            if not v6:GetSetVisible() then
                v1.dismissRobloxMenuAndRun(function()
                    v6:SetVisibility(not v6:GetSetVisible());
                end);
                return ;
            else
                v6:SetVisibility(not v6:GetSetVisible());
                return ;
            end;
        else
            require(l_RobloxGui_0.Modules.InGameMenu).openPlayersPage();
            return ;
        end;
    end, 
    components = {
        Icon = function(_)
            return v3("icons/controls/leaderboardOff", "icons/controls/leaderboardOn", v9);
        end
    }
}), Enum.CoreGuiType.PlayerList);
local v12 = l_MappedSignal_0.new(v7.EmotesMenuToggled.Event, function()
    return v7:isOpen();
end);
local v15 = v0:register({
    id = "emotes", 
    label = "CoreScripts.TopBar.Emotes", 
    activated = function(_)
        if not v7:isOpen() then
            v1.dismissRobloxMenuAndRun(function()
                v7:open();
            end);
            return ;
        else
            v7:close();
            return ;
        end;
    end, 
    components = {
        Icon = function(_)
            return v3("icons/controls/emoteOff", "icons/controls/emoteOn", v12);
        end
    }
});
local v16 = false;
local l_MenuIsVisible_0 = v7.MenuIsVisible;
updateEmoteAvailability = function()
    if not v16 or not l_MenuIsVisible_0 then
        v15.availability:unavailable();
        return ;
    else
        v15.availability:available();
        return ;
    end;
end;
v1.setCoreGuiAvailability(v15, Enum.CoreGuiType.EmotesMenu, function(v18)
    v16 = v18;
    updateEmoteAvailability();
end);
v7.MenuVisibilityChanged.Event:Connect(function()
    l_MenuIsVisible_0 = v7.MenuIsVisible;
    updateEmoteAvailability();
end);
local v19 = l_MappedSignal_0.new(v8.StateChanged.Event, function()
    return v8.IsOpen;
end);
v1.setCoreGuiAvailability(v0:register({
    id = "backpack", 
    label = "CoreScripts.TopBar.Inventory", 
    activated = function(_)
        if not v8.IsOpen then
            v1.dismissRobloxMenuAndRun(function()
                v8:OpenClose();
            end);
            return ;
        else
            v8:OpenClose();
            return ;
        end;
    end, 
    components = {
        Icon = function(_)
            return v3("icons/menu/inventoryOff", "icons/menu/inventory", v19);
        end
    }
}), Enum.CoreGuiType.Backpack);
local v25 = v0:register({
    id = "respawn", 
    label = "CoreScripts.InGameMenu.QuickActions.Respawn", 
    activated = function(_)
        local v23 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
        v23:SetVisibility(true, false, v23.Instance.ResetCharacterPage);
        v23:SwitchToPage(v23.Instance.ResetCharacterPage);
    end, 
    components = {
        Icon = function(_)
            return v3("icons/actions/respawn");
        end
    }
});
updateRespawn = function(v26)
    if not v26 then
        v25.availability:unavailable();
        return ;
    else
        v25.availability:available();
        return ;
    end;
end;
task.defer(function()
    local v27 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
    v27.RespawnBehaviourChangedEvent.Event:connect(updateRespawn);
    updateRespawn(v27:GetRespawnBehaviour());
end);
local v28 = v0:currentSubMenu();
local v29 = l_MappedSignal_0.new(v28:signal(), function()
    return v28:get() == "nine_dot";
end);
if v0:orderAlignment():get() == Enum.HorizontalAlignment.Right then
    v29:connect(function(v30)
        v6:SetMinimized(v30);
    end);
end;
return v0:register({
    initialAvailability = v0.AvailabilitySignal.Available, 
    notification = v0:subMenuNotifications("nine_dot"), 
    id = "nine_dot", 
    label = "CoreScripts.TopBar.MoreMenu", 
    components = {
        Icon = function(_)
            return v3("icons/menu/9dot", "icons/menu/9dot", v29);
        end
    }
});
