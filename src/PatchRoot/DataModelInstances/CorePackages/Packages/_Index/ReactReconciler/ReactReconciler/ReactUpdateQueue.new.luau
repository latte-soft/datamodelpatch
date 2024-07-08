local l___DEV___0 = _G.__DEV__;
local l___YOLO___0 = _G.__YOLO__;
local l_Parent_0 = script.Parent.Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(script.Parent.ReactInternalTypes);
local v6 = require(script.Parent.ReactFiberLane);
local l_NoLane_0 = v6.NoLane;
local l_NoLanes_0 = v6.NoLanes;
local l_isSubsetOfLanes_0 = v6.isSubsetOfLanes;
local l_mergeLanes_0 = v6.mergeLanes;
local v11 = nil;
local function _()
    if not v11 then
        v11 = require(script.Parent["ReactFiberNewContext.new"]);
    end;
    v11.enterDisallowedContextReadInDEV();
end;
local function _()
    if not v11 then
        v11 = require(script.Parent["ReactFiberNewContext.new"]);
    end;
    v11.exitDisallowedContextReadInDEV();
end;
local v14 = require(script.Parent.ReactFiberFlags);
local l_Callback_0 = v14.Callback;
local l_ShouldCapture_0 = v14.ShouldCapture;
local l_DidCapture_0 = v14.DidCapture;
local l_debugRenderPhaseSideEffectsForStrictMode_0 = require(l_Parent_0.Shared).ReactFeatureFlags.debugRenderPhaseSideEffectsForStrictMode;
local l_StrictMode_0 = require(script.Parent.ReactTypeOfMode).StrictMode;
local l_markSkippedUpdateLanes_0 = require(script.Parent.ReactFiberWorkInProgress).markSkippedUpdateLanes;
local l_describeError_0 = require(l_Parent_0.Shared).describeError;
local l_ConsolePatchingDev_0 = require(l_Parent_0.Shared).ConsolePatchingDev;
local l_disableLogs_0 = l_ConsolePatchingDev_0.disableLogs;
local l_reenableLogs_0 = l_ConsolePatchingDev_0.reenableLogs;
local v25 = {
    UpdateState = 0, 
    ReplaceState = 1, 
    ForceUpdate = 2, 
    CaptureUpdate = 3
};
local v26 = false;
local v27 = nil;
local v28 = nil;
if l___DEV___0 then
    v27 = false;
    v28 = nil;
    v25.resetCurrentlyProcessingQueue = function()
        v28 = nil;
    end;
end;
local v29 = table.create(210);
local v30 = 210;
for v31 = 1, 210 do
    v29[v31] = {
        eventTime = -1, 
        lane = -1, 
        tag = -1, 
        payload = nil, 
        callback = nil, 
        next = nil
    };
end;
v25.initializeUpdateQueue = function(v32)
    v32.updateQueue = {
        baseState = v32.memoizedState, 
        firstBaseUpdate = nil, 
        lastBaseUpdate = nil, 
        shared = {
            pending = nil
        }, 
        effects = nil
    };
end;
v25.cloneUpdateQueue = function(v33, v34)
    local l_updateQueue_0 = v34.updateQueue;
    local l_updateQueue_1 = v33.updateQueue;
    if l_updateQueue_0 == l_updateQueue_1 then
        v34.updateQueue = table.clone(l_updateQueue_1);
    end;
end;
v25.createUpdate = function(v37, v38, v39, v40)
    if v30 > 0 then
        local v41 = v29[v30];
        v29[v30] = nil;
        v30 = v30 - 1;
        v41.eventTime = v37;
        v41.lane = v38;
        v41.tag = 0;
        v41.payload = v39;
        v41.callback = v40;
        return v41;
    else
        return {
            eventTime = v37, 
            lane = v38, 
            tag = 0, 
            payload = v39, 
            callback = v40, 
            next = nil
        };
    end;
end;
v25.enqueueUpdate = function(v42, v43)
    local l_updateQueue_2 = v42.updateQueue;
    if l_updateQueue_2 == nil then
        return ;
    else
        local l_shared_0 = l_updateQueue_2.shared;
        local l_pending_0 = l_shared_0.pending;
        if l_pending_0 == nil then
            v43.next = v43;
        else
            v43.next = l_pending_0.next;
            l_pending_0.next = v43;
        end;
        l_shared_0.pending = v43;
        if not (not (l___DEV___0 and v28 == l_shared_0) or v27) then
            l_console_0.error("An update (setState, replaceState, or forceUpdate) was scheduled " .. "from inside an update function. Update functions should be pure, " .. "with zero side-effects. Consider using componentDidUpdate or a " .. "callback.");
            v27 = true;
        end;
        return ;
    end;
end;
v25.enqueueCapturedUpdate = function(v47, v48)
    local l_updateQueue_3 = v47.updateQueue;
    local l_alternate_0 = v47.alternate;
    if l_alternate_0 ~= nil then
        local l_updateQueue_4 = l_alternate_0.updateQueue;
        if l_updateQueue_3 == l_updateQueue_4 then
            local v52 = nil;
            local v53 = nil;
            local l_firstBaseUpdate_0 = l_updateQueue_3.firstBaseUpdate;
            if l_firstBaseUpdate_0 ~= nil then
                local l_l_firstBaseUpdate_0_0 = l_firstBaseUpdate_0;
                while true do
                    local v56 = {
                        eventTime = l_l_firstBaseUpdate_0_0.eventTime, 
                        lane = l_l_firstBaseUpdate_0_0.lane, 
                        tag = l_l_firstBaseUpdate_0_0.tag, 
                        payload = l_l_firstBaseUpdate_0_0.payload, 
                        callback = l_l_firstBaseUpdate_0_0.callback, 
                        next = nil
                    };
                    if v53 == nil then
                        v53 = v56;
                        v52 = v56;
                    else
                        v53.next = v56;
                        v53 = v56;
                    end;
                    l_l_firstBaseUpdate_0_0 = l_l_firstBaseUpdate_0_0.next;
                    if not (l_l_firstBaseUpdate_0_0 ~= nil) then
                        break;
                    end;
                end;
                if v53 == nil then
                    v53 = v48;
                    v52 = v48;
                else
                    v53.next = v48;
                    v53 = v48;
                end;
            else
                v53 = v48;
                v52 = v48;
            end;
            v47.updateQueue = {
                baseState = l_updateQueue_4.baseState, 
                firstBaseUpdate = v52, 
                lastBaseUpdate = v53, 
                shared = l_updateQueue_4.shared, 
                effects = l_updateQueue_4.effects
            };
            return ;
        end;
    end;
    local l_lastBaseUpdate_0 = l_updateQueue_3.lastBaseUpdate;
    if l_lastBaseUpdate_0 == nil then
        l_updateQueue_3.firstBaseUpdate = v48;
    else
        l_lastBaseUpdate_0.next = v48;
    end;
    l_updateQueue_3.lastBaseUpdate = v48;
end;
local function v77(v58, _, v60, v61, v62, _)
    local l_tag_0 = v60.tag;
    if l_tag_0 == 1 then
        local l_payload_0 = v60.payload;
        if type(l_payload_0) == "function" then
            if l___DEV___0 then
                if not v11 then
                    v11 = require(script.Parent["ReactFiberNewContext.new"]);
                end;
                v11.enterDisallowedContextReadInDEV();
            end;
            local v66 = l_payload_0(v61, v62);
            if l___DEV___0 then
                if l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v58.mode, l_StrictMode_0) ~= 0 then
                    l_disableLogs_0();
                    local v67 = nil;
                    local v68 = nil;
                    if l___YOLO___0 then
                        v67 = true;
                        l_payload_0(v61, v62);
                    else
                        local v69, v70 = xpcall(l_payload_0, l_describeError_0, v61, v62);
                        v67 = v69;
                        v68 = v70;
                    end;
                    l_reenableLogs_0();
                    if not v67 then
                        error(v68);
                    end;
                end;
                if not v11 then
                    v11 = require(script.Parent["ReactFiberNewContext.new"]);
                end;
                v11.exitDisallowedContextReadInDEV();
            end;
            return v66;
        else
            return l_payload_0;
        end;
    elseif not (l_tag_0 ~= 3) or l_tag_0 == 0 then
        if l_tag_0 == 3 then
            v58.flags = bit32.bor(bit32.band(v58.flags, (bit32.bnot(l_ShouldCapture_0))), l_DidCapture_0);
        end;
        local l_payload_1 = v60.payload;
        local v72 = nil;
        if type(l_payload_1) == "function" then
            if l___DEV___0 then
                if not v11 then
                    v11 = require(script.Parent["ReactFiberNewContext.new"]);
                end;
                v11.enterDisallowedContextReadInDEV();
            end;
            v72 = l_payload_1(v61, v62);
            if l___DEV___0 then
                if l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v58.mode, l_StrictMode_0) ~= 0 then
                    l_disableLogs_0();
                    local v73 = nil;
                    local v74 = nil;
                    if l___YOLO___0 then
                        v73 = true;
                        l_payload_1(v61, v62);
                    else
                        local v75, v76 = xpcall(l_payload_1, l_describeError_0, v61, v62);
                        v73 = v75;
                        v74 = v76;
                    end;
                    l_reenableLogs_0();
                    if not v73 then
                        error(v74);
                    end;
                end;
                if not v11 then
                    v11 = require(script.Parent["ReactFiberNewContext.new"]);
                end;
                v11.exitDisallowedContextReadInDEV();
            end;
        else
            v72 = l_payload_1;
        end;
        if v72 == nil then
            return v61;
        else
            return l_Object_0.assign({}, v61, v72);
        end;
    elseif l_tag_0 == 2 then
        v26 = true;
        return v61;
    else
        return v61;
    end;
end;
v25.getStateFromUpdate = v77;
v25.processUpdateQueue = function(v78, v79, v80, v81)
    local l_updateQueue_5 = v78.updateQueue;
    v26 = false;
    if l___DEV___0 then
        v28 = l_updateQueue_5.shared;
    end;
    local l_firstBaseUpdate_1 = l_updateQueue_5.firstBaseUpdate;
    local l_lastBaseUpdate_1 = l_updateQueue_5.lastBaseUpdate;
    local l_pending_1 = l_updateQueue_5.shared.pending;
    if l_pending_1 ~= nil then
        l_updateQueue_5.shared.pending = nil;
        local l_l_pending_1_0 = l_pending_1;
        local l_next_0 = l_l_pending_1_0.next;
        l_l_pending_1_0.next = nil;
        if l_lastBaseUpdate_1 == nil then
            l_firstBaseUpdate_1 = l_next_0;
        else
            l_lastBaseUpdate_1.next = l_next_0;
        end;
        l_lastBaseUpdate_1 = l_l_pending_1_0;
        local l_alternate_1 = v78.alternate;
        if l_alternate_1 ~= nil then
            local l_updateQueue_6 = l_alternate_1.updateQueue;
            local l_lastBaseUpdate_2 = l_updateQueue_6.lastBaseUpdate;
            if l_lastBaseUpdate_2 ~= l_lastBaseUpdate_1 then
                if l_lastBaseUpdate_2 == nil then
                    l_updateQueue_6.firstBaseUpdate = l_next_0;
                else
                    l_lastBaseUpdate_2.next = l_next_0;
                end;
                l_updateQueue_6.lastBaseUpdate = l_l_pending_1_0;
            end;
        end;
    end;
    if l_firstBaseUpdate_1 ~= nil then
        local l_baseState_0 = l_updateQueue_5.baseState;
        local l_l_NoLanes_0_0 = l_NoLanes_0;
        local v93 = nil;
        local v94 = nil;
        local v95 = nil;
        local l_l_firstBaseUpdate_1_0 = l_firstBaseUpdate_1;
        while true do
            local l_lane_0 = l_l_firstBaseUpdate_1_0.lane;
            local l_eventTime_0 = l_l_firstBaseUpdate_1_0.eventTime;
            if l_isSubsetOfLanes_0(v81, l_lane_0) then
                if v95 ~= nil then
                    local v99 = {
                        eventTime = l_eventTime_0, 
                        lane = l_NoLane_0, 
                        tag = l_l_firstBaseUpdate_1_0.tag, 
                        payload = l_l_firstBaseUpdate_1_0.payload, 
                        callback = l_l_firstBaseUpdate_1_0.callback, 
                        next = nil
                    };
                    v95.next = v99;
                    v95 = v99;
                end;
                l_baseState_0 = v77(v78, l_updateQueue_5, l_l_firstBaseUpdate_1_0, l_baseState_0, v79, v80);
                if l_l_firstBaseUpdate_1_0.callback ~= nil and l_l_firstBaseUpdate_1_0.lane ~= l_NoLane_0 then
                    v78.flags = bit32.bor(v78.flags, l_Callback_0);
                    local l_effects_0 = l_updateQueue_5.effects;
                    if l_effects_0 == nil then
                        l_updateQueue_5.effects = {
                            l_l_firstBaseUpdate_1_0
                        };
                    else
                        table.insert(l_effects_0, l_l_firstBaseUpdate_1_0);
                    end;
                end;
            else
                local v101 = {
                    eventTime = l_eventTime_0, 
                    lane = l_lane_0, 
                    tag = l_l_firstBaseUpdate_1_0.tag, 
                    payload = l_l_firstBaseUpdate_1_0.payload, 
                    callback = l_l_firstBaseUpdate_1_0.callback, 
                    next = nil
                };
                if v95 == nil then
                    v94 = v101;
                    v95 = v101;
                    v93 = l_baseState_0;
                else
                    v95.next = v101;
                    v95 = v101;
                end;
                l_l_NoLanes_0_0 = l_mergeLanes_0(l_l_NoLanes_0_0, l_lane_0);
            end;
            l_l_firstBaseUpdate_1_0 = l_l_firstBaseUpdate_1_0.next;
            if not (l_l_firstBaseUpdate_1_0 == nil) then
                continue;
            end;
            l_pending_1 = l_updateQueue_5.shared.pending;
            if not (l_pending_1 == nil) then
                local l_l_pending_1_1 = l_pending_1;
                local l_next_1 = l_l_pending_1_1.next;
                l_l_pending_1_1.next = nil;
                l_l_firstBaseUpdate_1_0 = l_next_1;
                l_updateQueue_5.lastBaseUpdate = l_l_pending_1_1;
                l_updateQueue_5.shared.pending = nil;
            else
                break;
            end;
        end;
        if v95 == nil then
            v93 = l_baseState_0;
        end;
        l_updateQueue_5.baseState = v93;
        l_updateQueue_5.firstBaseUpdate = v94;
        l_updateQueue_5.lastBaseUpdate = v95;
        l_markSkippedUpdateLanes_0(l_l_NoLanes_0_0);
        v78.lanes = l_l_NoLanes_0_0;
        v78.memoizedState = l_baseState_0;
    end;
    if l___DEV___0 then
        v28 = nil;
    end;
end;
local function _(v104, v105)
    if type(v104) ~= "function" then
        error(string.format("Invalid argument passed as callback. Expected a function. Instead " .. "received: %s", (tostring(v104))));
    end;
    v104(v105);
end;
v25.resetHasForceUpdateBeforeProcessing = function()
    v26 = false;
end;
v25.checkHasForceUpdateAfterProcessing = function()
    return v26;
end;
v25.commitUpdateQueue = function(_, v108, v109)
    local l_effects_1 = v108.effects;
    v108.effects = nil;
    if l_effects_1 ~= nil then
        for _, v112 in l_effects_1, nil, nil do
            local l_callback_0 = v112.callback;
            if l_callback_0 ~= nil then
                if type(l_callback_0) ~= "function" then
                    error(string.format("Invalid argument passed as callback. Expected a function. Instead " .. "received: %s", (tostring(l_callback_0))));
                end;
                l_callback_0(v109);
            end;
            table.clear(v112);
            table.insert(v29, v112);
            v30 = v30 + 1;
        end;
    end;
end;
return v25;
