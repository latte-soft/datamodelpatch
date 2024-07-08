local l_RunService_0 = game:GetService("RunService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("FocusNavigationUtils");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.ReactFocusNavigation);
local l_MessageBus_0 = require(l_Parent_0.MessageBus).MessageBus;
local v7 = require(l_Parent_0.LoggingProtocol);
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local l_GetFFlagEnableAppCommonInputHooks_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableAppCommonInputHooks;
local v10 = nil;
v10 = if not l_GetFFlagEnableAppCommonInputHooks_0() then v5.useLastInputMethod else require(l_script_FirstAncestor_0.useLastInputMethod);
local l_useFocusGuiObject_0 = v5.useFocusGuiObject;
local l_useRegistryEntry_0 = require(l_script_FirstAncestor_0.FocusNavigableSurfaceRegistry).useRegistryEntry;
local v13 = require(l_script_FirstAncestor_0.FocusNavigableSurfaceIdentifierEnum);
local v14 = require(l_script_FirstAncestor_0.useAutoFocus);
local v15 = require(l_script_FirstAncestor_0.useDescendantHasFocus);
local v16 = game:DefineFastFlag("EnableKeyboardFocusHandling", false);
local v17 = game:DefineFastFlag("TenFootUiCorrectAutoFocusLoggingBehavior", false);
local v18 = game:DefineFastInt("AutoFocusFailsafeThreshold", 5);
local v19 = game:DefineFastFlag("LuaAppDismissFocusOnClick", false);
local v20 = {
    [Enum.UserInputType.MouseButton1] = true, 
    [Enum.UserInputType.MouseButton2] = true, 
    [Enum.UserInputType.MouseButton3] = true, 
    [Enum.UserInputType.Touch] = true
};
local v21 = l_MessageBus_0.Subscriber.new();
local l_default_0 = v7.default;
local function v24(v23)
    if typeof(v23) == "table" then
        return true;
    else
        return false;
    end;
end;
local function _(v25)
    local v26 = 0;
    return (l_RunService_0.Heartbeat:Connect(function(v27)
        v26 = v26 + v27;
        if v18 < v26 then
            v25();
            v26 = 0;
        end;
    end));
end;
local function v33(v29)
    local v30 = l_MessageBus_0.getMessageId("Game", "onGameLeave");
    local v31 = nil;
    v21:subscribe({
        mid = v30, 
        validateParams = v24
    }, function(_)
        v31 = task.delay(v18, function()
            v29();
        end);
    end);
    return {
        unsubscribe = function()
            v21:unsubscribeWithMsgId(v30);
            if v31 then
                task.cancel(v31);
            end;
        end
    };
end;
return function(v34)
    local v35 = v10();
    local v36 = l_useFocusGuiObject_0();
    local v37 = true;
    if v35 ~= "Gamepad" then
        v37 = if not v16 then nil else v35 == "Keyboard";
    end;
    if v19 then
        v4.useEffect(function()
            local v39 = l_UserInputService_0.LastInputTypeChanged:Connect(function(v38)
                if v20[v38] then
                    v36(nil);
                end;
            end);
            return function()
                v39:Disconnect();
            end;
        end, {
            v36
        });
    end;
    local v40 = l_useRegistryEntry_0(v13.NavBar);
    local v41 = l_useRegistryEntry_0(v13.RouterView);
    local v42 = l_useRegistryEntry_0(v13.CentralOverlay);
    local v43 = l_useRegistryEntry_0(v13.ModerationOverlay);
    local v45 = v4.useMemo(function()
        local v44 = {};
        if not v43 then
            if not v42 then
                if v41 then
                    table.insert(v44, v41);
                end;
                if v40 then
                    table.insert(v44, v40);
                end;
                return v44;
            else
                table.insert(v44, v42);
                return v44;
            end;
        else
            table.insert(v44, v43);
            return v44;
        end;
    end, {
        v43, 
        v41, 
        v40, 
        v42
    });
    local v46 = v14(v45, 0.1);
    local v47 = v15(v40);
    local v48 = v15(v41);
    local v49 = v15(v42);
    local v50 = v15(v43);
    local _ = nil;
    local v52 = (v37 and not if not v43 then if v42 then v49 else v47 or v48 else v50) and not v34;
    v4.useEffect(function()
        local v53 = nil;
        local v54 = nil;
        local function v55()
            if v53 then
                v53.cancel();
            end;
            v53 = v46();
        end;
        if v52 then
            if v53 then
                v53.cancel();
            end;
            v53 = v46();
            local function v56()
                if not v17 then
                    l_default_0:logEvent("GamePadFocusFailsafeActivated", {
                        targetCount = #v45
                    });
                else
                    l_mutedError_0("[useGlobalFocusHandler] globalFocusHandler failed to autofocus with " .. #v45 .. " targets, retrying");
                end;
                if v53 then
                    v53.cancel();
                end;
                v53 = v46();
            end;
            local v57 = 0;
            local l_v56_0 = v56 --[[ copy: 3 -> 5 ]];
            do
                local l_v57_0 = v57;
                v54 = l_RunService_0.Heartbeat:Connect(function(v60)
                    l_v57_0 = l_v57_0 + v60;
                    if v18 < l_v57_0 then
                        l_v56_0();
                        l_v57_0 = 0;
                    end;
                end);
            end;
        end;
        local v61 = nil;
        if v52 then
            v61 = v33(v55);
        end;
        return function()
            if v53 then
                v53.cancel();
            end;
            if v61 then
                v61.unsubscribe();
            end;
            if v54 then
                v54:Disconnect();
            end;
        end;
    end, {
        v52, 
        v46, 
        v45
    });
end;
