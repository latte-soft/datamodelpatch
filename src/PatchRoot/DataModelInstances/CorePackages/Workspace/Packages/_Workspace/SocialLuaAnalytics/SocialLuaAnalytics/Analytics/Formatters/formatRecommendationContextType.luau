local l_RecommendationContextTypes_0 = require(script.Parent.Parent.Parent.Analytics.Enums).RecommendationContextTypes;
return function(v1)
    if v1 == nil then
        return nil;
    else
        return l_RecommendationContextTypes_0[v1.rawValue()].rawValue();
    end;
end;
