return function(v0, v1, v2)
    return {
        pass = v0, 
        message = (not not v0 and v1 or v2) or v1
    };
end;
