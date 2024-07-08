local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.UIBlox);
local v6 = require(l_CorePackages_0.Cryo);
local v7 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v8 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_FocusNavigationEventNameEnum_0 = v8.FocusNavigationEventNameEnum;
local l_useEventMap_0 = v7.useEventMap;
local l_GetFFlagEnableAppCommonInputHooks_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAppCommonInputHooks;
local v12 = nil;
v12 = if not l_GetFFlagEnableAppCommonInputHooks_0() then v7.useLastInputMethod else v8.useLastInputMethod;
local v13 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v14 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v15 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppEnable10ftCloseSignupDropdown);
local v16 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppFix10ftSignUpDropdown);
local v17 = game:DefineFastFlag("LuaAppDropdownMenuFixSelectionOrder", false);
local v18 = require(l_Modules_0.LuaApp.Flags.GetFFlagDisableUADPadNavigationInVR);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_DropdownMenu_0 = v5.App.Menu.DropdownMenu;
return function(v21)
    local v22 = v13(v14);
    local v23, v24 = v4.useState(nil);
    local v25, v26 = v4.useState(false);
    local v27, v28 = v4.useState(false);
    local v29 = l_useEventMap_0(v4.useMemo(function()
        if not v25 then
            return {};
        else
            return {
                [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NoOpEvent, 
                [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NoOpEvent
            };
        end;
    end, {
        v25
    }), v24);
    local v30 = v12();
    local v31;
    if not v18() then
        v31 = true;
        if v30 ~= "Gamepad" then
            v31 = v30 == "Keyboard";
        end;
    else
        if v30 ~= "Gamepad" then
            v31 = false;
            if not (v30 == "Keyboard") then
                goto label0;
            end;
        end;
        v31 = not l_IsVRAppBuild_0();
    end;
    ::label0::;
    local v33 = v4.useCallback(function(v32)
        if v21.analyticsContext then
            v22.EventStream:setRBXEvent(v21.analyticsContext, "DropdownMenuState", {
                menuOpen = v32
            });
        end;
    end, {
        v22, 
        v21.analyticsContext
    });
    return v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = UDim2.fromScale(1, 1), 
        Selectable = false, 
        ref = v29
    }, {
        DropdownMenu = v4.createElement(l_DropdownMenu_0, (v6.Dictionary.join(v21, {
            onMenuOpenChange = v4.useCallback(function(v34)
                v26(v34);
                v33(v34);
                if v15() then
                    v28(false);
                end;
                if not (not v23 or not v21.selectionGroupName) then
                    if not v34 then
                        if v15() then
                            l_ContextActionService_0:UnbindAction("CloseDropdownBind");
                            if v16() then
                                v28(false);
                            end;
                        end;
                        l_GuiService_0:RemoveSelectionGroup(v21.selectionGroupName);
                        if v31 then
                            l_GuiService_0:Select(v23);
                        end;
                    else
                        l_GuiService_0:AddSelectionParent(v21.selectionGroupName, v23);
                        if v15() then
                            l_ContextActionService_0:BindAction("CloseDropdownBind", function()
                                v28(true);
                            end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape);
                        end;
                    end;
                end;
                if v21.onMenuOpenChange then
                    v21.onMenuOpenChange(v34);
                end;
            end, {
                v23, 
                v21.selectionGroupName, 
                v21.onMenuOpenChange
            }), 
            onChange = v4.useCallback(function(v35)
                if v21.analyticsContext then
                    v22.EventStream:setRBXEvent(v21.analyticsContext, "DropdownMenuSelect", {
                        selection = tostring(v35)
                    });
                end;
                return v21.onChange(v35);
            end, {
                v22, 
                v21.analyticsContext, 
                v21.onChange
            }), 
            selectionGroupName = v6.None, 
            analyticsContext = v6.None, 
            selectionOrder = if not v17 then nil else 1, 
            isForcedClosed = if not v15() then nil else v27
        })))
    });
end;
