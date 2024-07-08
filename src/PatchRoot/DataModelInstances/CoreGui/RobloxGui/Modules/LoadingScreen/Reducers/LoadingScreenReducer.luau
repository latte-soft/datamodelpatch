local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Rodux);
return v2.combineReducers({
    isSubjectToChinaPolicies = v2.createReducer(nil, {
        [require(l_CoreGui_0.RobloxGui.Modules.LoadingScreen.Actions.SetIsSubjectToChinaPolicies).name] = function(_, v4)
            return v4.isSubjectToChinaPolicies;
        end
    }), 
    productInfo = v2.createReducer(nil, {
        [require(l_CoreGui_0.RobloxGui.Modules.LoadingScreen.Actions.SetGameProductInfo).name] = function(_, v6)
            return v6.productInfo;
        end
    }), 
    gameIds = v2.createReducer(nil, {
        [require(l_CoreGui_0.RobloxGui.Modules.LoadingScreen.Actions.SetUniverseId).name] = function(_, v8)
            return {
                universeId = v8.universeId, 
                placeId = v8.placeId
            };
        end
    })
});
