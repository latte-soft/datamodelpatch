local l_Parent_0 = script:FindFirstAncestor("ApolloLocalState").Parent;
local l_GetFFlagApolloClientFetchThumbnails_0 = require(l_Parent_0.SharedFlags).GetFFlagApolloClientFetchThumbnails;
local l_GetFFlagApolloClientFetchExperiences_0 = require(l_Parent_0.SharedFlags).GetFFlagApolloClientFetchExperiences;
return {
    keyFields = if not l_GetFFlagApolloClientFetchThumbnails_0() then nil else {
        "universeId"
    }, 
    fields = {
        adId = if not l_GetFFlagApolloClientFetchExperiences_0() then nil else {
            read = function(_, _, v5)
                local v6 = v5:toReference({
                    __typename = "OmniFeedRecommendation", 
                    contentId = v5:readField("universeId")
                });
                local v7 = if not v6 then nil else v6.contentMetadata;
                if not v7 or not v7.EncryptedAdTrackingData then
                    return "";
                else
                    return v7.EncryptedAdTrackingData;
                end;
            end
        }, 
        isSponsored = {
            read = if not l_GetFFlagApolloClientFetchExperiences_0() then nil else function(_, _, v10)
                local v11 = v10:readField("adId");
                local v12 = false;
                if v11 ~= nil then
                    v12 = v11 ~= "";
                end;
                return v12;
            end
        }, 
        thumbnails = {
            read = require(script.Parent.utils.makeDefaultReadPolicy)({})
        }
    }
};
