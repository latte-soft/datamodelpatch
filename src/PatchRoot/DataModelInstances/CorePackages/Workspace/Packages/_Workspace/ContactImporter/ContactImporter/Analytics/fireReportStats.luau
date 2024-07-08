return function(v0)
    return function(v1, v2)
        v0.diagImpl:reportStats(v0.eventList[v1].name, v2.loadingTime);
    end;
end;
