local l_Parent_0 = script.Parent.Parent;
local _ = require(script.Parent.ReactInternalTypes);
local l_console_0 = require(l_Parent_0.Shared).console;
local v3 = require(script.Parent["ReactFiberSchedulerPriorities.roblox"]);
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_ImmediatePriority_0 = v3.ImmediatePriority;
local l_UserBlockingPriority_0 = v3.UserBlockingPriority;
local l_NormalPriority_0 = v3.NormalPriority;
local l_LowPriority_0 = v3.LowPriority;
local l_IdlePriority_0 = v3.IdlePriority;
local l_NoPriority_0 = v3.NoPriority;
local v11 = {
    SyncLanePriority = 15, 
    SyncBatchedLanePriority = 14, 
    InputDiscreteLanePriority = 12, 
    InputContinuousLanePriority = 10, 
    DefaultLanePriority = 8, 
    TransitionPriority = 6, 
    NoLanePriority = 0, 
    NoLanes = 0, 
    NoLane = 0, 
    SyncLane = 1, 
    SyncBatchedLane = 2, 
    InputDiscreteHydrationLane = 4, 
    DefaultHydrationLane = 256, 
    DefaultLanes = 3584, 
    RetryLanes = 62914560, 
    SomeRetryLane = 33554432, 
    SelectiveHydrationLane = 67108864, 
    IdleHydrationLane = 134217728, 
    OffscreenLane = 1073741824, 
    NoTimestamp = -1
};
local l_NoLanePriority_0 = v11.NoLanePriority;
v11.getCurrentUpdateLanePriority = function()
    return l_NoLanePriority_0;
end;
v11.setCurrentUpdateLanePriority = function(v13)
    l_NoLanePriority_0 = v13;
end;
local l_DefaultLanePriority_0 = v11.DefaultLanePriority;
local function v22(v15)
    if bit32.band(1, v15) ~= 0 then
        l_DefaultLanePriority_0 = 15;
        return 1;
    elseif bit32.band(2, v15) ~= 0 then
        l_DefaultLanePriority_0 = 14;
        return 2;
    elseif bit32.band(4, v15) ~= 0 then
        l_DefaultLanePriority_0 = 13;
        return 4;
    else
        local v16 = bit32.band(24, v15);
        if v16 ~= 0 then
            l_DefaultLanePriority_0 = 12;
            return v16;
        elseif bit32.band(v15, 32) ~= 0 then
            l_DefaultLanePriority_0 = 11;
            return 32;
        else
            local v17 = bit32.band(192, v15);
            if v17 ~= 0 then
                l_DefaultLanePriority_0 = 10;
                return v17;
            elseif bit32.band(v15, 256) ~= 0 then
                l_DefaultLanePriority_0 = 9;
                return 256;
            else
                local v18 = bit32.band(3584, v15);
                if v18 ~= 0 then
                    l_DefaultLanePriority_0 = 8;
                    return v18;
                elseif bit32.band(v15, 4096) ~= 0 then
                    l_DefaultLanePriority_0 = 7;
                    return 4096;
                else
                    local v19 = bit32.band(4186112, v15);
                    if v19 ~= 0 then
                        l_DefaultLanePriority_0 = 6;
                        return v19;
                    else
                        local v20 = bit32.band(62914560, v15);
                        if v20 ~= 0 then
                            l_DefaultLanePriority_0 = 5;
                            return v20;
                        elseif bit32.band(v15, 67108864) ~= 0 then
                            l_DefaultLanePriority_0 = 4;
                            return 67108864;
                        elseif bit32.band(v15, 134217728) ~= 0 then
                            l_DefaultLanePriority_0 = 3;
                            return 134217728;
                        else
                            local v21 = bit32.band(805306368, v15);
                            if v21 ~= 0 then
                                l_DefaultLanePriority_0 = 2;
                                return v21;
                            elseif bit32.band(1073741824, v15) ~= 0 then
                                l_DefaultLanePriority_0 = 1;
                                return 1073741824;
                            else
                                if _G.__DEV__ then
                                    l_console_0.error("Should have found matching lanes. This is a bug in React.");
                                end;
                                l_DefaultLanePriority_0 = 8;
                                return v15;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v11.schedulerPriorityToLanePriority = function(v23)
    if v23 == l_ImmediatePriority_0 then
        return 15;
    elseif v23 == l_UserBlockingPriority_0 then
        return 10;
    elseif not (v23 ~= l_NormalPriority_0) or v23 == l_LowPriority_0 then
        return 8;
    elseif v23 == l_IdlePriority_0 then
        return 2;
    else
        return 0;
    end;
end;
v11.lanePriorityToSchedulerPriority = function(v24)
    if not (v24 ~= 15) or v24 == 14 then
        return l_ImmediatePriority_0;
    elseif not ((v24 ~= 13 and v24 ~= 12) and v24 ~= 11) or v24 == 10 then
        return l_UserBlockingPriority_0;
    elseif not ((((v24 ~= 9 and v24 ~= 8) and v24 ~= 7) and v24 ~= 6) and v24 ~= 4) or v24 == 5 then
        return l_NormalPriority_0;
    elseif not (v24 ~= 3 and v24 ~= 2) or v24 == 1 then
        return l_IdlePriority_0;
    elseif v24 == 0 then
        return l_NoPriority_0;
    else
        l_invariant_0(false, "Invalid update priority: %s. This is a bug in React.", v24);
        error("unreachable");
        return ;
    end;
end;
local v25 = nil;
local v26 = nil;
local v27 = nil;
v11.getNextLanes = function(v28, v29)
    local l_pendingLanes_0 = v28.pendingLanes;
    if l_pendingLanes_0 == 0 then
        l_DefaultLanePriority_0 = 0;
        return 0;
    else
        local v31 = 0;
        local v32 = 0;
        local l_expiredLanes_0 = v28.expiredLanes;
        local l_suspendedLanes_0 = v28.suspendedLanes;
        local l_pingedLanes_0 = v28.pingedLanes;
        if l_expiredLanes_0 ~= 0 then
            v31 = l_expiredLanes_0;
            l_DefaultLanePriority_0 = 15;
            v32 = 15;
        else
            local v36 = bit32.band(l_pendingLanes_0, 134217727);
            if v36 ~= 0 then
                local v37 = bit32.band(v36, (bit32.bnot(l_suspendedLanes_0)));
                if v37 ~= 0 then
                    v31 = v22(v37);
                    v32 = l_DefaultLanePriority_0;
                else
                    local v38 = bit32.band(v36, l_pingedLanes_0);
                    if v38 ~= 0 then
                        v31 = v22(v38);
                        v32 = l_DefaultLanePriority_0;
                    end;
                end;
            else
                local v39 = bit32.band(l_pendingLanes_0, (bit32.bnot(l_suspendedLanes_0)));
                if v39 ~= 0 then
                    v31 = v22(v39);
                    v32 = l_DefaultLanePriority_0;
                elseif l_pingedLanes_0 ~= 0 then
                    v31 = v22(l_pingedLanes_0);
                    v32 = l_DefaultLanePriority_0;
                end;
            end;
        end;
        if v31 == 0 then
            return 0;
        else
            v31 = bit32.band(l_pendingLanes_0, bit32.lshift(v26(v31), 1) - 1);
            if (v29 ~= 0 and v29 ~= v31) and bit32.band(v29, l_suspendedLanes_0) == 0 then
                v22(v29);
                if v32 <= l_DefaultLanePriority_0 then
                    return v29;
                else
                    l_DefaultLanePriority_0 = v32;
                end;
            end;
            local l_entangledLanes_0 = v28.entangledLanes;
            if l_entangledLanes_0 ~= 0 then
                local l_entanglements_0 = v28.entanglements;
                local v42 = bit32.band(v31, l_entangledLanes_0);
                while v42 > 0 do
                    local v43 = v25(v42);
                    local v44 = bit32.lshift(1, v43);
                    v31 = bit32.bor(v31, l_entanglements_0[v43]);
                    v42 = bit32.band(v42, (bit32.bnot(v44)));
                end;
            end;
            return v31;
        end;
    end;
end;
v11.getMostRecentEventTime = function(v45, v46)
    local l_eventTimes_0 = v45.eventTimes;
    local v48 = -1;
    while v46 > 0 do
        local v49 = v25(v46);
        local v50 = bit32.lshift(1, v49);
        local v51 = l_eventTimes_0[v49];
        if v48 < v51 then
            v48 = v51;
        end;
        v46 = bit32.band(v46, (bit32.bnot(v50)));
    end;
    return v48;
end;
v11.computeExpirationTime = function(v52, v53)
    v22(v52);
    local l_l_DefaultLanePriority_0_0 = l_DefaultLanePriority_0;
    if l_l_DefaultLanePriority_0_0 >= 10 then
        return v53 + 250;
    elseif l_l_DefaultLanePriority_0_0 >= 6 then
        return v53 + 5000;
    else
        return -1;
    end;
end;
v11.markStarvedLanesAsExpired = function(v55, v56)
    local l_pendingLanes_1 = v55.pendingLanes;
    local l_suspendedLanes_1 = v55.suspendedLanes;
    local l_pingedLanes_1 = v55.pingedLanes;
    local l_expirationTimes_0 = v55.expirationTimes;
    local l_l_pendingLanes_1_0 = l_pendingLanes_1;
    while l_l_pendingLanes_1_0 > 0 do
        local v62 = v25(l_l_pendingLanes_1_0);
        local v63 = bit32.lshift(1, v62);
        local v64 = l_expirationTimes_0[v62];
        if v64 == -1 then
            if not (bit32.band(v63, l_suspendedLanes_1) ~= 0) or bit32.band(v63, l_pingedLanes_1) ~= 0 then
                v22(v63);
                local l_l_DefaultLanePriority_0_1 = l_DefaultLanePriority_0;
                l_expirationTimes_0[v62] = if l_l_DefaultLanePriority_0_1 >= 10 then v56 + 250 else if l_l_DefaultLanePriority_0_1 >= 6 then v56 + 5000 else -1;
            end;
        elseif v64 <= v56 then
            v55.expiredLanes = bit32.bor(v55.expiredLanes, v63);
        end;
        l_l_pendingLanes_1_0 = bit32.band(l_l_pendingLanes_1_0, (bit32.bnot(v63)));
    end;
end;
v11.getHighestPriorityPendingLanes = function(v66)
    return (v22(v66.pendingLanes));
end;
v11.getLanesToRetrySynchronouslyOnError = function(v67)
    local v68 = bit32.band(v67.pendingLanes, 3221225471);
    if v68 ~= 0 then
        return v68;
    elseif bit32.band(v68, 1073741824) ~= 0 then
        return 1073741824;
    else
        return 0;
    end;
end;
v11.returnNextLanesPriority = function()
    return l_DefaultLanePriority_0;
end;
v11.includesNonIdleWork = function(v69)
    return bit32.band(v69, 134217727) ~= 0;
end;
v11.includesOnlyRetries = function(v70)
    return bit32.band(v70, 62914560) == v70;
end;
v11.includesOnlyTransitions = function(v71)
    return bit32.band(v71, 4186112) == v71;
end;
local v72 = nil;
local function v73(v74, v75)
    if not (v74 == 0) then
        if v74 == 15 then
            return 1;
        elseif v74 == 14 then
            return 2;
        elseif v74 == 12 then
            local v76 = v72((bit32.band(24, (bit32.bnot(v75)))));
            if v76 == 0 then
                return v73(10, v75);
            else
                return v76;
            end;
        elseif v74 == 10 then
            local v77 = v72((bit32.band(192, (bit32.bnot(v75)))));
            if v77 == 0 then
                return v73(8, v75);
            else
                return v77;
            end;
        elseif v74 == 8 then
            local v78 = v72((bit32.band(3584, (bit32.bnot(v75)))));
            if v78 == 0 then
                v78 = v72((bit32.band(4186112, (bit32.bnot(v75)))));
                if v78 == 0 then
                    v78 = v72(3584);
                end;
            end;
            return v78;
        elseif not (not (v74 ~= 6) or v74 == 5) and v74 == 2 then
            local v79 = v72((bit32.band(805306368, (bit32.bnot(v75)))));
            if v79 == 0 then
                v79 = v72(805306368);
            end;
            return v79;
        end;
    end;
    l_invariant_0(false, "Invalid update priority: %s. This is a bug in React.", v74);
    error("unreachable");
end;
v11.findUpdateLane = v73;
v11.findTransitionLane = function(v80, v81)
    local v82 = v72((bit32.band(4186112, (bit32.bnot(v81)))));
    if v82 == 0 then
        v82 = v72((bit32.band(4186112, (bit32.bnot(v80)))));
        if v82 == 0 then
            v82 = v72(4186112);
        end;
    end;
    return v82;
end;
v11.findRetryLane = function(v83)
    local v84 = v72((bit32.band(62914560, (bit32.bnot(v83)))));
    if v84 == 0 then
        v84 = v72(62914560);
    end;
    return v84;
end;
local function _(v85)
    return (bit32.band(v85, -v85));
end;
v26 = function(v87)
    local v88 = 31 - bit32.countlz(v87);
    if v88 < 0 then
        return 0;
    else
        return (bit32.lshift(1, v88));
    end;
end;
v27 = function(v89)
    return bit32.lshift(v26(v89), 1) - 1;
end;
v72 = function(v90)
    return (bit32.band(v90, -v90));
end;
v11.pickArbitraryLane = v72;
v25 = function(v91)
    return 31 - bit32.countlz(v91);
end;
v11.includesSomeLane = function(v92, v93)
    return bit32.band(v92, v93) ~= 0;
end;
v11.isSubsetOfLanes = function(v94, v95)
    return bit32.band(v94, v95) == v95;
end;
v11.mergeLanes = function(v96, v97)
    return (bit32.bor(v96, v97));
end;
v11.removeLanes = function(v98, v99)
    return (bit32.band(v98, (bit32.bnot(v99))));
end;
v11.laneToLanes = function(v100)
    return v100;
end;
v11.higherPriorityLane = function(v101, v102)
    if v101 ~= 0 and v102 ~= 0 then
        if v101 < v102 then
            return v101;
        else
            return v102;
        end;
    elseif v101 ~= 0 then
        return v101;
    else
        return v102;
    end;
end;
v11.higherLanePriority = function(v103, v104)
    if v103 ~= 0 and v104 < v103 then
        return v103;
    else
        return v104;
    end;
end;
v11.createLaneMap = function(v105)
    return {
        [0] = v105, 
        [1] = v105, 
        [2] = v105, 
        [3] = v105, 
        [4] = v105, 
        [5] = v105, 
        [6] = v105, 
        [7] = v105, 
        [8] = v105, 
        [9] = v105, 
        [10] = v105, 
        [11] = v105, 
        [12] = v105, 
        [13] = v105, 
        [14] = v105, 
        [15] = v105, 
        [16] = v105, 
        [17] = v105, 
        [18] = v105, 
        [19] = v105, 
        [20] = v105, 
        [21] = v105, 
        [22] = v105, 
        [23] = v105, 
        [24] = v105, 
        [25] = v105, 
        [26] = v105, 
        [27] = v105, 
        [28] = v105, 
        [29] = v105, 
        [30] = v105, 
        [31] = v105
    };
end;
v11.markRootUpdated = function(v106, v107, v108)
    v106.pendingLanes = bit32.bor(v106.pendingLanes, v107);
    local v109 = v107 - 1;
    v106.suspendedLanes = bit32.band(v106.suspendedLanes, v109);
    v106.pingedLanes = bit32.band(v106.pingedLanes, v109);
    v106.eventTimes[31 - bit32.countlz(v107)] = v108;
end;
v11.markRootSuspended = function(v110, v111)
    v110.suspendedLanes = bit32.bor(v110.suspendedLanes, v111);
    v110.pingedLanes = bit32.band(v110.pingedLanes, (bit32.bnot(v111)));
    local l_expirationTimes_1 = v110.expirationTimes;
    local l_v111_0 = v111;
    while l_v111_0 > 0 do
        local v114 = v25(l_v111_0);
        local v115 = bit32.lshift(1, v114);
        l_expirationTimes_1[v114] = -1;
        l_v111_0 = bit32.band(l_v111_0, (bit32.bnot(v115)));
    end;
end;
v11.markRootPinged = function(v116, v117, _)
    v116.pingedLanes = bit32.bor(v116.pingedLanes, (bit32.band(v116.suspendedLanes, v117)));
end;
v11.markRootExpired = function(v119, v120)
    v119.expiredLanes = bit32.bor(v119.expiredLanes, (bit32.band(v120, v119.pendingLanes)));
end;
v11.markDiscreteUpdatesExpired = function(v121)
    v121.expiredLanes = bit32.bor(v121.expiredLanes, (bit32.band(24, v121.pendingLanes)));
end;
v11.hasDiscreteLanes = function(v122)
    return bit32.band(v122, 24) ~= 0;
end;
v11.markRootMutableRead = function(v123, v124)
    v123.mutableReadLanes = bit32.bor(v123.mutableReadLanes, (bit32.band(v124, v123.pendingLanes)));
end;
v11.markRootFinished = function(v125, v126)
    local v127 = bit32.band(v125.pendingLanes, (bit32.bnot(v126)));
    v125.pendingLanes = v126;
    v125.suspendedLanes = 0;
    v125.pingedLanes = 0;
    v125.expiredLanes = bit32.band(v125.expiredLanes, v126);
    v125.mutableReadLanes = bit32.band(v125.mutableReadLanes, v126);
    v125.entangledLanes = bit32.band(v125.entangledLanes, v126);
    local l_entanglements_1 = v125.entanglements;
    local l_eventTimes_1 = v125.eventTimes;
    local l_expirationTimes_2 = v125.expirationTimes;
    local l_v127_0 = v127;
    while l_v127_0 > 0 do
        local v132 = v25(l_v127_0);
        local v133 = bit32.lshift(1, v132);
        l_entanglements_1[v132] = 0;
        l_eventTimes_1[v132] = -1;
        l_expirationTimes_2[v132] = -1;
        l_v127_0 = bit32.band(l_v127_0, (bit32.bnot(v133)));
    end;
end;
v11.markRootEntangled = function(v134, v135)
    v134.entangledLanes = bit32.bor(v134.entangledLanes, v135);
    local l_entanglements_2 = v134.entanglements;
    local l_v135_0 = v135;
    while l_v135_0 > 0 do
        local v138 = v25(l_v135_0);
        local v139 = bit32.lshift(1, v138);
        l_entanglements_2[v138] = bit32.bor(l_entanglements_2[v138], v135);
        l_v135_0 = bit32.band(l_v135_0, (bit32.bnot(v139)));
    end;
end;
v11.getBumpedLaneForHydration = function(v140, v141)
    v22(v141);
    local l_l_DefaultLanePriority_0_2 = l_DefaultLanePriority_0;
    local v143 = nil;
    if not (l_l_DefaultLanePriority_0_2 ~= 15) or l_l_DefaultLanePriority_0_2 == 14 then
        v143 = 0;
    elseif not (l_l_DefaultLanePriority_0_2 ~= 13) or l_l_DefaultLanePriority_0_2 == 12 then
        v143 = 4;
    elseif not (l_l_DefaultLanePriority_0_2 ~= 11) or l_l_DefaultLanePriority_0_2 == 10 then
        v143 = 32;
    elseif not (l_l_DefaultLanePriority_0_2 ~= 9) or l_l_DefaultLanePriority_0_2 == 8 then
        v143 = 256;
    elseif not (l_l_DefaultLanePriority_0_2 ~= 7) or l_l_DefaultLanePriority_0_2 == 6 then
        v143 = 4096;
    elseif l_l_DefaultLanePriority_0_2 == 5 then
        v143 = 4096;
    elseif l_l_DefaultLanePriority_0_2 == 4 then
        v143 = 67108864;
    elseif not (l_l_DefaultLanePriority_0_2 ~= 3) or l_l_DefaultLanePriority_0_2 == 2 then
        v143 = 134217728;
    elseif not (l_l_DefaultLanePriority_0_2 ~= 1) or l_l_DefaultLanePriority_0_2 == 0 then
        v143 = 0;
    else
        l_invariant_0(false, "Invalid lane: %s. This is a bug in React.", (tostring(v143)));
    end;
    if bit32.band(v143, (bit32.bor(v140.suspendedLanes, v141))) ~= 0 then
        return 0;
    else
        return v143;
    end;
end;
return v11;
