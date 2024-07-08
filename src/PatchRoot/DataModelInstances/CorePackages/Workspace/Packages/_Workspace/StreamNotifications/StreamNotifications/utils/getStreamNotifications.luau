local l_Parent_0 = script:FindFirstAncestor("StreamNotifications").Parent;
local v1 = require(l_Parent_0.Promise);
local v2 = require(l_Parent_0.UrlBuilder).UrlBuilder.new({
    base = require(game:GetService("CorePackages").Workspace.Packages.Http).Url.NOTIFICATION_URL, 
    path = "v2/stream-notifications/get-recent", 
    query = {
        maxRows = "{maxRows}", 
        startIndex = "{startIndex}"
    }
});
return function(v3, v4, v5)
    return v3(v2({
        maxRows = v4 or 10, 
        startIndex = v5 or 0
    }), "GET"):andThen(function(v6)
        local v7 = v6.responseBody or nil;
        if v6.responseCode == 200 and v7 ~= nil then
            return v1.resolve(v7);
        else
            return v1.reject();
        end;
    end, function(v8)
        return v1.reject(v8);
    end);
end;
