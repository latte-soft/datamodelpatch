local l_Parent_0 = script:FindFirstAncestor("FriendsCarousel").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.RoactAppExperiment);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.SharedFlags);
local l_FStringPaginatedCarouselExperimentLayer_0 = v4.FStringPaginatedCarouselExperimentLayer;
local l_FFlagFriendsCarouselIXPfriendsSort_0 = v4.FFlagFriendsCarouselIXPfriendsSort;
local v7 = require(script.Parent.PaginatedCarouselImplementationWrapper);
return function(v8)
    return function(v9)
        local v13, v14 = v2.useUserExperiment({
            l_FStringPaginatedCarouselExperimentLayer_0
        }, function(v10)
            local v11 = v10[l_FStringPaginatedCarouselExperimentLayer_0] or {};
            local l_paginatedFriendsCarouselEnabled_0 = v11.paginatedFriendsCarouselEnabled;
            if not l_FFlagFriendsCarouselIXPfriendsSort_0 then
                return l_paginatedFriendsCarouselEnabled_0, nil;
            else
                return l_paginatedFriendsCarouselEnabled_0, v11.friendsSortVariant;
            end;
        end);
        if not v13 then
            return (v1.createElement(v8, v9));
        else
            return (v1.createElement(v7, v3.Dictionary.join(v9, {
                renderChildComponent = function(v15)
                    return v1.createElement(v8, v3.Dictionary.join(v9, v15 or {}));
                end, 
                friendsSortVariant = if not l_FFlagFriendsCarouselIXPfriendsSort_0 then nil else v14
            })));
        end;
    end;
end;
