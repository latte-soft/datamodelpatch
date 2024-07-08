local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local v3 = require(l_Parent_1.llama);
local v4 = require(l_Parent_0.Actions.RecommendationSourceCreated);
local _ = require(l_Parent_0.roduxFriendsTypes);
local v6 = {};
return function(_)
    return v2.createReducer(v6, {
        [v4.name] = function(v8, v9)
            return v3.Dictionary.join(v8, {
                [v9.payload.source] = v3.List.reduce(v9.payload.recommendationIds or {}, function(v10, v11)
                    v10[tostring(v11)] = true;
                    return v10;
                end, {})
            });
        end
    });
end;
