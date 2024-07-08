local v0 = {};
v0.__index = v0;
v0.new = function(_)
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local l_BindableEvent_1 = Instance.new("BindableEvent");
    local v6 = {
        finishedReplicatingEvent = l_BindableEvent_0, 
        FinishedReplicating = l_BindableEvent_0.Event, 
        mockIsFinishedReplicating = false, 
        IsFinishedReplicating = function(v4)
            return v4.mockIsFinishedReplicating;
        end, 
        removeDefaultLoadingGuiSignalEvent = l_BindableEvent_1, 
        RemoveDefaultLoadingGuiSignal = l_BindableEvent_1.Event, 
        mockIsDefaultLoadingGuiRemoved = false, 
        IsDefaultLoadingGuiRemoved = function(v5)
            return v5.mockIsDefaultLoadingGuiRemoved;
        end, 
        SetDefaultLoadingGuiRemoved = function()
        end
    };
    setmetatable(v6, {
        __index = v0
    });
    return v6;
end;
return v0;
