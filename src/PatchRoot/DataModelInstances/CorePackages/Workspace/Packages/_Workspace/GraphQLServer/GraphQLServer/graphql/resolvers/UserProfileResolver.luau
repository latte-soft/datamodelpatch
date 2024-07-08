local l_script_FirstAncestor_0 = script:FindFirstAncestor("GraphQLServer");
local _ = require(l_script_FirstAncestor_0.Parent.LuauPolyfill);
local l_GraphQLError_0 = require(l_script_FirstAncestor_0.Parent.GraphQL).GraphQLError;
local v3 = require(l_script_FirstAncestor_0.graphql.utils.formatUserProfileFields);
local _ = require(script.Parent.Parent.generatedTypes);
local v5 = require(l_script_FirstAncestor_0.Flags.FFlagUserProfileBetterErrors);
return {
    UserProfile = {
        id = function(v6)
            return (tostring(v6.userId));
        end, 
        displayName = function()
            return l_GraphQLError_0.new("The displayName field is not available on the UserProfile implementation of User, please use the names field instead");
        end
    }, 
    Query = {
        userProfiles = function(_, v8, v9, v10)
            return v9.dataLoaders.userProfiles:getLoader(v9.fetchImpl, (v3(v10, v9.collectSubFieldsImpl))):loadMany(v8.userIds):andThen(function(v11)
                return v11 or {};
            end):catch(function(v12)
                if not v5 then
                    return {};
                else
                    return v12;
                end;
            end);
        end
    }
};
