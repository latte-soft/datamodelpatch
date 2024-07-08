local l_console_0 = require(script.Parent.Parent.Shared).console;
local v1 = {};
local function _(v2, v3)
    if _G.__DEV__ then
        local v4 = v2.__componentName or "ReactClass";
        local v5 = v4 .. "." .. v3;
        if not v1[v5] then
            l_console_0.error("Can't call %s on a component that is not yet mounted. " .. "This is a no-op, but it might indicate a bug in your application. " .. "Instead, assign to `self.state` directly with the desired state in " .. "the %s component's `init` method.", v3, v4);
            v1[v5] = true;
        else
            return ;
        end;
    end;
end;
return {
    isMounted = function(_)
        return false;
    end, 
    enqueueForceUpdate = function(v8, _, _)
        if _G.__DEV__ then
            local v11 = v8.__componentName or "ReactClass";
            local v12 = v11 .. "." .. "forceUpdate";
            if not v1[v12] then
                l_console_0.error("Can't call %s on a component that is not yet mounted. " .. "This is a no-op, but it might indicate a bug in your application. " .. "Instead, assign to `self.state` directly with the desired state in " .. "the %s component's `init` method.", "forceUpdate", v11);
                v1[v12] = true;
            else
                return ;
            end;
        end;
    end, 
    enqueueReplaceState = function(v13, _, _, _)
        if _G.__DEV__ then
            local v17 = v13.__componentName or "ReactClass";
            local v18 = v17 .. "." .. "replaceState";
            if not v1[v18] then
                l_console_0.error("Can't call %s on a component that is not yet mounted. " .. "This is a no-op, but it might indicate a bug in your application. " .. "Instead, assign to `self.state` directly with the desired state in " .. "the %s component's `init` method.", "replaceState", v17);
                v1[v18] = true;
            else
                return ;
            end;
        end;
    end, 
    enqueueSetState = function(v19, _, _, _)
        if _G.__DEV__ then
            local v23 = v19.__componentName or "ReactClass";
            local v24 = v23 .. "." .. "setState";
            if not v1[v24] then
                l_console_0.error("Can't call %s on a component that is not yet mounted. " .. "This is a no-op, but it might indicate a bug in your application. " .. "Instead, assign to `self.state` directly with the desired state in " .. "the %s component's `init` method.", "setState", v23);
                v1[v24] = true;
            else
                return ;
            end;
        end;
    end
};
