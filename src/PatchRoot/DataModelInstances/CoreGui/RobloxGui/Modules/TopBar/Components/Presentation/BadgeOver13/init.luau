game:DefineFastString("TopBarBadgeLearnMoreLink", "https://roblox.com/info/community-guidelines");
local l_GamepadService_0 = game:GetService("GamepadService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_List_0 = require(l_CorePackages_0.Packages.Cryo).List;
local v4 = require(script.AnalyticsContext);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v6 = require(script.openWebview);
local v7 = require(script.BadgeOver13);
local v8 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.RobloxTranslator);
local l_Chrome_0 = script.Parent.Parent.Parent.Parent.Chrome;
local v10 = if not require(l_Chrome_0.Enabled) then nil else require(l_Chrome_0.Service);
local v11 = {
    TextFilter = "InGame.CommonUI.Badge.Popup.TextFilterOnlyInfo", 
    Voice = "InGame.CommonUI.Badge.Popup.VoiceInfo"
};
return function(v12)
    local l_player_0 = v12.player;
    local l_VREnabled_0 = v12.VRService.VREnabled;
    local v15, v16 = v2.useState(l_GamepadService_0.GamepadCursorEnabled);
    local v17, v18 = v2.useState(l_player_0.UnfilteredChat);
    local v19, v20 = v2.useState(false);
    v2.useEffect(function()
        v12.voiceChatServiceManager:asyncInit():andThen(function()
            v20(true);
        end):catch(function()
        end);
    end, {});
    local v21 = true;
    if v10 then
        v21 = require(l_Chrome_0.Hooks.useChromeMenuStatus)() == v10.MenuStatus.Closed;
    end;
    local v22;
    if l_VREnabled_0 ~= false then
        v22 = false;
        if not (v15 == true) then
            goto label0;
        end;
    end;
    v22 = true;
    if v17 ~= true then
        v22 = v19 == true;
    end;
    ::label0::;
    v22 = v22 and v21;
    if v12.visibilityChanged then
        v12.visibilityChanged(v22);
    end;
    local v23 = {};
    if v17 then
        table.insert(v23, "TextFilter");
    end;
    if v19 then
        table.insert(v23, "Voice");
    end;
    local v25 = l_List_0.map(v23, function(v24)
        if not v11[v24] then
            return nil;
        else
            return v8:FormatByKey(v11[v24]);
        end;
    end);
    table.insert(v25, v8:FormatByKey("InGame.CommonUI.Badge.Popup.CommunityStandards"));
    return v2.createElement(v4.Provider, {
        value = {
            fireEvent = function(v26, v27)
                v12.analytics.EventStream:setRBXEventStream("TopBarBadge", v26, v27);
            end
        }
    }, {
        app = v2.createElement(v2.Fragment, nil, {
            badge = v2.createElement(v7, {
                layoutOrder = v12.layoutOrder, 
                bodyText = v25, 
                linkText = v8:FormatByKey("InGame.CommonUI.Badge.Popup.LearnMoreLink"), 
                openWebview = v2.useCallback(function()
                    v6((game:GetFastString("TopBarBadgeLearnMoreLink")));
                end), 
                visible = v22, 
                analyticsCopyType = table.concat(v23, "+")
            }), 
            gamepadCursorEnabledListener = l_GamepadService_0 and v2.createElement(l_ExternalEventConnection_0, {
                event = l_GamepadService_0:GetPropertyChangedSignal("GamepadCursorEnabled"), 
                callback = function()
                    v16(l_GamepadService_0.GamepadCursorEnabled);
                end
            }), 
            unfilteredChatListener = v2.createElement(l_ExternalEventConnection_0, {
                event = l_player_0:GetPropertyChangedSignal("UnfilteredChat"), 
                callback = function()
                    v18(l_player_0.UnfilteredChat);
                end
            })
        })
    });
end;
