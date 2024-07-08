local v0 = require(script.Parent.invariant);
local v1 = require(script.Parent.invokeGuardedCallbackImpl);
local v2 = nil;
local v3 = false;
local v4 = nil;
local v5 = false;
local v6 = nil;
local v8 = {
    onError = function(v7)
        v3 = true;
        v4 = v7;
    end
};
local v9 = {
    invokeGuardedCallback = function(...)
        v3 = false;
        v4 = nil;
        v1(v8, ...);
    end
};
v9.invokeGuardedCallbackAndCatchFirstError = function(...)
    v9.invokeGuardedCallback(...);
    if v3 then
        local v10 = v2();
        if not v5 then
            v5 = true;
            v6 = v10;
        end;
    end;
end;
v9.rethrowCaughtError = function()
    if v5 then
        local l_v6_0 = v6;
        v5 = false;
        v6 = nil;
        error(l_v6_0);
    end;
end;
v9.hasCaughtError = function()
    return v3;
end;
v2 = function()
    if not v3 then
        v0(false, "clearCaughtError was called but no error was captured. This error " .. "is likely caused by a bug in React. Please file an issue.");
        return nil;
    else
        local l_v4_0 = v4;
        v3 = false;
        v4 = nil;
        return l_v4_0;
    end;
end;
v9.clearCaughtError = v2;
return v9;
