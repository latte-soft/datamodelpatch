local l_Roact_0 = require(script:FindFirstAncestor("SocialLibraries").dependencies).Roact;
return function(v1)
    return function(v2)
        assert(type(v2) == "function", "Expect renderCallback to be a function.");
        return l_Roact_0.createElement(v1.Consumer, {
            render = v2
        });
    end;
end;
