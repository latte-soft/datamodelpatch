return function(v0)
    return v0.userId % 100 + 1 <= v0.throttle;
end;
