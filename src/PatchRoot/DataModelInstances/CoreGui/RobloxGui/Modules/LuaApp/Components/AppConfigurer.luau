local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local _ = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local v4 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_useGlobalFocusHandler_0 = v4.useGlobalFocusHandler;
local l_useGlobalDefaultSelectionCursor_0 = v4.useGlobalDefaultSelectionCursor;
local v7 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_useUiModeInfo_0 = v7.useUiModeInfo;
game:DefineFastFlag("LuaAppInlineRequireAppConfigurer", false);
if not game:GetFastFlag("LuaAppInlineRequireAppConfigurer") then
    local _ = require(l_Modules_0.LuaApp.TenFootUI.TenFootUiDependencies);
    local _ = require(l_Modules_0.AvatarExperience.Common.Components.AvatarExperienceMountedAtStartup);
    local _ = require(l_Modules_0.LuaApp.Components.CentralOverlay);
    local _ = require(l_Modules_0.LuaApp.Constants);
    local _ = require(l_Modules_0.LuaApp.Components.ToastV2);
    local _ = require(l_Modules_0.LuaApp.Components.AppContainer);
end;
local v16 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagEnableUniversalFocusNavigation_0 = v16.FFlagEnableUniversalFocusNavigation;
local l_FFlagLuaAppDefaultSelectionCursor_0 = v16.FFlagLuaAppDefaultSelectionCursor;
local l_FFlagUnifyNavigationGraph_0 = v16.FFlagUnifyNavigationGraph;
return function(v20)
    if l_FFlagEnableUniversalFocusNavigation_0 then
        l_useGlobalFocusHandler_0();
    end;
    if l_FFlagLuaAppDefaultSelectionCursor_0 then
        l_useGlobalDefaultSelectionCursor_0();
    end;
    if (v20.uiModeInfo or l_useUiModeInfo_0()).uiMode == l_UiMode_0.TenFoot then
        local v21 = require(l_Modules_0.LuaApp.TenFootUI.TenFootUiDependencies);
        local v22 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarExperienceMountedAtStartup);
        local v23 = require(l_Modules_0.LuaApp.Components.CentralOverlay);
        local v24 = require(l_Modules_0.LuaApp.Constants);
        local v25 = require(l_Modules_0.LuaApp.Components.ToastV2);
        local l_TenFootUiContainer_0 = require(l_CorePackages_0.Workspace.Packages.TenFootUiShell).TenFootUiContainer;
        settings().Rendering.EnableFRM = true;
        settings().Rendering.AutoFRMLevel = settings().Rendering:GetMaxQualityLevel();
        return v2.createElement(v2.Fragment, nil, v2.createElement(l_TenFootUiContainer_0, {
            store = v20.store, 
            rnBypassActionSignal = if not l_FFlagUnifyNavigationGraph_0 then v20.rnBypassActionSignal else nil, 
            updateRoute = if not l_FFlagUnifyNavigationGraph_0 then v20.updateRoute else nil, 
            dependencies = v21, 
            toast = v2.createElement(v25, {
                displayOrder = v24.DisplayOrder.Toast
            }), 
            centralOverlay = v2.createElement(v23, {
                includeStatusBar = false, 
                displayOrder = v24.DisplayOrder.CentralOverlay
            })
        }), v2.createElement(v22, {
            store = v20.store, 
            shouldManageBackground = true
        }));
    else
        return v2.createElement(require(l_Modules_0.LuaApp.Components.AppContainer), {
            experienceEventReceiver = v20.experienceEventReceiver, 
            store = v20.store, 
            rnBypassActionSignal = if not l_FFlagUnifyNavigationGraph_0 then v20.rnBypassActionSignal else nil, 
            updateRoute = if not l_FFlagUnifyNavigationGraph_0 then v20.updateRoute else nil
        });
    end;
end;
