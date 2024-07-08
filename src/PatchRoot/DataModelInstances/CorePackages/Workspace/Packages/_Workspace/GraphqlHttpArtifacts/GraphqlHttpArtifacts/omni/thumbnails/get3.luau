return {
    request = {
        cachePolicy = Enum.HttpCachePolicy.None, 
        headers = {}, 
        method = "GET", 
        url = {
            host = "thumbnails.roblox.com", 
            path = "/v1/games/icons", 
            query = {
                format = "png", 
                size = "150x150", 
                universeIds = "111958650,65241,3602573884,3772826703,994732206,537069295,1954906532,2059325053,1261193936,2788648141,1247975681,93740418,228573408,3150475059,104923451,8813012,3253980207,1410457361,113491250,1752441640,3317679266,903807016,1526814825,83858907,2201173838,733957164,807930589,3314547819,156428258,2327642508,2547466305,1073273083,848145103,3640612838,21164849,2309508401,2387000728,4069560710,4049084123,3967853925,3636659319,3457700596,2711375305,3864279452,4070145896,110181652,3635273480,4109781891,4034899513,3965173814,3498637623,1607099925,648454481,3990079401,3041401734,4114143871,1037979853,3400380447,56031201,245662005,1390601379,2918970982,2619619496,279565647,142553158,2516044547,3248021343,69530376,4038495518,1451439645,2864934080,2927276067,2270890905,375716943,354554209,2380077519,1958807588,3742686765,3957438343,2516682908,372226183,3476371299,3365661357,498490399,887491118,2404080894,321279858,1176784616,3183403065,1720936166,2114144926,1531130248,3191268194,4039349750,110988953,3627275994,3934054182,2146451001,21449357,400167956"
            }, 
            scheme = "https"
        }
    }, 
    response = {
        headers = {
            ["cache-control"] = "no-cache", 
            ["content-length"] = "12890", 
            ["content-type"] = "application/json; charset=utf-8", 
            ["report-to"] = "{\"group\":\"network-errors\",\"max_age\":604800,\"endpoints\":[{\"url\":\"https://ncs.roblox.com/upload\"}]}", 
            ["roblox-machine-id"] = "CHI1-WEB9040", 
            ["x-frame-options"] = "SAMEORIGIN", 
            ["x-powered-by"] = "ASP.NET", 
            date = "Tue, 14 Feb 2023 19:49:40 GMT", 
            nel = "{\"report_to\":\"network-errors\",\"max_age\":604800,\"success_fraction\":0.001,\"failure_fraction\":1}", 
            p3p = "CP=\"CAO DSP COR CURa ADMa DEVa OUR IND PHY ONL UNI COM NAV INT DEM PRE\"", 
            server = "Microsoft-IIS/8.5"
        }, 
        isCached = false, 
        stats = {
            durations = {
                SSLHandshake = 0.053143, 
                connect = 0.007947999999999997, 
                inQueue = 1.7029999999973455E-5, 
                makeRequest = 5.2999999999997494E-5, 
                nameLookup = 0.029107, 
                receiveResponse = 0.312619, 
                roundTripTime = 0.40303287399999976
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
