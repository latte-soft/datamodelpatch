local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_NetworkingContacts_0 = v1.NetworkingContacts;
local l_Promise_0 = v1.Promise;
local v4 = require(l_Parent_0.Utils.contactImporterSync);
local v5 = require(l_Parent_0.Utils.formatContacts);
return function(v6, v7, v8, v9)
    return function(v10)
        local l_UnixTimestampMillis_0 = DateTime.now().UnixTimestampMillis;
        local v12 = v4:shouldSyncContacts(v8, v6, l_UnixTimestampMillis_0);
        if not (not v9 and not v12) then
            v7:supportsContacts():andThen(function(v13)
                if not v13 then
                    return (l_Promise_0.reject());
                else
                    return (l_Promise_0.resolve());
                end;
            end):andThen(function()
                return v7:getContacts();
            end):andThen(function(v14)
                return v10:dispatch(l_NetworkingContacts_0.UploadContactsByUser.API((v5(v14))));
            end):andThen(function()
                return v4:updateSyncTimestamp(v8, v6, l_UnixTimestampMillis_0);
            end):catch(function()
            end);
        end;
    end;
end;
