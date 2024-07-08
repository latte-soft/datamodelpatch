local l_Parent_0 = script:FindFirstAncestor("StreamNotifications").Parent;
local v1 = require(l_Parent_0.Promise);
local v2 = require(l_Parent_0.UrlBuilder).UrlBuilder.new({
    base = require(game:GetService("CorePackages").Workspace.Packages.Http).Url.NOTIFICATION_URL, 
    path = "v2/stream-notifications/action/{notificationId}/{actionPath}"
});
return function(v3, v4, v5)
    if not ((v4 ~= nil and v4 ~= "") and v5 ~= nil) or v5 == "" then
        return v1.reject();
    else
        return v3(v2({
            notificationId = v4, 
            actionPath = v5
        }), "POST", {
            postBody = "{}"
        }):andThen(function(v6)
            if v6.responseCode == 200 then
                return v1.resolve();
            else
                return v1.reject();
            end;
        end, function(_)
            return v1.reject();
        end);
    end;
end;
