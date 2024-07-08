local l_Parent_0 = script:FindFirstAncestor("GraphQLServer").Parent;
local _ = require(l_Parent_0.LuauPolyfill);
local v2 = require(script.Parent.Parent.generatedTypes);
local v3 = require(script.Parent.Parent.connectors.ShareLinkConnector);
local v4 = require(l_Parent_0.Cryo);
return {
    ExperienceDetailsLink = {
        linkType = function()
            return v2.ShareLinkType.ExperienceDetails;
        end, 
        linkId = function(v5)
            return v5.linkId;
        end, 
        shortUrl = function(v6)
            return v6.shortUrl;
        end, 
        universeId = function(_, _, _, v10)
            return v10.variableValues.universeId;
        end
    }, 
    Query = {
        experienceDetailsLinkByUniverseId = function(_, v12, v13, _)
            return v3.fetchShareLink(v4.Dictionary.join({
                linkType = v2.ShareLinkType.ExperienceDetails, 
                data = v12
            }), v13.fetchImpl);
        end
    }
};
