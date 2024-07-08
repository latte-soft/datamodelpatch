local l_Url_0 = require(script:FindFirstAncestor("GraphqlHttpArtifacts").Parent.Http).Url;
return {
    request = {
        body = "{\"userIds\":[\"2705220939\",\"9999999\"],\"fields\":[\"names.combinedName\"]}", 
        cachePolicy = Enum.HttpCachePolicy.None, 
        headers = {
            ["content-type"] = "application/json", 
            accept = "application/json"
        }, 
        method = "POST", 
        url = {
            host = l_Url_0.stripHttpsAndTrailingSlash(l_Url_0.APIS_URL), 
            path = "/user-profile-api/v1/user/profiles/get-profiles", 
            query = {}, 
            scheme = "https"
        }
    }, 
    response = {
        body = "{\"profileDetails\":[{\"userId\":9999999,\"names\": { \"combinedName\": \"CarleyRJep\" }},{\"userId\":2705220939,\"names\": { \"combinedName\": \"Julian\" }}]}", 
        headers = {
            ["content-length"] = "312", 
            ["content-type"] = "application/json; charset=utf-8", 
            ["report-to"] = "{\"group\":\"network-errors\",\"max_age\":604800,\"endpoints\":[{\"url\":\"https://ncs.roblox.com/upload\"}]}", 
            ["strict-transport-security"] = "max-age=3600", 
            ["x-envoy-upstream-service-time"] = "123", 
            date = "Tue, 6 Apr 2023 23:54:34 GMT", 
            nel = "{\"report_to\":\"network-errors\",\"max_age\":604800,\"success_fraction\":0.001,\"failure_fraction\":1}", 
            server = "envoy"
        }, 
        isCached = false, 
        stats = {
            durations = {
                SSLHandshake = 0.015057000000000001, 
                connect = 0.007671, 
                inQueue = 4.848499997933686E-5, 
                makeRequest = 5.9000000000000025E-5, 
                nameLookup = 0.004717, 
                receiveResponse = 0.190536, 
                roundTripTime = 0.21809353899993766
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
