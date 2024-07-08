local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local l_console_0 = v1.console;
local v4 = require(l_Parent_0.Promise);
local v5 = {};
local v6 = require(l_Parent_0.Shared);
local l_ReactSharedInternals_0 = v6.ReactSharedInternals;
local l_enqueueTask_0 = v6.enqueueTask;
local v9 = require(l_Parent_0.Scheduler);
local v10 = require(l_Parent_0.ReactRoblox);
local l_Events_0 = v10.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED.Events;
local l_IsThisRendererActing_0 = l_Events_0.IsThisRendererActing;
local l_flushPassiveEffects_0 = l_Events_0.flushPassiveEffects;
local l_unstable_batchedUpdates_0 = v10.unstable_batchedUpdates;
local l_IsSomeRendererActing_0 = l_ReactSharedInternals_0.IsSomeRendererActing;
local v16 = typeof(v9.unstable_flushAllWithoutAsserting) == "function";
local function _()
    local v17 = false;
    while l_flushPassiveEffects_0() do
        v17 = true;
    end;
    return v17;
end;
local function v19(v20)
    local l_status_0, l_result_0 = pcall(function()
        local v21 = false;
        while l_flushPassiveEffects_0() do
            v21 = true;
        end;
        l_enqueueTask_0(function()
            local v22 = false;
            while l_flushPassiveEffects_0() do
                v22 = true;
            end;
            if not v22 then
                v20();
                return ;
            else
                v19(v20);
                return ;
            end;
        end);
    end);
    if not l_status_0 then
        v20(l_result_0);
    end;
end;
local v25 = 0;
local v26 = false;
v5.default = function(v27)
    if not _G.__DEV__ and v26 == false then
        v26 = true;
        l_console_0.error("act(...) is not supported in production builds of React, and might not behave as expected.");
    end;
    local l_v25_0 = v25;
    local v29 = nil;
    local v30 = nil;
    v25 = v25 + 1;
    v29 = l_IsSomeRendererActing_0.current;
    v30 = l_IsThisRendererActing_0.current;
    l_IsSomeRendererActing_0.current = true;
    l_IsThisRendererActing_0.current = true;
    local function _()
        v25 = v25 - 1;
        l_IsSomeRendererActing_0.current = v29;
        l_IsThisRendererActing_0.current = v30;
        if _G.__DEV__ and l_v25_0 < v25 then
            l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
        end;
    end;
    local v32 = nil;
    local l_status_1, l_result_1 = pcall(function()
        v32 = l_unstable_batchedUpdates_0(v27);
    end);
    if not l_status_1 then
        v25 = v25 - 1;
        l_IsSomeRendererActing_0.current = v29;
        l_IsThisRendererActing_0.current = v30;
        if _G.__DEV__ and l_v25_0 < v25 then
            l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
        end;
        error(l_result_1);
    end;
    if (v32 ~= nil and typeof(v32) == "table") and typeof(v32.andThen) == "function" then
        local v35 = false;
        if _G.__DEV__ and typeof(v4) ~= "nil" then
            v4.delay(0):andThen(function()
                if v35 == false then
                    l_console_0.error("You called act(async () => ...) without await. " .. "This could lead to unexpected testing behaviour, interleaving multiple act " .. "calls and mixing their scopes. You should - await act(async () => ...);");
                end;
            end);
        end;
        return v4.new(function(v36, v37)
            v35 = true;
            v32:andThen(function()
                if not (v25 <= 1) or v16 == true and v29 == true then
                    v25 = v25 - 1;
                    l_IsSomeRendererActing_0.current = v29;
                    l_IsThisRendererActing_0.current = v30;
                    if _G.__DEV__ and l_v25_0 < v25 then
                        l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
                    end;
                    v36();
                    return ;
                else
                    local function v39(v38)
                        v25 = v25 - 1;
                        l_IsSomeRendererActing_0.current = v29;
                        l_IsThisRendererActing_0.current = v30;
                        if _G.__DEV__ and l_v25_0 < v25 then
                            l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
                        end;
                        if not l_Boolean_0.toJSBoolean(v38) then
                            v36();
                            return ;
                        else
                            v37(v38);
                            return ;
                        end;
                    end;
                    local l_status_2, l_result_2 = pcall(function()
                        local v40 = false;
                        while l_flushPassiveEffects_0() do
                            v40 = true;
                        end;
                        l_enqueueTask_0(function()
                            local v41 = false;
                            while l_flushPassiveEffects_0() do
                                v41 = true;
                            end;
                            if not v41 then
                                v39();
                                return ;
                            else
                                v19(v39);
                                return ;
                            end;
                        end);
                    end);
                    if not l_status_2 then
                        v39(l_result_2);
                    end;
                    return ;
                end;
            end, function(v44)
                v25 = v25 - 1;
                l_IsSomeRendererActing_0.current = v29;
                l_IsThisRendererActing_0.current = v30;
                if _G.__DEV__ and l_v25_0 < v25 then
                    l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
                end;
                v37(v44);
            end);
        end);
    else
        if _G.__DEV__ and v32 ~= nil then
            l_console_0.error("The callback passed to act(...) function " .. "must return undefined, or a Promise. You returned %s", v32);
        end;
        local l_status_3, l_result_3 = pcall(function()
            if v25 == 1 and (not (v16 ~= false) or v29 == false) then
                local v45 = false;
                while l_flushPassiveEffects_0() do
                    v45 = true;
                end;
            end;
            v25 = v25 - 1;
            l_IsSomeRendererActing_0.current = v29;
            l_IsThisRendererActing_0.current = v30;
            if _G.__DEV__ and l_v25_0 < v25 then
                l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
            end;
        end);
        if not l_status_3 then
            v25 = v25 - 1;
            l_IsSomeRendererActing_0.current = v29;
            l_IsThisRendererActing_0.current = v30;
            if _G.__DEV__ and l_v25_0 < v25 then
                l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
            end;
            error(l_result_3);
        end;
        return {
            andThen = function(_, v49)
                if _G.__DEV__ then
                    l_console_0.error("Do not await the result of calling act(...) with sync logic, it is not a Promise.");
                end;
                v49();
            end
        };
    end;
end;
return v5;
