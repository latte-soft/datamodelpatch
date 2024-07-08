local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(script.Parent.getMockName);
local _ = require(script.Parent.Parent.Types.ContactTypes);
local v3 = require(l_Parent_0.Dash);
local v4 = {};
v4.new = function(v5)
    v4.__index = v4;
    local v6 = {
        id = v5.id, 
        phoneNumbers = v5.phoneNumbers, 
        contactName = v5.contactName
    };
    setmetatable(v6, v4);
    return v6;
end;
v4.mock = function(v7)
    local v8 = v1();
    return v4.new((v3.join({
        id = v8, 
        contactName = v8, 
        phoneNumbers = {
            123456
        }
    }, v7)));
end;
v4.formatFromDevice = function(v9)
    return v4.new({
        id = v4.generateId(v9), 
        contactName = (v9.firstname or "") .. " " .. (v9.lastname or ""), 
        phoneNumbers = v9.phonenumber
    });
end;
v4.generateId = function(v10)
    return (v10.firstname or "") .. (v10.lastname or "") .. tostring(v10.phonenumber[1]);
end;
return v4;
