local v0 = 0;
return function()
    v0 = v0 + 1;
    return ("MOCK-%d"):format(v0);
end;
