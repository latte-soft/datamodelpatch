local v0 = require(script.Parent.Parent.Analytics);
return function(v1)
    if not string.match(v1.Name, "Accessory %(.+%)$") then
        v0.reportFailure(v0.ErrorType.validateAccessoryName);
        return false, {
            "Accessory.Name must match pattern \"Accessory (Name)\""
        };
    else
        return true;
    end;
end;
