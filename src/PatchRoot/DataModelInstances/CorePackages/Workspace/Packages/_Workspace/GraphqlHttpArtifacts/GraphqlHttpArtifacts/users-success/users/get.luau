return {
    request = {
        cachePolicy = Enum.HttpCachePolicy.None, 
        headers = {}, 
        method = "GET", 
        url = {
            host = "users.roblox.com", 
            path = "/v1/users/1", 
            query = {}, 
            scheme = "https"
        }
    }, 
    response = {
        body = "{\"description\":\"Welcome to the Roblox profile\"2006-02-27T21:06:40.3Z\",\"isBanned\":false,\"externalAppDisplayName\":null,\"hasVerifiedBadge\":true,\"id\":1,\"name\":\"Roblox\",\"displayName\":\"Roblox\"}", 
        headers = {
            ["cache-control"] = "no-cache", 
            ["content-length"] = "601", 
            ["content-type"] = "application/json; charset=utf-8", 
            ["report-to"] = "{\"group\":\"network-errors\",\"max_age\":604800,\"endpoints\":[{\"url\":\"https://ncs.roblox.com/upload\"}]}", 
            ["roblox-machine-id"] = "CHI1-WEB9068", 
            ["x-frame-options"] = "SAMEORIGIN", 
            ["x-powered-by"] = "ASP.NET", 
            date = "Thu, 01 Dec 2022 18:51:44 GMT", 
            nel = "{\"report_to\":\"network-errors\",\"max_age\":604800,\"success_fraction\":0.001,\"failure_fraction\":1}", 
            p3p = "CP=\"CAO DSP COR CURa ADMa DEVa OUR IND PHY ONL UNI COM NAV INT DEM PRE\"", 
            server = "Microsoft-IIS/8.5"
        }, 
        isCached = false, 
        stats = {
            durations = {
                SSLHandshake = 0.09612300000000001, 
                connect = 0.085217, 
                inQueue = 1.7911000000037092E-5, 
                makeRequest = 2.599999999997049E-5, 
                nameLookup = 0.095011, 
                receiveResponse = 0.146775, 
                roundTripTime = 0.42320003199999956
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
