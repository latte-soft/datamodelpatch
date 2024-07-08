local v0 = require(script:FindFirstAncestor("RoactUtils").Parent.React);
return function(v1)
    v0.useEffect(function()
        v1();
    end, {});
end;
