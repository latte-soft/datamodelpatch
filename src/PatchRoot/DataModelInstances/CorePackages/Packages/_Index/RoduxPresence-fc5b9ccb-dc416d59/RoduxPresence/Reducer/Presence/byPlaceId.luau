local v0 = require(script.Parent.createReducerSlice);
return function(v1)
    return v0("byPlaceId", "placeId", v1);
end;
