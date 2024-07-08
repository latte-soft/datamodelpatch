local v0 = {
    ["and"] = true, 
    ["break"] = true, 
    ["do"] = true, 
    ["else"] = true, 
    ["elseif"] = true, 
    ["end"] = true, 
    ["false"] = true, 
    ["for"] = true, 
    ["function"] = true, 
    ["if"] = true, 
    ["in"] = true, 
    ["local"] = true, 
    ["nil"] = true, 
    ["not"] = true, 
    ["or"] = true, 
    ["repeat"] = true, 
    ["return"] = true, 
    ["then"] = true, 
    ["true"] = true, 
    ["until"] = true, 
    ["while"] = true
};
return function(v1)
    return v1:match("^[%a_][%w_]*$") and v0[v1] == nil;
end;
