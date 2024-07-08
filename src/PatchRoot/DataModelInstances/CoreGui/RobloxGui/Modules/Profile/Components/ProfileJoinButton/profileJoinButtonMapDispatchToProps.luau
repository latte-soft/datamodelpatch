local l_NetworkingGames_0 = require(script.Parent.Parent.Parent.dependencies).NetworkingGames;
return function(v1)
    return {
        getExperiencesDetails = function(v2)
            return v1(l_NetworkingGames_0.GetExperiencesDetails.API({
                v2
            }));
        end, 
        getExperiencePlayabilityStatus = function(v3)
            return v1(l_NetworkingGames_0.GetExperiencesPlayabilityStatus.API({
                v3
            })):andThen(function(v4)
                return v4.responseBody[1].playabilityStatus;
            end);
        end, 
        getExperiencesProductInfo = function(v5)
            return v1(l_NetworkingGames_0.GetExperiencesProductInfo.API({
                v5
            }));
        end
    };
end;
