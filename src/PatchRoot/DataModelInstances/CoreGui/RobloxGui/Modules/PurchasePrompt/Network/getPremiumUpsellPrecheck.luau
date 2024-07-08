local v0 = require(script.Parent.Parent.Promise);
return function(v1)
    return v1.getPremiumUpsellPrecheck():andThen(function(_)
        return v0.resolve(true);
    end):catch(function(_)
        return v0.resolve(false);
    end);
end;
