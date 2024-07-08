local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_FocusNavigableSurfaceRegistry_0 = v3.FocusNavigableSurfaceRegistry;
local l_GetFFlagEnableAppCommonInputHooks_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAppCommonInputHooks;
local v6 = nil;
v6 = if not l_GetFFlagEnableAppCommonInputHooks_0() then require(l_CorePackages_0.Packages.ReactFocusNavigation).useLastInputMethod else v3.useLastInputMethod;
local l_useRegisterFocusNavigableSurface_0 = l_FocusNavigableSurfaceRegistry_0.useRegisterFocusNavigableSurface;
local l_useDeRegisterFocusNavigableSurface_0 = l_FocusNavigableSurfaceRegistry_0.useDeRegisterFocusNavigableSurface;
local l_useAutoFocus_0 = v3.useAutoFocus;
local l_useDescendantHasFocus_0 = v3.useDescendantHasFocus;
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
return function(v12)
    local v13, v14 = v2.useState(nil);
    local v15 = l_useRegisterFocusNavigableSurface_0();
    local v16 = l_useDeRegisterFocusNavigableSurface_0();
    local v17 = l_useAutoFocus_0({
        v13
    }, 0.1);
    local v18 = l_useDescendantHasFocus_0(v13);
    local v19 = v6();
    local v20 = true;
    if v19 ~= "Gamepad" then
        v20 = v19 == "Keyboard";
    end;
    v2.useEffect(function()
        if not v13 then
            v16(v12.focusNavigableSurfaceIdentifier, v13);
            if v12.selectionGroupName then
                l_GuiService_0:RemoveSelectionGroup(v12.selectionGroupName);
            end;
        else
            v15(v12.focusNavigableSurfaceIdentifier, v13);
            if v12.selectionGroupName then
                l_GuiService_0:AddSelectionParent(v12.selectionGroupName, v13);
            end;
        end;
        return function()
            v16(v12.focusNavigableSurfaceIdentifier, v13);
            if v12.selectionGroupName then
                l_GuiService_0:RemoveSelectionGroup(v12.selectionGroupName);
            end;
        end;
    end, {
        v13, 
        v12.focusNavigableSurfaceIdentifier, 
        v12.selectionGroupName
    });
    local v21 = (v20 and v13) and not v18;
    v2.useEffect(function()
        local v22 = nil;
        if v21 then
            v22 = v17();
        end;
        return function()
            if v22 then
                v22.cancel();
            end;
        end;
    end, {
        v21, 
        v17
    });
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        AutomaticSize = v12.automaticSize, 
        Size = if not v12.size then UDim2.new(1, 0, 1, 0) else v12.size, 
        ref = v14
    }, v12.children);
end;
