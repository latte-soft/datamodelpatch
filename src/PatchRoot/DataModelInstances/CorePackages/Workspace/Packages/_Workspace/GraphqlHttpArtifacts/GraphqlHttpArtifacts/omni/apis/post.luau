return {
    request = {
        body = "{\"pageType\":\"Home\",\"sessionId\":\"1\"}", 
        cachePolicy = Enum.HttpCachePolicy.None, 
        headers = {
            ["content-type"] = "application/json", 
            accept = "application/json"
        }, 
        method = "POST", 
        url = {
            host = "apis.roblox.com", 
            path = "/discovery-api/omni-recommendation", 
            query = {}, 
            scheme = "https"
        }
    }, 
    response = {
        headers = {
            ["content-length"] = "75230", 
            ["content-type"] = "application/json; charset=utf-8", 
            ["report-to"] = "{\"group\":\"network-errors\",\"max_age\":604800,\"endpoints\":[{\"url\":\"https://ncs.roblox.com/upload\"}]}", 
            ["strict-transport-security"] = "max-age=3600", 
            ["x-envoy-upstream-service-time"] = "222", 
            date = "Sat, 03 Dec 2022 00:51:22 GMT", 
            nel = "{\"report_to\":\"network-errors\",\"max_age\":604800,\"success_fraction\":0.001,\"failure_fraction\":1}", 
            server = "envoy"
        }, 
        isCached = false, 
        stats = {
            durations = {
                SSLHandshake = 0.026648000000000005, 
                connect = 0.015444, 
                inQueue = 2.3897000005490554E-5, 
                makeRequest = 4.699999999999149E-5, 
                nameLookup = 0.025798, 
                receiveResponse = 0.331759, 
                roundTripTime = 0.39974957399999766
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
