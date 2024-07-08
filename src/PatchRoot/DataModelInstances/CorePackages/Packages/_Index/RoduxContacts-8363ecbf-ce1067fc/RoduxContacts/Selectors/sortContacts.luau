local v0 = require(script.Parent.Parent.getDeepValue);
return function(v1)
    local l_keyPath_0 = v1.keyPath;
    return function(v3)
        local v4 = v0(v3, l_keyPath_0 .. ".byContactId") or {};
        local v5 = {};
        for v6, v7 in pairs(v4) do
            table.insert(v5, {
                contactId = v6, 
                contactName = v7.contactName, 
                headshotThumbnailUrl = v7.headshotThumbnailUrl, 
                avatarThumbnailUrl = v7.avatarThumbnailUrl
            });
        end;
        table.sort(v5, function(v8, v9)
            if not (not v8.contactName or not v9.contactName) and v8.contactName ~= v9.contactName then
                return v8.contactName < v9.contactName;
            else
                return v8.contactId < v9.contactId;
            end;
        end);
        return v5;
    end;
end;
