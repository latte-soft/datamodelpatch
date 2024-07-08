return {
    request = {
        cachePolicy = Enum.HttpCachePolicy.None, 
        headers = {}, 
        method = "POST", 
        url = {
            host = "apis.roblox.com", 
            path = "/virtual-events/v1/notifications/modal-history", 
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
            ["x-envoy-upstream-service-time"] = "85", 
            date = "Fri, 24 Feb 2023 19:10:00 GMT", 
            server = "envoy"
        }, 
        isCached = false, 
        stats = {
            durations = {
                SSLHandshake = 0, 
                connect = 0, 
                inQueue = 3.506900000260771E-5, 
                makeRequest = 7.800000000000001E-5, 
                nameLookup = 5.4E-5, 
                receiveResponse = 0.111598, 
                roundTripTime = 0.11186444599999845
            }, 
            retried = false
        }, 
        status = {
            code = 500, 
            message = "Internal Server Error"
        }, 
        type = "internal-response"
    }
};
