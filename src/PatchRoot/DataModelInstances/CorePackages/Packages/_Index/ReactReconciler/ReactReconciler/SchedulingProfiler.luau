local v0 = {};
local l_Parent_0 = script.Parent.Parent;
local l_WeakMap_0 = require(l_Parent_0.LuauPolyfill).WeakMap;
local _ = require(script.Parent.ReactFiberLane);
local _ = require(script.Parent.ReactInternalTypes);
local _ = require(l_Parent_0.Shared);
local l_enableSchedulingProfiler_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableSchedulingProfiler;
local l_ReactVersion_0 = require(l_Parent_0.Shared).ReactVersion;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local v9 = _G.performance ~= nil;
local v11 = _G.performance or {
    mark = function(v10)
        debug.profilebegin(v10);
        debug.profileend();
    end
};
formatLanes = function(v12)
    return (tostring(v12));
end;
if not (not l_enableSchedulingProfiler_0 or not v9) then
    v11.mark("--react-init-" .. tostring(l_ReactVersion_0));
end;
v0.markCommitStarted = function(v13)
    if not (not l_enableSchedulingProfiler_0 or not v9) then
        v11.mark("--commit-start-" .. formatLanes(v13));
    end;
end;
v0.markCommitStopped = function()
    if not (not l_enableSchedulingProfiler_0 or not v9) then
        v11.mark("--commit-stop");
    end;
end;
local v14 = l_WeakMap_0.new();
local v15 = 0;
getWakeableID = function(v16)
    if not v14:has(v16) then
        v14:set(v16, v15);
        v15 = v15 + 1;
    end;
    return v14:get(v16);
end;
v0.markComponentSuspended = function(v17, v18)
    if not (not l_enableSchedulingProfiler_0 or not v9) then
        local v19 = getWakeableID(v18);
        local v20 = l_getComponentName_0(v17.type) or "Unknown";
        v11.mark("--suspense-suspend-" .. tostring(v19) .. "-" .. v20);
        v18:andThen(function()
            v11.mark("--suspense-resolved-" .. tostring(v19) .. "-" .. v20);
        end, function()
            v11.mark("--suspense-rejected-" .. tostring(v19) .. "-" .. v20);
        end);
    end;
end;
v0.markLayoutEffectsStarted = function(v21)
    if not (not l_enableSchedulingProfiler_0 or not v9) then
        v11.mark("--layout-effects-start-" .. formatLanes(v21));
    end;
end;
v0.markLayoutEffectsStopped = function()
    if not (not l_enableSchedulingProfiler_0 or not v9) then
        v11.mark("--layout-effects-stop");
    end;
end;
v0.markPassiveEffectsStarted = function(v22)
    if not (not l_enableSchedulingProfiler_0 or not v9) then
        v11.mark("--passive-effects-start-" .. formatLanes(v22));
    end;
end;
v0.markPassiveEffectsStopped = function()
    if not (not l_enableSchedulingProfiler_0 or not v9) then
        v11.mark("--passive-effects-stop");
    end;
end;
v0.markRenderStarted = function(v23)
    if not (not l_enableSchedulingProfiler_0 or not v9) then
        v11.mark("--render-start-" .. formatLanes(v23));
    end;
end;
v0.markRenderYielded = function()
    if not (not l_enableSchedulingProfiler_0 or not v9) then
        v11.mark("--render-yield");
    end;
end;
v0.markRenderStopped = function()
    if not (not l_enableSchedulingProfiler_0 or not v9) then
        v11.mark("--render-stop");
    end;
end;
v0.markRenderScheduled = function(v24)
    if not (not l_enableSchedulingProfiler_0 or not v9) then
        v11.mark("--schedule-render-" .. formatLanes(v24));
    end;
end;
v0.markForceUpdateScheduled = function(v25, v26)
    if not (not l_enableSchedulingProfiler_0 or not v9) then
        v11.mark("--schedule-forced-update-" .. formatLanes(v26) .. "-" .. (l_getComponentName_0(v25.type) or "Unknown"));
    end;
end;
v0.markStateUpdateScheduled = function(v27, v28)
    if not (not l_enableSchedulingProfiler_0 or not v9) then
        v11.mark("--schedule-state-update-" .. formatLanes(v28) .. "-" .. (l_getComponentName_0(v27.type) or "Unknown"));
    end;
end;
return v0;
