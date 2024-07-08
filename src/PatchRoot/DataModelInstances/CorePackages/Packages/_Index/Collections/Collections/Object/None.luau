local v0 = newproxy(true);
getmetatable(v0).__tostring = function()
    return "Object.None";
end;
return v0;
