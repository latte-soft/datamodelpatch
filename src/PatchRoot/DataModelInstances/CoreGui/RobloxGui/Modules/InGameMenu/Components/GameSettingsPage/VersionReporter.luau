local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_StarterPlayer_0 = game:GetService("StarterPlayer");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v11 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v11.Roact;
local l_t_0 = v11.t;
local l_UIBlox_0 = v11.UIBlox;
local v15 = require(l_CoreGui_0.RobloxGui.Modules.PlayerPermissionsModule);
local l_Parent_0 = script.Parent.Parent.Parent;
local v17 = require(l_Parent_0.Resources.Constants);
local v18 = require(l_Parent_0.Components.Divider);
local v19 = require(l_Parent_0.Components.ThemedTextLabel);
local v20 = require(l_Parent_0.Utility.ExternalEventConnection);
local v21 = require(l_Parent_0.Localization.withLocalization);
local l_game_EngineFeature_0 = game:GetEngineFeature("CoreScriptVersionEnabled");
local v23 = require(l_RobloxGui_0.Modules.Flags.GetFFlagNewEventIngestPlayerScriptsDimensions);
local v24 = require(l_RobloxGui_0.Modules.Flags.GetFFlagRemoveAssetVersionEndpoint);
local v25 = l_Roact_0.PureComponent:extend("VersionReporter");
v25.validateProps = l_t_0.strictInterface({
    LayoutOrder = l_t_0.integer
});
local function v30(v26)
    local l_PlayerScriptsLoader_0 = v26:FindFirstChild("PlayerScriptsLoader");
    local l_PlayerModule_0 = v26:FindFirstChild("PlayerModule");
    local v29 = nil;
    v29 = if l_PlayerScriptsLoader_0 ~= nil and l_PlayerModule_0 ~= nil then if l_PlayerModule_0.Archivable or l_PlayerScriptsLoader_0.Archivable then v17.PlayerScriptStatusStrings.PossiblyCustom else v17.PlayerScriptStatusStrings.Default else if not (v26:FindFirstChild("CameraScript") == nil) or v26:FindFirstChild("ControlScript") ~= nil then v17.PlayerScriptStatusStrings.CustomOld else v17.PlayerScriptStatusStrings.Custom;
    l_RbxAnalyticsService_0:SetRBXEventStream(v17.AnalyticsTargetName, "player_scripts_status", "player_scripts_status_action", {
        defaultPlayerScripts = v29 == v17.PlayerScriptStatusStrings.Default, 
        placeID = tostring(game.PlaceId), 
        rawValue = if not v23() then nil else v29, 
        context = if not v23() then nil else "IGMv2"
    });
    return v29;
end;
v25.init = function(v31)
    local v32 = "PlayerScript Status: Unknown";
    local l_StarterPlayerScripts_0 = l_StarterPlayer_0:FindFirstChild("StarterPlayerScripts");
    if not l_StarterPlayerScripts_0 then
        v31.playerScriptsAddedConnection = l_StarterPlayer_0.ChildAdded:Connect(function(v34)
            if v34.Name == "StarterPlayerScripts" then
                v31.playerScriptsAddedConnection:Disconnect();
                v31.playerScriptsAddedConnection = nil;
                v31:setState({
                    playerScriptStatus = v30(v34)
                });
            end;
        end);
    else
        v32 = v30(l_StarterPlayerScripts_0);
    end;
    v31:setState({
        baseUrl = l_ContentProvider_0.BaseUrl, 
        clientVersion = l_RunService_0:GetRobloxVersion(), 
        isAdmin = false, 
        latestPlaceVersion = nil, 
        placeVersion = game.PlaceVersion, 
        serverVersion = nil, 
        playerScriptStatus = v32, 
        coreScriptVersion = not not l_game_EngineFeature_0 and l_RunService_0:GetCoreScriptVersion() or nil
    });
end;
v25.render = function(v35)
    local v36 = v35.state.serverVersion ~= nil;
    local v37 = v35.state.latestPlaceVersion ~= nil;
    local v38 = not v35.state.baseUrl:find("www.roblox.com");
    local v39 = v38 or v35.state.isAdmin;
    return v21({
        clientVersion = {
            "CoreScripts.InGameMenu.GameSettings.ClientVersion"; 
            CLIENT_VERSION = v35.state.clientVersion
        }, 
        serverVersion = {
            "CoreScripts.InGameMenu.GameSettings.ServerVersion"; 
            SERVER_VERSION = v35.state.serverVersion
        }, 
        placeVersion = {
            not v37 and "CoreScripts.InGameMenu.GameSettings.PlaceVersion" or "CoreScripts.InGameMenu.GameSettings.PlaceVersionWithLatest"; 
            PLACE_VERSION = v35.state.placeVersion, 
            LATEST_PLACE_VERSION = v35.state.latestPlaceVersion
        }, 
        coreScriptVersion = not not l_game_EngineFeature_0 and {
            "CoreScripts.InGameMenu.GameSettings.ClientCoreScriptVersion"; 
            CLIENT_CORESCRIPT_VERSION = v35.state.coreScriptVersion
        } or nil
    })(function(v40)
        local l_clientVersion_0 = v40.clientVersion;
        local l_status_0, l_result_0 = pcall(function()
            return l_RunService_0.ClientGitHash;
        end);
        if l_status_0 then
            l_clientVersion_0 = string.format("%s (%.6s)", l_clientVersion_0, l_result_0);
        end;
        return l_Roact_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 80), 
            LayoutOrder = v35.props.LayoutOrder
        }, {
            Padding = l_Roact_0.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 14), 
                PaddingLeft = UDim.new(0, 24), 
                PaddingBottom = UDim.new(0, 14)
            }), 
            Layout = l_Roact_0.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 10)
            }), 
            ClientVersion = l_Roact_0.createElement(v19, {
                themeKey = "TextDefault", 
                fontKey = "Footer", 
                Text = l_clientVersion_0, 
                LayoutOrder = 1, 
                Size = UDim2.new(1, -24, 0, 14)
            }), 
            ServerVersion = l_Roact_0.createElement(v19, {
                themeKey = "TextDefault", 
                fontKey = "Footer", 
                Text = not not v36 and v40.serverVersion or "", 
                LayoutOrder = 2, 
                Size = UDim2.new(1, -24, 0, 14)
            }, {
                not v36 and l_Roact_0.createElement(l_UIBlox_0.App.Loading.ShimmerPanel, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    shimmerSpeed = 2
                })
            }), 
            PlaceVersion = l_Roact_0.createElement(v19, {
                themeKey = "TextDefault", 
                fontKey = "Footer", 
                Text = v40.placeVersion, 
                LayoutOrder = 3, 
                Size = UDim2.new(1, -24, 0, 14)
            }), 
            Divider = (v38 or v39) and l_Roact_0.createElement(v18, {
                Size = UDim2.new(1, 0, 0, 1), 
                LayoutOrder = 4
            }), 
            PlayerScriptStatus = v39 and l_Roact_0.createElement(v19, {
                themeKey = "TextDefault", 
                fontKey = "Footer", 
                Text = v35.state.playerScriptStatus, 
                LayoutOrder = 5, 
                Size = UDim2.new(1, -24, 0, 14)
            }), 
            Environment = v38 and l_Roact_0.createElement(v19, {
                themeKey = "TextDefault", 
                fontKey = "Footer", 
                Text = ("Base URL: %s"):format(v35.state.baseUrl), 
                LayoutOrder = 6, 
                Size = UDim2.new(1, -24, 0, 14)
            }), 
            Divider2 = l_game_EngineFeature_0 and l_Roact_0.createElement(v18, {
                Size = UDim2.new(1, 0, 0, 1), 
                LayoutOrder = 7
            }), 
            CoreScriptVersion = l_game_EngineFeature_0 and l_Roact_0.createElement(v19, {
                themeKey = "TextDefault", 
                fontKey = "Footer", 
                Text = v40.coreScriptVersion, 
                LayoutOrder = 8, 
                Size = UDim2.new(1, -24, 0, 14)
            }), 
            VersionWatcher = l_Roact_0.createElement(v20, {
                event = game:GetPropertyChangedSignal("PlaceVersion"), 
                callback = function()
                    v35:setState({
                        placeVersion = game.PlaceVersion
                    });
                end
            })
        });
    end);
end;
v25.didMount = function(v44)
    v44.mounted = true;
    coroutine.wrap(function()
        local v45 = l_RobloxReplicatedStorage_0:WaitForChild("GetServerVersion", math.huge):InvokeServer();
        if v44.mounted then
            v44:setState({
                serverVersion = v45
            });
        end;
    end)();
    if not v24() then
        coroutine.wrap(function()
            pcall(function()
                local l_VersionNumber_0 = l_HttpService_0:JSONDecode((l_HttpRbxApiService_0:GetAsync(string.format("assets/%d/versions", game.PlaceId))))[1].VersionNumber;
                if v44.mounted then
                    v44:setState({
                        latestPlaceVersion = l_VersionNumber_0
                    });
                end;
            end);
        end)();
    end;
    coroutine.wrap(function()
        local v47 = v15.IsPlayerAdminAsync(l_Players_0.LocalPlayer);
        if v44.mounted then
            v44:setState({
                isAdmin = v47
            });
        end;
    end)();
end;
v25.willUnmount = function(v48)
    v48.mounted = false;
    if v48.playerScriptsAddedConnection then
        v48.playerScriptsAddedConnection:Disconnect();
    end;
end;
return v25;
