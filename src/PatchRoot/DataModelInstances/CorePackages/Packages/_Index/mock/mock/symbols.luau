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
v4 = "None";
v5 = newproxy(true);
v4 = ("Mocks.%s"):format(v4);
do
    local l_v4_2 = v4;
    getmetatable(v5).__tostring = function()
        return l_v4_2;
    end;
    v6 = v5;
end;
v3.None = v6;
v4 = "ReturnValue";
v5 = newproxy(true);
v4 = ("Mocks.%s"):format(v4);
do
    local l_v4_3 = v4;
    getmetatable(v5).__tostring = function()
        return l_v4_3;
    end;
    v6 = v5;
end;
v3.ReturnValue = v6;
v4 = "Name";
v5 = newproxy(true);
v4 = ("Mocks.%s"):format(v4);
do
    local l_v4_4 = v4;
    getmetatable(v5).__tostring = function()
        return l_v4_4;
    end;
    v6 = v5;
end;
v3.Name = v6;
v4 = "Address";
v5 = newproxy(true);
v4 = ("Mocks.%s"):format(v4);
do
    local l_v4_5 = v4;
    getmetatable(v5).__tostring = function()
        return l_v4_5;
    end;
    v6 = v5;
end;
v3.Address = v6;
v4 = "Operations";
v5 = newproxy(true);
v4 = ("Mocks.%s"):format(v4);
do
    local l_v4_6 = v4;
    getmetatable(v5).__tostring = function()
        return l_v4_6;
    end;
    v6 = v5;
end;
v3.Operations = v6;
v4 = "Spec";
v5 = newproxy(true);
v4 = ("Mocks.%s"):format(v4);
do
    local l_v4_7 = v4;
    getmetatable(v5).__tostring = function()
        return l_v4_7;
    end;
    v6 = v5;
end;
v3.Spec = v6;
v4 = "SideEffect";
v5 = newproxy(true);
v4 = ("Mocks.%s"):format(v4);
do
    local l_v4_8 = v4;
    getmetatable(v5).__tostring = function()
        return l_v4_8;
    end;
    v6 = v5;
end;
v3.SideEffect = v6;
v4 = "isSpy";
v5 = newproxy(true);
v4 = ("Mocks.%s"):format(v4);
do
    local l_v4_9 = v4;
    getmetatable(v5).__tostring = function()
        return l_v4_9;
    end;
    v6 = v5;
end;
v3.isSpy = v6;
v4 = "isTuple";
v5 = newproxy(true);
v4 = ("Mocks.%s"):format(v4);
do
    local l_v4_10 = v4;
    getmetatable(v5).__tostring = function()
        return l_v4_10;
    end;
    v6 = v5;
end;
v3.isTuple = v6;
v4 = "isMagicMock";
v5 = newproxy(true);
v4 = ("Mocks.%s"):format(v4);
do
    local l_v4_11 = v4;
    getmetatable(v5).__tostring = function()
        return l_v4_11;
    end;
    v6 = v5;
end;
v3.isMagicMock = v6;
v4 = "isPredicate";
v5 = newproxy(true);
v4 = ("Mocks.%s"):format(v4);
do
    local l_v4_12 = v4;
    getmetatable(v5).__tostring = function()
        return l_v4_12;
    end;
    v6 = v5;
end;
v3.isPredicate = v6;
return v3;
