local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("GraphQLServer").Parent;
local _ = require(l_Parent_0.LuauPolyfill);
local v3 = require(l_Parent_0.UrlBuilder);
local v4 = require(l_Parent_0.Promise);
local v5 = require(l_Parent_0.Fetch);
local l_UrlBuilder_0 = v3.UrlBuilder;
local l_UrlBase_0 = v3.UrlBase;
local l_GraphQLError_0 = require(l_Parent_0.GraphQL).GraphQLError;
local l_fetch_0 = v5.fetch;
local l_Response_0 = v5.Response;
local _ = require(script.Parent.Parent.generatedTypes);
local v12 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "sharelinks/v1/get-or-create-link"
})();
return {
    fetchShareLink = function(v13, v14)
        local v15 = v14 or l_fetch_0;
        local v16 = l_HttpService_0:JSONEncode({
            linkType = v13.linkType, 
            data = l_HttpService_0:JSONEncode(v13.data)
        });
        return v4.new(function(v17, v18)
            local v21 = v15(v12, {
                body = v16, 
                method = "POST", 
                headers = {
                    ["Content-Type"] = "application/json", 
                    Accept = "application/json"
                }
            }):catch(function(v19)
                local v20 = l_Response_0.error();
                v20.statusText = v19.message;
                return v20;
            end):expect();
            if v21.ok then
                local v22 = v21:json():catch(function()
                    return nil;
                end):expect();
                if v21 then
                    v17(v22);
                    return ;
                else
                    v18(l_GraphQLError_0.new((("Failed to decode HTTP response as JSON for share link matching type: %*"):format(type))));
                    return ;
                end;
            else
                print(v21.statusText .. " " .. v21.status);
                v18(l_GraphQLError_0.new(v21.statusText, nil, nil, nil, nil, {
                    extensions = {
                        status = v21.status, 
                        statusText = v21.statusText
                    }
                }));
                return ;
            end;
        end);
    end
};
