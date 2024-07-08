local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactImporter");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local v2 = require(l_script_FirstAncestor_0.Common.Constants);
local v3 = require(l_script_FirstAncestor_0.Flags.getFIntContactImporterUploadContactsMax);
local v4 = require(l_script_FirstAncestor_0.Flags.getFIntContactImporterUploadContactsMin);
local l_DeviceContact_0 = v1.RoduxContacts.Models.DeviceContact;
return function(v6)
    local v7 = {};
    local v8 = v3();
    local v9 = v4();
    for _, v11 in pairs(v6.contacts) do
        for _, v13 in pairs(v11.phonenumber) do
            if v8 > #v7 then
                table.insert(v7, {
                    idAssignedByFE = l_DeviceContact_0.generateId(v11), 
                    fields = {
                        {
                            name = v2.LAST_NAME, 
                            value = v11.lastname == nil and "" or tostring(v11.lastname)
                        }, 
                        {
                            name = v2.FIRST_NAME, 
                            value = v11.firstname == nil and "" or tostring(v11.firstname)
                        }, 
                        {
                            name = v2.PHONE_NUMBER, 
                            value = tostring(v13):gsub("%s+", "")
                        }
                    }
                });
            else
                break;
            end;
        end;
    end;
    local v14 = #v7;
    if v9 <= v14 then
        return {
            countryCode = v6.countryCode, 
            contacts = v7, 
            contactsCount = v14
        };
    elseif v14 < v9 then
        return {
            countryCode = v6.countryCode, 
            contacts = {}, 
            contactsCount = v14
        };
    else
        return {
            countryCode = v6.countryCode, 
            contacts = v7, 
            contactsCount = v14
        };
    end;
end;
