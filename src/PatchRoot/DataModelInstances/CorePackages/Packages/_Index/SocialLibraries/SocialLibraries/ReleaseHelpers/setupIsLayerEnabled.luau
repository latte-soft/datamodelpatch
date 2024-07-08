local v0 = require(script.Parent.Parent.Dictionary.getDeepValue);
return function(v1)
    return function(v2)
        return v0((v2 or {})[v1.layerName] or {}, v1.variantName) or false;
    end;
end;
