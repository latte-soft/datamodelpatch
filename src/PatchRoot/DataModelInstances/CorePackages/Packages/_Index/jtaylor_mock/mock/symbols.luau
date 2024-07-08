local function _(v0)
    local v1 = newproxy(true);
    v0 = ("Mocks.%s"):format(v0);
    getmetatable(v1).__tostring = function()
        return v0;
    end;
    return v1;
end;
local v3 = {};
local v4 = "Calls";
local v5 = newproxy(true);
v4 = ("Mocks.%s"):format(v4);
local v6;
do
    local l_v4_0 = v4;
    getmetatable(v5).__tostring = function()
        return l_v4_0;
    end;
    v6 = v5;
end;
v3.Calls = v6;
v4 = "Children";
v5 = newproxy(true);
v4 = ("Mocks.%s"):format(v4);
do
    local l_v4_1 = v4;
    getmetatable(v5).__tostring = function()
        return l_v4_1;
    end;
    v6 = v5;
end;
v3.Children = v6;
v4 = "Lock";
v5 = newproxy(true);
v4 = ("Mocks.%s"):format(v4);
do
    local l_v4_2 = v4;
    getmetatable(v5).__tostring = function()
        return l_v4_2;
    end;
    v6 = v5;
end;
v3.Lock = v6;
v4 = "None";
v5 = newproxy(true);
v4 = ("Mocks.%s"):format(v4);
do
    local l_v4_3 = v4;
    getmetatable(v5).__tostring = function()
        return l_v4_3;
    end;
    v6 = v5;
end;
v3.None = v6;
v4 = "ReturnValue";
v5 = newproxy(true);
v4 = ("Mocks.%s"):format(v4);
do
    local l_v4_4 = v4;
    getmetatable(v5).__tostring = function()
        return l_v4_4;
    end;
    v6 = v5;
end;
v3.ReturnValue = v6;
return v3;
