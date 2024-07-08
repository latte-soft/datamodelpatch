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
        body = "", 
        headers = {
            ["content-length"] = "0", 
            ["report-to"] = "{\"group\":\"network-errors\",\"max_age\":604800,\"endpoints\":[{\"url\":\"https://ncs.roblox.com/upload\"}]}", 
            ["strict-transport-security"] = "max-age=3600", 
            ["x-envoy-upstream-service-time"] = "30", 
            date = "Tue, 28 Feb 2023 00:52:28 GMT", 
            server = "envoy"
        }, 
        isCached = false, 
        stats = {
            durations = {
                SSLHandshake = 0, 
                connect = 0, 
                inQueue = 1.1888000003068555E-5, 
                makeRequest = 6.9E-5, 
                nameLookup = 4.0E-5, 
                receiveResponse = 0.088885, 
                roundTripTime = 0.08910791099999926
            }, 
            retried = false
        }, 
        status = {
            code = 404, 
            message = "Not Found"
        }, 
        type = "internal-response"
    }
};
