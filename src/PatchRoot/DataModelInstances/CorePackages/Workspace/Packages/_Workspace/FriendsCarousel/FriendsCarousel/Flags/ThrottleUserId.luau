return function(v0, v1)
    assert(type(v0) == "number", "throttle must be a number");
    assert(type(v1) == "number", "userId must be a number");
    return v1 % 100 + 1 <= v0;
end;
