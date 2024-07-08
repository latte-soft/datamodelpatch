return {
    request = {
        body = "{\"isEnabled\":true}", 
        cachePolicy = Enum.HttpCachePolicy.None, 
        headers = {
            ["content-type"] = "application/json", 
            accept = "application/json"
        }, 
        method = "POST", 
        url = {
            host = "apis.roblox.com", 
            path = "/virtual-events/v1/notifications/preferences", 
            query = {}, 
            scheme = "https"
        }
    }, 
    response = {
        body = "{}", 
        headers = {
            ["content-length"] = "2", 
            ["content-type"] = "application/json; charset=utf-8", 
            ["strict-transport-security"] = "max-age=3600", 
            ["x-envoy-upstream-service-time"] = "30", 
            date = "Tue, 28 Feb 2023 00:52:28 GMT", 
            server = "envoy"
        }, 
        isCached = false, 
        stats = {
            durations = {
                SSLHandshake = 0, 
                connect = 1.7999999999999787E-5, 
                inQueue = 7.93759999986321E-5, 
                makeRequest = 1.6599999999999991E-4, 
                nameLookup = 0.002935, 
                receiveResponse = 0.282859, 
                roundTripTime = 0.28607101800000123
            }, 
            retried = false
        }, 
        status = {
            code = 200, 
            message = "OK"
        }, 
        type = "internal-response"
    }
};
