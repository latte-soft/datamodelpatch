local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigableSurfaceRegistry_0 = v4.FocusNavigableSurfaceRegistry;
local l_useRegisterFocusNavigableSurface_0 = l_FocusNavigableSurfaceRegistry_0.useRegisterFocusNavigableSurface;
local l_useDeRegisterFocusNavigableSurface_0 = l_FocusNavigableSurfaceRegistry_0.useDeRegisterFocusNavigableSurface;
local l_useLastInputMethod_0 = v4.useLastInputMethod;
local l_useAutoFocus_0 = v4.useAutoFocus;
local l_useDescendantHasFocus_0 = v4.useDescendantHasFocus;
local v11 = require(l_script_FirstAncestor_0.Flags.FFlagFixBulkPurchaseFocusRelease);
return function(v12)
    local v13, v14 = v3.useState(nil);
    local v15 = l_useRegisterFocusNavigableSurface_0();
    local v16 = l_useDeRegisterFocusNavigableSurface_0();
    local v17 = l_useAutoFocus_0({
        v13
    }, 0.1);
    local v18 = l_useDescendantHasFocus_0(v13);
    local v19 = l_useLastInputMethod_0();
    local v20 = true;
    if v19 ~= "Gamepad" then
        v20 = v19 == "Keyboard";
    end;
    v3.useEffect(function()
        if not v13 then
            v16(v12.focusNavigableSurfaceIdentifier, v13);
            l_GuiService_0:RemoveSelectionGroup(v12.selectionGroupName);
            if v11 then
                l_GuiService_0.SelectedCoreObject = nil;
            end;
        else
            v15(v12.focusNavigableSurfaceIdentifier, v13);
            l_GuiService_0:AddSelectionParent(v12.selectionGroupName, v13);
        end;
        return function()
            v16(v12.focusNavigableSurfaceIdentifier, v13);
            l_GuiService_0:RemoveSelectionGroup(v12.selectionGroupName);
            if v11 then
                l_GuiService_0.SelectedCoreObject = nil;
            end;
        end;
    end, {
        v13, 
        v12.focusNavigableSurfaceIdentifier, 
        v12.selectionGroupName
    });
    local v21 = (v20 and v13) and not v18;
    v3.useEffect(function()
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
    return v14;
end;
