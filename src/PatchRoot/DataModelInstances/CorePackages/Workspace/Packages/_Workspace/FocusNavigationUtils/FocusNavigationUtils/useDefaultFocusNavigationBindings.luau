local l_script_FirstAncestor_0 = script:FindFirstAncestor("FocusNavigationUtils");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactFocusNavigation);
local v4 = require(l_Parent_0.InputHandlers);
local l_useNavigation_0 = require(l_Parent_0.RoactUtils).Hooks.useNavigation;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_canGoBack_0 = require(l_Parent_0.Navigation).canGoBack;
local v8 = require(l_script_FirstAncestor_0.FocusNavigationEventNameEnum);
local l_useFocusRegistryEntry_0 = require(l_script_FirstAncestor_0.FocusNavigableSurfaceRegistry).useFocusRegistryEntry;
local v10 = require(l_script_FirstAncestor_0.FocusNavigableSurfaceIdentifierEnum);
local v11 = require(l_script_FirstAncestor_0.useDescendantHasFocus);
local l_useRegistryEntry_0 = require(l_script_FirstAncestor_0.FocusNavigableSurfaceRegistry).useRegistryEntry;
local v13 = {
    [Enum.KeyCode.ButtonB] = v8.NavigateBack, 
    [Enum.KeyCode.Escape] = v8.NavigateBack, 
    [Enum.KeyCode.ButtonY] = v8.Search, 
    [Enum.KeyCode.Slash] = v8.Search, 
    [Enum.KeyCode.PageUp] = v8.ScrollUp, 
    [Enum.KeyCode.LeftBracket] = v8.ScrollUp, 
    [Enum.KeyCode.PageDown] = v8.ScrollDown, 
    [Enum.KeyCode.RightBracket] = v8.ScrollDown
};
local function _(v14)
    if v14 == nil then
        return nil;
    elseif not v14:IsA("ScrollingFrame") then
        return v14:FindFirstAncestorWhichIsA("ScrollingFrame");
    else
        return v14;
    end;
end;
local function v19(v16, v17)
    if v16 ~= nil then
        local v18 = v16.AbsoluteCanvasSize.Y - v16.AbsoluteWindowSize.Y;
        if v17 > 0 and v18 - 350 <= v16.CanvasPosition.Y then
            v16.CanvasPosition = Vector2.new(0, v18);
            return ;
        elseif v17 < 0 and v16.CanvasPosition.Y <= 350 then
            v16.CanvasPosition = Vector2.new(0, 0);
            return ;
        else
            v16.CanvasPosition = v16.CanvasPosition + Vector2.new(0, v17);
        end;
    end;
end;
useDefaultFocusNavigationBindings = function(v20)
    local v21 = l_useNavigation_0();
    local v22 = l_useFocusRegistryEntry_0(v10.SearchBar);
    local v23 = l_useFocusRegistryEntry_0(v10.NavBar);
    local v24 = v11((l_useRegistryEntry_0(v10.NavBar)));
    local v26 = l_useSelector_0(function(v25)
        return v25.TabBarVisible;
    end);
    local v27 = v3.useFocusedGuiObject();
    local v28 = if v27 == nil then nil else if v27:IsA("ScrollingFrame") then v27 else v27:FindFirstAncestorWhichIsA("ScrollingFrame");
    return (v3.useEventHandlerMap(v2.useMemo(function()
        return {
            [v8.Search] = {
                handler = v4.onRelease(function(_)
                    v22();
                end)
            }, 
            [v8.NavigateBack] = {
                handler = v4.onRelease(function(_)
                    if not l_canGoBack_0(v21) then
                        if not (not v26 or v24) then
                            v23();
                        end;
                        return ;
                    elseif v21.pop ~= nil then
                        v21.pop();
                        return ;
                    else
                        v21.goBack();
                        return ;
                    end;
                end)
            }, 
            [v8.ScrollDown] = {
                handler = v4.onRelease(function(_)
                    v19(v28, 300);
                end)
            }, 
            [v8.ScrollUp] = {
                handler = v4.onRelease(function(_)
                    v19(v28, -300);
                end)
            }
        };
    end, {
        v21, 
        v22, 
        v23, 
        v24, 
        v26, 
        v28
    }), (v3.useEventMap(v13, v20))));
end;
return useDefaultFocusNavigationBindings;
