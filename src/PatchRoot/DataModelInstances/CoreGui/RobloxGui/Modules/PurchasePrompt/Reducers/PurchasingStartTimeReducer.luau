local v0 = require(script.Parent.Parent.Actions.StartPurchase);
return function(v1, v2)
    v1 = v1 or -1;
    if v2.type == v0.name then
        return v2.purchasingStartTime;
    else
        return v1;
    end;
end;
