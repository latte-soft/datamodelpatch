local _ = require(script.Parent.Parent.Shared);
local _ = require(script.Parent.ReactInternalTypes);
local v2 = require(script.Parent.ReactFiberHostConfig);
local _ = require(script.Parent.ReactFiberLane);
local v4 = require(script.Parent.ReactWorkTags);
local l_SuspenseComponent_0 = v4.SuspenseComponent;
local l_SuspenseListComponent_0 = v4.SuspenseListComponent;
local v7 = require(script.Parent.ReactFiberFlags);
local l_NoFlags_0 = v7.NoFlags;
local l_DidCapture_0 = v7.DidCapture;
local l_isSuspenseInstancePending_0 = v2.isSuspenseInstancePending;
local l_isSuspenseInstanceFallback_0 = v2.isSuspenseInstanceFallback;
return {
    shouldCaptureSuspense = function(v12, v13)
        local l_memoizedState_0 = v12.memoizedState;
        if not l_memoizedState_0 then
            local l_memoizedProps_0 = v12.memoizedProps;
            if l_memoizedProps_0.fallback == nil then
                return false;
            elseif l_memoizedProps_0.unstable_avoidThisFallback ~= true then
                return true;
            elseif not v13 then
                return true;
            else
                return false;
            end;
        elseif l_memoizedState_0.dehydrated ~= nil then
            return true;
        else
            return false;
        end;
    end, 
    findFirstSuspended = function(v16)
        local l_v16_0 = v16;
        while true do
            if l_v16_0 ~= nil then
                if l_v16_0.tag == l_SuspenseComponent_0 then
                    local l_memoizedState_1 = l_v16_0.memoizedState;
                    if l_memoizedState_1 then
                        local l_dehydrated_0 = l_memoizedState_1.dehydrated;
                        if not (not (not (l_dehydrated_0 ~= nil) or l_isSuspenseInstancePending_0(l_dehydrated_0)) and not l_isSuspenseInstanceFallback_0(l_dehydrated_0)) then
                            return l_v16_0;
                        end;
                    end;
                elseif l_v16_0.tag == l_SuspenseListComponent_0 and l_v16_0.memoizedProps.revealOrder ~= nil then
                    if bit32.band(l_v16_0.flags, l_DidCapture_0) ~= l_NoFlags_0 then
                        return l_v16_0;
                    end;
                elseif l_v16_0.child ~= nil then
                    l_v16_0.child.return_ = l_v16_0;
                    l_v16_0 = l_v16_0.child;
                    continue;
                end;
                if l_v16_0 == v16 then
                    return nil;
                else
                    while true do
                        if l_v16_0.sibling == nil then
                            if not (l_v16_0.return_ ~= nil) or l_v16_0.return_ == v16 then
                                return nil;
                            else
                                l_v16_0 = l_v16_0.return_;
                            end;
                        else
                            l_v16_0.sibling.return_ = l_v16_0.return_;
                            l_v16_0 = l_v16_0.sibling;
                            break;
                        end;
                    end;
                end;
            else
                return nil;
            end;
        end;
    end
};
