local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Dash);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Result);
local v4 = {
    new = function()
        return {};
    end, 
    validateModel = v2.interface({
        summary = v2.interface({
            ageRecommendation = v2.optional(v2.interface({
                displayName = v2.optional(v2.string), 
                minimumAge = v2.number
            }))
        }), 
        descriptorUsages = v2.optional(v2.array(v2.interface({
            name = v2.optional(v2.string), 
            followsComplianceApi = v2.optional(v2.boolean), 
            descriptor = v2.interface({
                name = v2.string, 
                displayName = v2.string, 
                complianceApiSupported = v2.boolean, 
                iconUrl = v2.optional(v2.string), 
                localeCode = v2.optional(v2.string)
            }), 
            descriptorDimensionUsages = v2.optional(v2.array(v2.interface({
                dimensionName = v2.optional(v2.string), 
                dimensionValue = v2.optional(v2.string)
            })))
        })))
    })
};
v4.mock = function(v5)
    v5 = v5 or {};
    local v6 = v4.new();
    v6.summary = {
        ageRecommendation = {
            displayName = "13+", 
            minimumAge = 13
        }
    };
    v6.descriptorUsages = {
        [1] = {
            descriptor = {
                complianceApiSupported = false, 
                displayName = "Blood", 
                iconUrl = "https://images.rbxcdn.com/blood-icon.svg", 
                name = "blood"
            }, 
            descriptorDimensionUsages = {
                [1] = {
                    dimensionName = "realism", 
                    dimensionValue = "unrealistic"
                }, 
                [2] = {
                    dimensionName = "blood-level", 
                    dimensionValue = "heavy"
                }
            }, 
            name = "blood"
        }, 
        [2] = {
            descriptor = {
                complianceApiSupported = false, 
                displayName = "Violence", 
                iconUrl = "https://images.rbxcdn.com/violence-icon.svg", 
                name = "violence"
            }, 
            descriptorDimensionUsages = {
                [1] = {
                    dimensionName = "intensity", 
                    dimensionValue = "mild"
                }, 
                [2] = {
                    dimensionName = "frequency", 
                    dimensionValue = "infrequent"
                }
            }, 
            name = "violence"
        }
    };
    v6 = v1.joinDeep(v6, v5);
    if v4.validateModel(v6) then
        return v6;
    else
        return error("AgeRecommendationDetails mockData is invalid");
    end;
end;
v4.fromJsonData = function(v7)
    if v4.validateModel(v7) then
        return v3.success((v1.joinDeep(v4.new(), v7)));
    else
        return v3.error("AgeRecommendationDetails.fromJsonData expects a valid moderation JSON response");
    end;
end;
return v4;
