local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script:FindFirstAncestor("GraphQLServer").Parent;
local _ = require(l_Parent_0.LuauPolyfill);
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_Parent_0.UrlBuilder).UrlBase;
local _ = require(script.Parent.Parent.generatedTypes);
local v6 = require(l_Parent_0.Promise);
local l_GraphQLError_0 = require(l_Parent_0.GraphQL).GraphQLError;
local l_fetch_0 = require(l_Parent_0.Fetch).fetch;
local l_Response_0 = require(l_Parent_0.Fetch).Response;
local v10 = {};
local v11 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.new("users", 1), 
    path = "users/{id}"
});
local function v19(v12, v13)
    local v14 = v13 or l_fetch_0;
    return v6.new(function(v15, v16)
        local v17 = v14(v11({
            id = v12
        }), {
            method = "GET"
        }):catch(function()
            return l_Response_0.error();
        end):expect();
        if v17.ok then
            local v18 = v17:json():catch(function()
                return nil;
            end):expect();
            if v18 then
                v15({
                    id = tostring(v18.id), 
                    displayName = v18.displayName
                });
                return ;
            else
                v16(l_GraphQLError_0.new(string.format("Failed to decode HTTP response as JSON for user matching id: %s.", v12)));
                return ;
            end;
        else
            v16(l_GraphQLError_0.new(string.format("Failed to find user matching id: %s.", v12)));
            return ;
        end;
    end);
end;
v10.findUserById = v19;
v10.findMe = function(v20, v21)
    local v22 = v21 or l_Players_0.LocalPlayer;
    if v22 then
        return v19(tostring(v22.UserId), v20);
    else
        return v6.reject(l_GraphQLError_0.new("LocalPlayer not found"));
    end;
end;
return v10;
