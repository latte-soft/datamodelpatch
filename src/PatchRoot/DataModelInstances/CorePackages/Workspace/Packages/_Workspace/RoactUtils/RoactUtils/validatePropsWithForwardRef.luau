local v0 = require(script:FindFirstAncestor("RoactUtils").Parent.Roact);
return function(v1)
    v1.forwardRef = v1[v0.Ref];
    v1[v0.Ref] = nil;
    return v1;
end;
