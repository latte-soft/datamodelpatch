local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_IXPService_0 = game:GetService("IXPService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_LocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.Localization).LocalizationProvider;
local l_DesignTokenProvider_0 = require(l_CorePackages_0.Workspace.Packages.Style).DesignTokenProvider;
local v9 = require(l_CorePackages_0.Roact);
local v10 = require(l_CorePackages_0.Rodux);
local v11 = require(l_CorePackages_0.RoactRodux);
local l_Constants_0 = require(l_CorePackages_0.UIBlox).App.Style.Constants;
local l_UiModeStyleProvider_0 = require(l_CorePackages_0.Workspace.Packages.Style).UiModeStyleProvider;
local v14 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v15 = require(l_RobloxGui_0.Modules.TenFootInterface);
local v16 = require(l_RobloxGui_0.Modules.isNewInGameMenuEnabled);
local v17 = require(l_RobloxGui_0.Modules.Chrome.Enabled)();
local v18 = require(script.Constants);
local v19 = require(script.TokenMappers.MenuNavigationPromptTokenMapper);
if not (not v17 or v15:IsEnabled()) then
    local l_l_GuiService_0_GuiInset_0, v21 = l_GuiService_0:GetGuiInset();
    l_GuiService_0:SetGlobalGuiInset(l_l_GuiService_0_GuiInset_0.X, v18.TopBarHeight, v21.X, v21.Y);
end;
local v22 = require(script.Components.TopBarApp);
local v23 = require(script.Reducer);
local v24 = require(script.TopBarAppPolicy);
local v25 = require(script.Actions.SetSmallTouchDevice);
local v26 = require(script.Actions.SetInspectMenuOpen);
local v27 = require(script.Actions.SetGamepadMenuOpen);
local v28 = require(script.Actions.UpdateUnreadMessagesBadge);
local v29 = require(script.Thunks.GetCanChat);
local v30 = require(script.Thunks.GetGameName);
local v31 = require(script.registerSetCores);
local v32 = require(script.GlobalConfig);
local v33 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local v34 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableTeleportBackButton);
local v35 = require(script.Flags.FFlagAddMenuNavigationToggleDialog);
local v36 = require(script.Flags.FFlagEnableGamepadMenuSelector);
local l_FTUX_0 = l_RobloxGui_0.Modules.FTUX;
local v38 = require(l_FTUX_0.Flags.GetFFlagEnableVRFTUXExperience);
local v39 = require(l_FTUX_0.Flags.GetFFlagDebugEnableVRFTUXExperienceInStudio);
local v40 = require(l_FTUX_0.Enums.PlatformEnum);
local v41 = require(l_FTUX_0.Utility.IsFTUXExperience);
local v42 = require(script.Parent.FTUX);
local l_isRunningInStudio_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isRunningInStudio;
local v44 = {};
v44.__index = v44;
v44.new = function()
    local v45 = setmetatable({}, v44);
    if v32.propValidation then
        v9.setGlobalConfig({
            propValidation = true
        });
    end;
    if v32.elementTracing then
        v9.setGlobalConfig({
            elementTracing = true
        });
    end;
    if not (v15:IsEnabled() or v17) then
        l_GuiService_0:SetGlobalGuiInset(0, v18.TopBarHeight, 0, 0);
    end;
    v45.store = v10.Store.new(v23, nil, {
        v10.thunkMiddleware
    });
    v31(v45.store);
    v45.store:dispatch(v29);
    v45.store:dispatch(v30);
    if not (not v39() or not l_isRunningInStudio_0()) then
        v42.mountFtuxMenu(v40.QuestVR);
    end;
    if not (not v38() or not v41(v40.QuestVR)) then
        v42.mountFtuxMenu(v40.QuestVR);
    end;
    if v16() then
        require(l_RobloxGui_0.Modules.InGameMenuInit).mountInGameMenu();
    end;
    coroutine.wrap(function()
        v45.store:dispatch(v25(v14:IsSmallTouchScreen()));
    end)();
    local v46 = {
        themeName = l_Constants_0.ThemeName.Dark, 
        fontName = l_Constants_0.FontName.Gotham
    };
    local function v48(v47)
        return {
            UiModeStyleProvider = v9.createElement(l_UiModeStyleProvider_0, {
                style = v46
            }, v47)
        };
    end;
    local v49 = v9.createElement(v22);
    if v35 then
        v49 = v9.createElement(l_DesignTokenProvider_0, {
            tokenMappers = {
                MenuNavigationPrompt = if not v36 then nil else v19
            }
        }, {
            TopBarApp = v49
        });
    end;
    v45.root = v9.createElement(v11.StoreProvider, {
        store = v45.store
    }, {
        PolicyProvider = v9.createElement(v24.Provider, {
            policy = {
                v24.Mapper
            }
        }, (v48({
            LocalizationProvider = v9.createElement(l_LocalizationProvider_0, {
                localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
            }, {
                ExperimentProvider = v9.createFragment({
                    RoactAppExperimentProvider = not not v34() and v9.createElement(v33.Provider, {
                        value = l_IXPService_0
                    }, {
                        TopBarApp = v49
                    }) or nil, 
                    TopBarApp = not v34() and v49 or nil
                })
            })
        })))
    });
    v45.element = v9.mount(v45.root, l_CoreGui_0, "TopBar");
    game:GetService("TextChatService").MessageReceived:Connect(function()
        v45.store:dispatch(v28(1));
    end);
    return v45;
end;
v44.setInspectMenuOpen = function(v50, v51)
    v50.store:dispatch(v26(v51));
end;
v44.setGamepadMenuOpen = function(v52, v53)
    v52.store:dispatch(v27(v53));
end;
return v44.new();
