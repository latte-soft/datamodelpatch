local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.UIBlox);
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v5 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v7 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v9 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForConfirmSignOut);
local v10 = require(l_Modules_0.LuaApp.Themes.DeprecatedDarkTheme);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_Button_0 = v3.App.Button.Button;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local v14 = require(l_Modules_0.LuaApp.Thunks.Authentication.Console.ConsoleDisconnect);
local l_GetFFlagFixTenFootUiMorePage_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagFixTenFootUiMorePage;
return function()
    local v16 = if not l_GetFFlagFixTenFootUiMorePage_0() then nil else l_useDesignTokens_0().LuaApps.More.DisconnectTextFont;
    local v17 = l_useDispatch_0();
    local v18 = l_useLocalization_0({
        logout = "Application.Logout.Action.Logout"
    });
    local v19 = v7(v5);
    local v20 = v7(l_AppGuiService_0);
    return v1.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 0), 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0.5, 0, 0, 0), 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        DisconnectButton = v1.createElement(l_Button_0, {
            buttonType = l_ButtonType_0.Secondary, 
            size = UDim2.new(1, 0, 1, 0), 
            text = v18.logout, 
            fontStyle = if not l_GetFFlagFixTenFootUiMorePage_0() then nil else v16, 
            onActivated = v1.useCallback(function()
                v17(v9(function()
                    v17(v14(v19, v20));
                end, v10));
            end, {
                v17, 
                v19, 
                v20
            })
        })
    });
end;
