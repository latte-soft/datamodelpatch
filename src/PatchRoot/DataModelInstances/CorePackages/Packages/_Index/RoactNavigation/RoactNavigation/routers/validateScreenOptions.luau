local v0 = require(script.Parent.Parent.utils.invariant);
return function(v1, v2)
    v0(type(v1.title) ~= "function", "title cannot be defined as a function in navigation options for screen '%s'", v2.routeName);
end;
