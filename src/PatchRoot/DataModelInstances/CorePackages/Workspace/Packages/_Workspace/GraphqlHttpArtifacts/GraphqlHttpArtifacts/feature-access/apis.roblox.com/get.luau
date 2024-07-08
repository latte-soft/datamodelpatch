return {
    request = {
        cachePolicy = Enum.HttpCachePolicy.None, 
        headers = {}, 
        method = "GET", 
        url = {
            host = "apis.roblox.com", 
            path = "/access-management/v1/feature-access", 
            query = {
                featureNames = "ComponentTestAlways,ComponentTestNever"
            }, 
            scheme = "https"
        }
    }, 
    response = {
        body = "{\"features\":[{\"featureName\":\"ComponentTestAlways\",\"access\":\"Granted\",\"recourse\":null,\"shouldPrompt\":true},{\"featureName\":\"ComponentTestNever\",\"access\":\"Denied\",\"recourse\":null,\"shouldPrompt\":true}]}", 
        headers = {
            ["content-length"] = "198", 
            ["content-type"] = "application/json; charset=utf-8", 
            ["report-to"] = "{\"group\":\"network-errors\",\"max_age\":604800,\"endpoints\":[{\"url\":\"https://ncs.roblox.com/upload\"}]}", 
            ["strict-transport-security"] = "max-age=3600", 
            ["x-envoy-upstream-service-time"] = "18", 
            ["x-roblox-edge"] = "sea1", 
            ["x-roblox-region"] = "us-central", 
            date = "Tue, 13 Jun 2023 21:27:33 GMT", 
            nel = "{\"report_to\":\"network-errors\",\"max_age\":604800,\"success_fraction\":0.001,\"failure_fraction\":1}", 
            server = "envoy"
        }, 
        isCached = false, 
        stats = {
            durations = {
                SSLHandshake = 0.159708, 
                connect = 0.10238, 
                inQueue = 4.187499871477485E-5, 
                makeRequest = 5.300000000002525E-5, 
                nameLookup = 2.7E-5, 
                receiveResponse = 0.10607299999999997, 
                roundTripTime = 0.368323375005275
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
