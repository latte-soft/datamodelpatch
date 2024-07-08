local l_Parent_0 = script.Parent.Parent;
local l_console_0 = require(l_Parent_0.Shared).console;
local v2 = {};
local _ = require(l_Parent_0.Shared);
local _ = require(script.Parent.ReactInternalTypes);
local l_isPrimaryRenderer_0 = require(script.Parent.ReactFiberHostConfig).isPrimaryRenderer;
local v6 = {};
local v7 = nil;
if _G.__DEV__ then
    v7 = {};
end;
v2.markSourceAsDirty = function(v8)
    table.insert(v6, v8);
end;
v2.resetWorkInProgressVersions = function()
    for _, v10 in v6, nil, nil do
        if not l_isPrimaryRenderer_0 then
            v10._workInProgressVersionSecondary = nil;
        else
            v10._workInProgressVersionPrimary = nil;
        end;
    end;
    table.clear(v6);
end;
v2.getWorkInProgressVersion = function(v11)
    if not l_isPrimaryRenderer_0 then
        return v11._workInProgressVersionSecondary;
    else
        return v11._workInProgressVersionPrimary;
    end;
end;
v2.setWorkInProgressVersion = function(v12, v13)
    if not l_isPrimaryRenderer_0 then
        v12._workInProgressVersionSecondary = v13;
    else
        v12._workInProgressVersionPrimary = v13;
    end;
    table.insert(v6, v12);
end;
v2.warnAboutMultipleRenderersDEV = function(v14)
    if _G.__DEV__ then
        if not l_isPrimaryRenderer_0 then
            if v14._currentSecondaryRenderer == nil then
                v14._currentSecondaryRenderer = v7;
                return ;
            elseif v14._currentSecondaryRenderer ~= v7 then
                l_console_0.error("Detected multiple renderers concurrently rendering the " .. "same mutable source. This is currently unsupported.");
            end;
        elseif v14._currentPrimaryRenderer == nil then
            v14._currentPrimaryRenderer = v7;
            return ;
        elseif v14._currentPrimaryRenderer ~= v7 then
            l_console_0.error("Detected multiple renderers concurrently rendering the " .. "same mutable source. This is currently unsupported.");
            return ;
        end;
    end;
end;
v2.registerMutableSourceForHydration = function(v15, v16)
    local v17 = v16._getVersion(v16._source);
    if v15.mutableSourceEagerHydrationData == nil then
        v15.mutableSourceEagerHydrationData = {
            v16, 
            v17
        };
        return ;
    else
        return ;
    end;
end;
return v2;
