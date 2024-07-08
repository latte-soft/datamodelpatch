local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GraphQLServer");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_script_FirstAncestor_0.Flags.FFlagUserProfileBetterErrors);
local _ = require(l_Parent_0.LuauPolyfill);
local v5 = require(l_Parent_0.UrlBuilder);
local v6 = require(l_Parent_0.Promise);
local v7 = require(l_Parent_0.Fetch);
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_UrlBuilder_0 = v5.UrlBuilder;
local l_GraphQLError_0 = require(l_Parent_0.GraphQL).GraphQLError;
local l_fetch_0 = v7.fetch;
local l_Response_0 = v7.Response;
local _ = require(script.Parent.Parent.generatedTypes);
local v14 = l_UrlBuilder_0.new({
    base = l_Url_0.APIS_URL, 
    path = "user-profile-api/v1/user/profiles/get-profiles"
})();
return {
    fetchProfilesByIds = function(v15, v16, v17)
        local v18 = v17 or l_fetch_0;
        return v6.new(function(v19, v20)
            local v23 = v18(v14, {
                body = l_HttpService_0:JSONEncode({
                    UserIds = v15, 
                    Fields = v16
                }), 
                method = "POST", 
                headers = {
                    ["Content-Type"] = "application/json", 
                    Accept = "application/json"
                }
            }):catch(function(v21)
                if not v3 then
                    return l_Response_0.error();
                else
                    local v22 = l_Response_0.error();
                    v22.statusText = v21.message;
                    return v22;
                end;
            end):expect();
            if v23.ok then
                local v24 = v23:json():catch(function()
                    return nil;
                end):expect();
                if v23 then
                    v19(v24.profileDetails);
                    return ;
                else
                    v20(l_GraphQLError_0.new((("Failed to decode HTTP response as JSON for user matching id: %*"):format(v15[1]))));
                    return ;
                end;
            elseif not v3 then
                v20(l_GraphQLError_0.new((("Failed to fetch user profiles. Error code: %*"):format(v23.status))));
                return ;
            else
                v20(l_GraphQLError_0.new(v23.statusText, nil, nil, nil, nil, {
                    extensions = {
                        status = v23.status, 
                        statusText = v23.statusText
                    }
                }));
                return ;
            end;
        end);
    end
};
