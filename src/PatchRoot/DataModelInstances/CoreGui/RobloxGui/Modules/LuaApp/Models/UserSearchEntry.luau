local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Result);
local v1 = {
    new = function()
        return {};
    end
};
v1.fromOmniJsonData = function(v2)
    if type(v2) ~= "table" then
        return v0.error("UserSearchEntry.fromOmniJsonData expects userSearchEntryJson to be a table");
    elseif v2.previousUsernames and type(v2.previousUsernames) ~= "table" then
        return v0.error("UserSearchEntry.entries expects entry.previousUsernames to be a table or null");
    elseif type(v2.contentId) ~= "number" then
        return v0.error("UserSearchEntry.entries expects entry.contentId to be a number");
    elseif type(v2.username) ~= "string" then
        return v0.error("UserSearchEntry.entries expects entry.username to be a string");
    elseif type(v2.displayName) ~= "string" then
        return v0.error("UserSearchEntry.entries expects entry.displayName to be a string");
    elseif v2.contentType ~= "User" then
        return v0.error("UserSearchEntry.entries expects entry.contentType to be 'User'");
    else
        local v3 = v1.new();
        v3.previousUsernames = v2.previousUsernames or {};
        v3.id = tostring(v2.contentId);
        v3.name = v2.username;
        v3.displayName = v2.displayName;
        return v0.success(v3);
    end;
end;
v1.fromJsonData = function(v4)
    if type(v4) ~= "table" then
        return v0.error("UserSearchEntry.fromJsonData expects userSearchEntryJson to be a table");
    elseif type(v4.previousUsernames) ~= "table" then
        return v0.error("UserSearchEntry.entries expects entry.previousUsernames to be a table");
    elseif type(v4.id) ~= "number" then
        return v0.error("UserSearchEntry.entries expects entry.id to be a number");
    elseif type(v4.name) ~= "string" then
        return v0.error("UserSearchEntry.entries expects entry.name to be a string");
    elseif type(v4.displayName) ~= "string" then
        return v0.error("UserSearchEntry.entries expects entry.displayName to be a string");
    else
        local v5 = v1.new();
        v5.previousUsernames = v4.previousUsernames;
        v5.id = tostring(v4.id);
        v5.name = v4.name;
        v5.displayName = v4.displayName;
        return v0.success(v5);
    end;
end;
v1.mock = function()
    local v6 = v1.new();
    v6.previousUsernames = {
        "tester001", 
        "tester002"
    };
    v6.id = 123456;
    v6.name = "tester003";
    v6.displayName = "tester003";
    return v6;
end;
return v1;
