local l_Parent_0 = script:FindFirstAncestor("StreamNotifications").Parent;
local v1 = require(l_Parent_0.Promise);
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local v4 = require(l_Parent_0.UrlBuilder).UrlBuilder.new({
    base = require(l_CorePackages_0.Workspace.Packages.Http).Url.APIS_URL, 
    path = "notifications/v1/report-notification"
});
return function(v5, v6)
    if not (v6 ~= nil) or v6 == "" then
        return v1.reject();
    else
        return v5(v4(), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                notificationId = v6
            })
        }):andThen(function(v7)
            if v7.responseCode == 200 then
                return v1.resolve();
            else
                return v1.reject();
            end;
        end, function(_)
            return v1.reject();
        end);
    end;
end;
