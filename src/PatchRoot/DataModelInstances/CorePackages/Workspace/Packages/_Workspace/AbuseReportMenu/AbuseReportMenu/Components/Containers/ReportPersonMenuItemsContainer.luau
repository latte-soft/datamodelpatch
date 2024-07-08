local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_Players_0 = game:GetService("Players");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_script_FirstAncestor_0.MenuConfigs.getMenuItemsFromConfigs);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v8 = require(l_script_FirstAncestor_0.Components.Constants);
local v9 = require(l_script_FirstAncestor_0.MenuConfigs.Players.ReportPlayerMenuItemConfigList);
local v10 = require(l_script_FirstAncestor_0.Reducers.reportPersonUIStateReducer);
local v11 = require(l_script_FirstAncestor_0.Utility.handlePreselectedPlayer);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local l_PlayerMenuActions_0 = v8.PlayerMenuActions;
local function v16(v14, v15)
    return v14.Name:lower() < v15.Name:lower();
end;
return function(v17)
    local v18, v19 = v4.useReducer(v10, v8.InitPersonUIState);
    v4.useEffect(function()
        if v17.utilityProps.isReportTabVisible ~= true then
            return ;
        else
            v17.utilityProps.analyticsDispatch({
                type = v8.AnalyticsActions.SwitchToPersonInitialSelections
            });
            l_default_0:asyncInit():andThen(function()
                if v17.utilityProps.preselectedPlayer then
                    v11(v17.utilityProps.preselectedPlayer, true, v19, v17.utilityProps.analyticsDispatch);
                end;
                v19({
                    type = l_PlayerMenuActions_0.SetVoiceEnabled, 
                    enabled = true
                });
            end):catch(function()
                if v17.utilityProps.preselectedPlayer then
                    v11(v17.utilityProps.preselectedPlayer, false, v19, v17.utilityProps.analyticsDispatch);
                end;
            end);
            return ;
        end;
    end, {
        v17.utilityProps.isReportTabVisible
    });
    v4.useEffect(function()
        local v20 = {};
        if v18.methodOfAbuse == v8.AbuseMethods.VoiceChat then
            for _, v22 in pairs((l_default_0:getRecentUsersInteractionData())) do
                table.insert(v20, v22.player);
            end;
            table.sort(v20, v16);
        elseif not ((v18.methodOfAbuse ~= v8.AbuseMethods.TextChat and v18.methodOfAbuse ~= v8.AbuseMethods.Other) and v18.methodOfAbuse ~= v8.AbuseMethods.Avatar) or v18.methodOfAbuse == nil then
            v20 = l_Players_0:GetPlayers();
            table.sort(v20, v16);
        end;
        local v23 = false;
        local v24 = false;
        v19({
            type = l_PlayerMenuActions_0.UpdatePlayerNameMap, 
            playerObjects = v5.List.filter(v20, function(v25)
                if v18.preselectedPlayer and v25.UserId == v18.preselectedPlayer.UserId then
                    v23 = true;
                end;
                if v18.allegedAbuser and v25.UserId == v18.allegedAbuserId then
                    v24 = true;
                end;
                local v26 = false;
                if v25 ~= l_Players_0.LocalPlayer then
                    v26 = v25.UserId > 0;
                end;
                return v26;
            end)
        });
        if not v18.preselectedPlayer or not v23 then
            if not v24 then
                v19({
                    type = v8.PlayerMenuActions.UpdateAbuser, 
                    abuseId = nil, 
                    abuser = nil
                });
            end;
        else
            v19({
                type = v8.PlayerMenuActions.UpdateAbuser, 
                abuseId = v18.preselectedPlayer.UserId, 
                abuser = v18.preselectedPlayer
            });
            v19({
                type = v8.PlayerMenuActions.SetPreselectedPlayer, 
                player = nil
            });
        end;
    end, {
        v18.methodOfAbuse, 
        v18.isVoiceEnabled, 
        v17.utilityProps.isReportTabVisible, 
        v18.preselectedPlayer
    });
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        MenuItems = v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, (v5.Dictionary.join({
            Layout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 12)
            })
        }, (v6(v18, v19, v17.utilityProps, v9)))))
    });
end;
