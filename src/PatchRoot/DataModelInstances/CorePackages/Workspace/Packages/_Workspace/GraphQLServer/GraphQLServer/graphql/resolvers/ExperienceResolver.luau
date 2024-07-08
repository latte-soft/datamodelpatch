local l_Parent_0 = script:FindFirstAncestor("GraphQLServer").Parent;
local v1 = require(l_Parent_0.Promise);
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local _ = require(script.Parent.Parent.generatedTypes);
return {
    Experience = {
        thumbnails = function(v4, _, v6)
            local l_thumbnails_0 = v6.dataLoaders.thumbnails;
            if l_thumbnails_0 then
                return (l_thumbnails_0:load(v4.universeId):andThen(function(v8)
                    if v8 then
                        return {
                            {
                                url = v8.imageUrl
                            }
                        };
                    else
                        return {};
                    end;
                end):catch(function()
                    return {};
                end));
            else
                return v1.resolve({});
            end;
        end
    }, 
    Query = {
        experienceThumbnails = function(_, v10)
            return l_Array_0.map(v10.universeIds, function(v11)
                return {
                    universeId = v11
                };
            end);
        end
    }
};
