return {
    request = {
        cachePolicy = Enum.HttpCachePolicy.None, 
        headers = {}, 
        method = "GET", 
        url = {
            host = "apis.roblox.com", 
            path = "/access-management/v1/upsell-feature-access", 
            query = {
                featureName = "ComponentTestIdVerified", 
                successfulActions = "Phone"
            }, 
            scheme = "https"
        }
    }, 
    response = {
        body = "{\"featureName\":\"ComponentTestIdVerified\",\"access\":\"Granted\",\"recourse\":null,\"shouldPrompt\":true}", 
        headers = {
            ["content-length"] = "96", 
            ["content-type"] = "application/json; charset=utf-8", 
            ["report-to"] = "{\"group\":\"network-errors\",\"max_age\":604800,\"endpoints\":[{\"url\":\"https://ncs.roblox.com/upload\"}]}", 
            ["strict-transport-security"] = "max-age=3600", 
            ["x-envoy-upstream-service-time"] = "23", 
            ["x-roblox-edge"] = "sea1", 
            ["x-roblox-region"] = "us-central", 
            date = "Tue, 13 Jun 2023 21:27:33 GMT", 
            nel = "{\"report_to\":\"network-errors\",\"max_age\":604800,\"success_fraction\":0.001,\"failure_fraction\":1}", 
            server = "envoy"
        }, 
        isCached = false, 
        stats = {
            durations = {
                SSLHandshake = 0, 
                connect = 0, 
                inQueue = 3.737499355338514E-5, 
                makeRequest = 1.96E-4, 
                nameLookup = 4.6E-5, 
                receiveResponse = 0.278821, 
                roundTripTime = 0.2792015830054879
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
