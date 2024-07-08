return {
    NetworkStatus = {
        loading = 1, 
        setVariables = 2, 
        fetchMore = 3, 
        refetch = 4, 
        poll = 6, 
        ready = 7, 
        error = 8
    }, 
    isNetworkRequestInFlight = function(v0)
        if not v0 then
            return false;
        else
            return v0 < 7;
        end;
    end
};
