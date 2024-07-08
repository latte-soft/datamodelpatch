return function()
    local v0 = {};
    return {
        mockEventReceiver = {
            observeEvent = function(_, v2, v3)
                v0[v2] = v3;
            end
        }, 
        events = v0
    };
end;
