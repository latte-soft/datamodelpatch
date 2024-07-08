return function(v0)
    return {
        Diag = {
            reportCounter = v0.fn(), 
            reportStats = v0.fn()
        }, 
        EventStream = {
            setRBXEventStream = v0.fn(), 
            sendEventDeferred = v0.fn()
        }
    };
end;
