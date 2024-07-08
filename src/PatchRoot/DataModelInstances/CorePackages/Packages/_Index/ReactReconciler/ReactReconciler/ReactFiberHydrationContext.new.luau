local l_Parent_0 = script.Parent.Parent;
local l_console_0 = require(l_Parent_0.Shared).console;
local function _(v2)
    print("");
    print("");
    print("UNIMPLEMENTED ERROR: " .. v2);
    error("FIXME (roblox): " .. v2 .. " is unimplemented", 2);
end;
local _ = require(script.Parent.ReactInternalTypes);
local v5 = require(script.Parent.ReactFiberHostConfig);
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"]);
local v7 = require(script.Parent.ReactWorkTags);
local l_HostComponent_0 = v7.HostComponent;
local l_HostText_0 = v7.HostText;
local l_HostRoot_0 = v7.HostRoot;
local l_SuspenseComponent_0 = v7.SuspenseComponent;
local v12 = require(script.Parent.ReactFiberFlags);
local l_Placement_0 = v12.Placement;
local l_Hydrating_0 = v12.Hydrating;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_createFiberFromDehydratedFragment_0 = require(script.Parent["ReactFiber.new"]).createFiberFromDehydratedFragment;
local l_supportsHydration_0 = v5.supportsHydration;
local l_getNextHydratableSibling_0 = v5.getNextHydratableSibling;
local l_getFirstHydratableChild_0 = v5.getFirstHydratableChild;
local l_canHydrateInstance_0 = v5.canHydrateInstance;
local l_canHydrateTextInstance_0 = v5.canHydrateTextInstance;
local l_canHydrateSuspenseInstance_0 = v5.canHydrateSuspenseInstance;
local l_hydrateInstance_0 = v5.hydrateInstance;
local l_hydrateTextInstance_0 = v5.hydrateTextInstance;
local l_hydrateSuspenseInstance_0 = v5.hydrateSuspenseInstance;
local l_getNextHydratableInstanceAfterSuspenseInstance_0 = v5.getNextHydratableInstanceAfterSuspenseInstance;
local l_didNotMatchHydratedContainerTextInstance_0 = v5.didNotMatchHydratedContainerTextInstance;
local l_didNotMatchHydratedTextInstance_0 = v5.didNotMatchHydratedTextInstance;
local l_shouldSetTextContent_0 = v5.shouldSetTextContent;
local l_enableSuspenseServerRenderer_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableSuspenseServerRenderer;
local l_OffscreenLane_0 = require(script.Parent.ReactFiberLane).OffscreenLane;
local v32 = nil;
local v33 = nil;
local v34 = false;
warnIfHydrating = function()
    if not (not _G.__DEV__ or not v34) then
        l_console_0.error("We should not be hydrating here. This is a bug in React. Please file a bug.");
    end;
end;
enterHydrationState = function(v35)
    if l_supportsHydration_0 then
        v33 = l_getFirstHydratableChild_0(v35.stateNode.containerInfo);
        v32 = v35;
        v34 = true;
        return true;
    else
        return false;
    end;
end;
reenterHydrationStateFromDehydratedSuspenseInstance = function(v36, v37)
    if l_supportsHydration_0 then
        v33 = l_getNextHydratableSibling_0(v37);
        popToNextHostParent(v36);
        v34 = true;
        return true;
    else
        return false;
    end;
end;
deleteHydratableInstance = function(_, _)
    print("");
    print("");
    print("UNIMPLEMENTED ERROR: " .. "deleteHydratableInstance");
    error("FIXME (roblox): " .. "deleteHydratableInstance" .. " is unimplemented", 2);
end;
insertNonHydratedInstance = function(_, v41)
    print("");
    print("");
    print("UNIMPLEMENTED ERROR: " .. "insertNonHydratedInstance");
    error("FIXME (roblox): " .. "insertNonHydratedInstance" .. " is unimplemented", 2);
    v41.flags = bit32.bor(bit32.band(v41.flags, (bit32.bnot(l_Hydrating_0))), l_Placement_0);
    if _G.__DEV__ then
    end;
end;
tryHydrate = function(v42, v43)
    if v42.tag == l_HostComponent_0 then
        local v44 = l_canHydrateInstance_0(v43, v42.type, v42.pendingProps);
        if v44 ~= nil then
            v42.stateNode = v44;
            return true;
        else
            return false;
        end;
    elseif v42.tag == l_HostText_0 then
        local v45 = l_canHydrateTextInstance_0(v43, v42.pendingProps);
        if v45 ~= nil then
            v42.stateNode = v45;
            return true;
        else
            return false;
        end;
    elseif v42.tag == l_SuspenseComponent_0 then
        if l_enableSuspenseServerRenderer_0 then
            local v46 = l_canHydrateSuspenseInstance_0(v43);
            if v46 ~= nil then
                v42.memoizedState = {
                    dehydrated = v46, 
                    retryLane = l_OffscreenLane_0
                };
                local v47 = l_createFiberFromDehydratedFragment_0(v46);
                v47.return_ = v42;
                v42.child = v47;
                return true;
            end;
        end;
        return false;
    else
        return false;
    end;
end;
tryToClaimNextHydratableInstance = function(v48)
    if v34 then
        local l_v33_0 = v33;
        if l_v33_0 then
            local l_l_v33_0_0 = l_v33_0;
            if not tryHydrate(v48, l_v33_0) then
                l_v33_0 = l_getNextHydratableSibling_0(l_l_v33_0_0);
                if l_v33_0 and tryHydrate(v48, l_v33_0) then
                    deleteHydratableInstance(v32, l_l_v33_0_0);
                else
                    insertNonHydratedInstance(v32, v48);
                    v34 = false;
                    v32 = v48;
                    return ;
                end;
            end;
            v32 = v48;
            v33 = l_getFirstHydratableChild_0(l_v33_0);
            return ;
        else
            insertNonHydratedInstance(v32, v48);
            v34 = false;
            v32 = v48;
            return ;
        end;
    else
        return ;
    end;
end;
prepareToHydrateHostInstance = function(v51, v52, v53)
    if not l_supportsHydration_0 then
        l_invariant_0(false, "Expected prepareToHydrateHostInstance() to never be called. " .. "This error is likely caused by a bug in React. Please file an issue.");
    end;
    local v54 = l_hydrateInstance_0(v51.stateNode, v51.type, v51.memoizedProps, v52, v53, v51);
    v51.updateQueue = v54;
    if v54 ~= nil then
        return true;
    else
        return false;
    end;
end;
prepareToHydrateHostTextInstance = function(v55)
    if not l_supportsHydration_0 then
        l_invariant_0(false, "Expected prepareToHydrateHostTextInstance() to never be called. " .. "This error is likely caused by a bug in React. Please file an issue.");
    end;
    local l_stateNode_0 = v55.stateNode;
    local l_memoizedProps_0 = v55.memoizedProps;
    local v58 = l_hydrateTextInstance_0(l_stateNode_0, l_memoizedProps_0, v55);
    if not (not _G.__DEV__ or not v58) then
        local l_v32_0 = v32;
        if l_v32_0 ~= nil then
            if l_v32_0.tag == l_HostRoot_0 then
                l_didNotMatchHydratedContainerTextInstance_0(l_v32_0.stateNode.containerInfo, l_stateNode_0, l_memoizedProps_0);
                return v58;
            elseif l_v32_0.tag == l_HostComponent_0 then
                l_didNotMatchHydratedTextInstance_0(l_v32_0.type, l_v32_0.memoizedProps, l_v32_0.stateNode, l_stateNode_0, l_memoizedProps_0);
            end;
        end;
    end;
    return v58;
end;
prepareToHydrateHostSuspenseInstance = function(v60)
    if not l_supportsHydration_0 then
        l_invariant_0(false, "Expected prepareToHydrateHostSuspenseInstance() to never be called. " .. "This error is likely caused by a bug in React. Please file an issue.");
    end;
    local l_memoizedState_0 = v60.memoizedState;
    local v62 = nil;
    v62 = if l_memoizedState_0 ~= nil then l_memoizedState_0.dehydrated else nil;
    l_invariant_0(v62, "Expected to have a hydrated suspense instance. " .. "This error is likely caused by a bug in React. Please file an issue.");
    l_hydrateSuspenseInstance_0(v62, v60);
end;
skipPastDehydratedSuspenseInstance = function(v63)
    if not l_supportsHydration_0 then
        l_invariant_0(false, "Expected skipPastDehydratedSuspenseInstance() to never be called. " .. "This error is likely caused by a bug in React. Please file an issue.");
    end;
    local l_memoizedState_1 = v63.memoizedState;
    local v65 = nil;
    v65 = if l_memoizedState_1 ~= nil then l_memoizedState_1.dehydrated else nil;
    l_invariant_0(v65, "Expected to have a hydrated suspense instance. " .. "This error is likely caused by a bug in React. Please file an issue.");
    return l_getNextHydratableInstanceAfterSuspenseInstance_0(v65);
end;
popToNextHostParent = function(v66)
    local l_return__0 = v66.return_;
    while ((l_return__0 ~= nil and l_return__0.tag ~= l_HostComponent_0) and l_return__0.tag ~= l_HostRoot_0) and l_return__0.tag ~= l_SuspenseComponent_0 do
        l_return__0 = l_return__0.return_;
    end;
    v32 = l_return__0;
end;
popHydrationState = function(v68)
    if l_supportsHydration_0 then
        if v68 ~= v32 then
            return false;
        elseif v34 then
            local l_type_0 = v68.type;
            if not (v68.tag == l_HostComponent_0 and (not (l_type_0 ~= "head" and l_type_0 ~= "body") or l_shouldSetTextContent_0(l_type_0, v68.memoizedProps))) then
                local l_v33_1 = v33;
                while l_v33_1 do
                    deleteHydratableInstance(v68, l_v33_1);
                    l_v33_1 = l_getNextHydratableSibling_0(l_v33_1);
                end;
            end;
            popToNextHostParent(v68);
            if v68.tag == l_SuspenseComponent_0 then
                v33 = skipPastDehydratedSuspenseInstance(v68);
            elseif not v32 then
                v33 = nil;
            else
                v33 = l_getNextHydratableSibling_0(v68.stateNode);
            end;
            return true;
        else
            popToNextHostParent(v68);
            v34 = true;
            return false;
        end;
    else
        return false;
    end;
end;
resetHydrationState = function()
    if l_supportsHydration_0 then
        v32 = nil;
        v33 = nil;
        v34 = false;
        return ;
    else
        return ;
    end;
end;
getIsHydrating = function()
    return v34;
end;
return {
    warnIfHydrating = warnIfHydrating, 
    enterHydrationState = enterHydrationState, 
    getIsHydrating = getIsHydrating, 
    reenterHydrationStateFromDehydratedSuspenseInstance = reenterHydrationStateFromDehydratedSuspenseInstance, 
    resetHydrationState = resetHydrationState, 
    tryToClaimNextHydratableInstance = tryToClaimNextHydratableInstance, 
    prepareToHydrateHostInstance = prepareToHydrateHostInstance, 
    prepareToHydrateHostTextInstance = prepareToHydrateHostTextInstance, 
    prepareToHydrateHostSuspenseInstance = prepareToHydrateHostSuspenseInstance, 
    popHydrationState = popHydrationState
};
