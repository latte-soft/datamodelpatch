local function v3(v0, _, _)
    return {
        value = v0.__targetValue, 
        complete = true
    };
end;
return function(v4)
    return {
        __targetValue = v4, 
        step = v3
    };
end;
