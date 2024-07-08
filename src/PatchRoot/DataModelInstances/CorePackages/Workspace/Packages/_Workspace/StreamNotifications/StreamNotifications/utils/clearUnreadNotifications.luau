local l_Parent_0 = script:FindFirstAncestor("StreamNotifications").Parent;
local v1 = require(l_Parent_0.Promise);
local v2 = require(l_Parent_0.UrlBuilder).UrlBuilder.new({
    base = require(game:GetService("CorePackages").Workspace.Packages.Http).Url.NOTIFICATION_URL, 
    path = "v2/stream-notifications/clear-unread"
});
return function(v3)
    return v3(v2(), "POST", {
        postBody = "{}"
    }):andThen(function(v4)
        if v4.responseCode == 200 then
            return v1.resolve();
        else
            return v1.reject();
        end;
    end, function(v5)
        return v1.reject(v5);
    end);
end;
