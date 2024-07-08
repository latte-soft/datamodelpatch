local l_Parent_0 = script:FindFirstAncestor("CommunityLinks").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local v3 = game:DefineFastFlag("LuaAppEnableCommunityLinksRedirect", false);
return function(v4)
    local _ = nil;
    if not v3 then
        return "https://guilded.gg/teams/" .. v4 .. "?a=red";
    else
        return (l_UrlBuilder_0.new({
            base = l_Url_0.APIS_URL, 
            path = "community-links/v1/guilded/{communityId}/join", 
            query = {
                a = "red"
            }
        })({
            communityId = v4
        }));
    end;
end;
