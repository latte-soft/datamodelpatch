local l_MessageBusService_0 = game:GetService("MessageBusService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("TenFootUiShell").Parent;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_Parent_0.UrlBuilder).UrlBase;
local v5 = require(l_Parent_0.Promise);
local l_FetchFriendsCarousel_0 = require(l_Parent_0.FriendsCarousel).FetchFriendsCarousel;
local v7 = game:DefineFastInt("FriendListRefreshRequestRetryCount", 3);
local v8 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "platform-social-processor/v1/start-sync"
});
local _ = function()
    return v5.new(function(v9, _)
        l_MessageBusService_0:MakeRequest("CredentialsProtocol", "getHeaders", {}, function(v11)
            v9(v11);
        end, {});
    end);
end;
return function(v13, v14, v15)
    return v5.new(function(v16, _)
        l_MessageBusService_0:MakeRequest("CredentialsProtocol", "getHeaders", {}, function(v18)
            v16(v18);
        end, {});
    end):andThen(function(v19)
        if v19 ~= nil and v19.success then
            local l_headers_0 = v19.headers;
            local v21 = {};
            if not (not l_headers_0 or not l_headers_0.Authorization) then
                v21.Authorization = l_headers_0.Authorization;
            end;
            return v14(v8(), "POST", {
                headers = l_headers_0 or {}, 
                postBody = l_HttpService_0:JSONEncode(v21), 
                maxRetryCount = v7
            }):andThen(function(_)
                v13(l_FetchFriendsCarousel_0()):andThen(function(_)
                    return v5.resolve();
                end, function(_)
                    warn("Refresh friends carousel failed after syncing platform friends");
                    return v5.resolve();
                end);
            end, function(_)
                warn("Platform friend list refresh failed.");
                v15.Diag:reportCounter("TriggerFriendListRefreshFailed", 1);
                return v5.resolve();
            end);
        else
            warn("credential headers error");
            return ;
        end;
    end);
end;
