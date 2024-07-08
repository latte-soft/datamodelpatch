local _ = script.Parent.Parent;
return function(v1, v2)
    if not v2 then
        return v1.PriceInRobux or 0;
    elseif v1.PremiumPriceInRobux ~= nil then
        return v1.PremiumPriceInRobux;
    else
        return v1.PriceInRobux or 0;
    end;
end;
