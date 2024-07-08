local function v1(v0)
    return string.format("%%%02X", v0:byte(1, 1));
end;
return function(v2)
    return v2:gsub("[%w_%-%%.%~%*%'%(%)]", v1);
end;
