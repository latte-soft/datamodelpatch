local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.RoactAppExperiment);
local v2 = require(l_Parent_0.SharedFlags);
local l_useUserExperiment_0 = v1.useUserExperiment;
local l_FStringPaginatedCarouselExperimentLayer_0 = v2.FStringPaginatedCarouselExperimentLayer;
local l_FFlagFriendsCarouselIXPfriendsSort_0 = v2.FFlagFriendsCarouselIXPfriendsSort;
return {
    usePaginatedFriendsCarouselExperiment = function()
        local v9, v10 = l_useUserExperiment_0({
            l_FStringPaginatedCarouselExperimentLayer_0
        }, function(v6)
            local v7 = v6[l_FStringPaginatedCarouselExperimentLayer_0] or {};
            local l_paginatedFriendsCarouselEnabled_0 = v7.paginatedFriendsCarouselEnabled;
            if not l_FFlagFriendsCarouselIXPfriendsSort_0 then
                return l_paginatedFriendsCarouselEnabled_0, nil;
            else
                return l_paginatedFriendsCarouselEnabled_0, v7.friendsSortVariant;
            end;
        end);
        return v9, v10;
    end
};
