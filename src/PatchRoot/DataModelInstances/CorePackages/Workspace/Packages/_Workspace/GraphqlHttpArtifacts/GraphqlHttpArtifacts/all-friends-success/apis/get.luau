return {
    request = {
        cachePolicy = Enum.HttpCachePolicy.None, 
        headers = {}, 
        method = "GET", 
        url = {
            host = "friends.roblox.com", 
            path = "/v1/users/2020952954/friends/find", 
            query = {
                limit = "5", 
                userSort = "0"
            }, 
            scheme = "https"
        }
    }, 
    response = {
        body = "{\"PreviousCursor\":null,\"PageItems\":[{\"id\":405228731,\"hasVerifiedBadge\":false},{\"id\":3927661826,\"hasVerifiedBadge\":false},{\"id\":91120764,\"hasVerifiedBadge\":false},{\"id\":1846016139,\"hasVerifiedBadge\":false},{\"id\":308199922,\"hasVerifiedBadge\":false}],\"NextCursor\":\"MzA4MTk5OTIyJjQyMTY4Njg0MSY1\"}", 
        headers = {
            ["cache-control"] = "no-cache", 
            ["content-length"] = "292", 
            ["content-type"] = "application/json; charset=utf-8", 
            ["report-to"] = "{\"group\":\"network-errors\",\"max_age\":604800,\"endpoints\":[{\"url\":\"https://ncs.roblox.com/upload\"}]}", 
            ["roblox-machine-id"] = "d749fc4fd33f", 
            ["strict-transport-security"] = "max-age=3600", 
            ["x-frame-options"] = "SAMEORIGIN", 
            ["x-roblox-edge"] = "lax2", 
            ["x-roblox-region"] = "us-central", 
            date = "Sat, 28 Oct 2023 07:17:41 GMT", 
            nel = "{\"report_to\":\"network-errors\",\"max_age\":604800,\"success_fraction\":0.001,\"failure_fraction\":1}", 
            server = "Kestrel"
        }, 
        isCached = false, 
        stats = {
            durations = {
                SSLHandshake = 0.025208000000000005, 
                connect = 0.01356, 
                inQueue = 3.408000000604261E-5, 
                makeRequest = 7.199999999999568E-5, 
                nameLookup = 0.017567, 
                receiveResponse = 0.140146, 
                roundTripTime = 0.196629315999985
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
