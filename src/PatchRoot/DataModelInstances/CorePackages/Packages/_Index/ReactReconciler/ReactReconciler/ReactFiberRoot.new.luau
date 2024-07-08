local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Set_0 = v1.Set;
local l_Map_0 = v1.Map;
local _ = require(script.Parent.ReactInternalTypes);
local v5 = require(script.Parent.ReactRootTags);
local v6 = require(script.Parent.ReactFiberHostConfig);
local l_noTimeout_0 = v6.noTimeout;
local l_supportsHydration_0 = v6.supportsHydration;
local l_createHostRootFiber_0 = require(script.Parent["ReactFiber.new"]).createHostRootFiber;
local v10 = require(script.Parent.ReactFiberLane);
local l_NoLanes_0 = v10.NoLanes;
local l_NoLanePriority_0 = v10.NoLanePriority;
local l_NoTimestamp_0 = v10.NoTimestamp;
local l_createLaneMap_0 = v10.createLaneMap;
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_enableSchedulerTracing_0 = l_ReactFeatureFlags_0.enableSchedulerTracing;
local l_enableSuspenseCallback_0 = l_ReactFeatureFlags_0.enableSuspenseCallback;
local l_unstable_getThreadID_0 = require(l_Parent_0.Scheduler).tracing.unstable_getThreadID;
local l_initializeUpdateQueue_0 = require(script.Parent["ReactUpdateQueue.new"]).initializeUpdateQueue;
local l_LegacyRoot_0 = v5.LegacyRoot;
local l_BlockingRoot_0 = v5.BlockingRoot;
local l_ConcurrentRoot_0 = v5.ConcurrentRoot;
local v23 = {};
local function v28(v24, v25, v26)
    local v27 = {
        tag = v25, 
        containerInfo = v24, 
        pendingChildren = nil, 
        current = nil, 
        pingCache = nil, 
        finishedWork = nil, 
        timeoutHandle = l_noTimeout_0, 
        context = nil, 
        pendingContext = nil, 
        hydrate = v26, 
        callbackNode = nil, 
        callbackPriority = l_NoLanePriority_0, 
        eventTimes = l_createLaneMap_0(l_NoLanes_0), 
        expirationTimes = l_createLaneMap_0(l_NoTimestamp_0), 
        pendingLanes = l_NoLanes_0, 
        suspendedLanes = l_NoLanes_0, 
        pingedLanes = l_NoLanes_0, 
        expiredLanes = l_NoLanes_0, 
        mutableReadLanes = l_NoLanes_0, 
        finishedLanes = l_NoLanes_0, 
        entangledLanes = l_NoLanes_0, 
        entanglements = l_createLaneMap_0(l_NoLanes_0)
    };
    if l_supportsHydration_0 then
        v27.mutableSourceEagerHydrationData = nil;
    end;
    if l_enableSchedulerTracing_0 then
        v27.interactionThreadID = l_unstable_getThreadID_0();
        v27.memoizedInteractions = l_Set_0.new();
        v27.pendingInteractionMap = l_Map_0.new();
    end;
    if l_enableSuspenseCallback_0 then
        v27.hydrationCallbacks = nil;
    end;
    if _G.__DEV__ then
        if v25 == l_BlockingRoot_0 then
            v27._debugRootType = "createBlockingRoot()";
            return v27;
        elseif v25 == l_ConcurrentRoot_0 then
            v27._debugRootType = "createRoot()";
            return v27;
        elseif v25 == l_LegacyRoot_0 then
            v27._debugRootType = "createLegacyRoot()";
        end;
    end;
    return v27;
end;
v23.createFiberRoot = function(v29, v30, v31, v32)
    local v33 = v28(v29, v30, v31);
    if l_enableSuspenseCallback_0 then
        v33.hydrationCallbacks = v32;
    end;
    local v34 = l_createHostRootFiber_0(v30);
    v33.current = v34;
    v34.stateNode = v33;
    l_initializeUpdateQueue_0(v34);
    return v33;
end;
return v23;
