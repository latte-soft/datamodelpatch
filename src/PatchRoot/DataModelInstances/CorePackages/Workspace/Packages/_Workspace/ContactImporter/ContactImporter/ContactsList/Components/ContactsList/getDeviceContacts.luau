local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactImporter");
local l_Dash_0 = require(l_script_FirstAncestor_0.dependencies).Dash;
local _ = require(l_script_FirstAncestor_0.Common.LocalTypes);
local v3 = {};
local function v5(v4)
    return v4.byDeviceContactId or v3;
end;
local function _(v6)
    return function(v7)
        local v8 = v6.hasSentRequest or v3;
        return l_Dash_0.map(v7, function(v9)
            return l_Dash_0.join(v9, {
                hasSentRequest = v8[v9.id]
            });
        end);
    end;
end;
local function v13(v11)
    return l_Dash_0.map(v11, function(v12)
        return l_Dash_0.join(v12, {
            phoneNumber = tostring(v12.phoneNumbers[1]), 
            phoneNumbers = l_Dash_0.None
        });
    end);
end;
local function _(v14)
    return function(v15)
        local v16 = {};
        l_Dash_0.forEach(v15, function(v17)
            if not (v14.deviceContactToRobloxContact and v14.deviceContactToRobloxContact[v17.id]) then
                v16[v17.id] = l_Dash_0.join(v17, {
                    deviceContactId = v17.id, 
                    isMatchedContact = false, 
                    id = l_Dash_0.None
                });
            end;
        end);
        return v16;
    end;
end;
local function v20(v19)
    return l_Dash_0.values(v19);
end;
local function _(v21)
    return string.gsub(v21, "^%s*(.*)$", "%1");
end;
local function v28(v23)
    table.sort(v23, function(v24, v25)
        if not (not v24.contactName or not v25.contactName) then
            local v26 = string.gsub(string.upper(v24.contactName), "^%s*(.*)$", "%1");
            local v27 = string.gsub(string.upper(v25.contactName), "^%s*(.*)$", "%1");
            if not (not v26 or not v27) and v26 ~= v27 then
                return v26 < v27;
            end;
        end;
        return v24.deviceContactId < v25.deviceContactId;
    end);
    return v23;
end;
return function(v29)
    local v30 = v29 or v3;
    return l_Dash_0.compose(v5, function(v31)
        local v32 = v30.hasSentRequest or v3;
        return l_Dash_0.map(v31, function(v33)
            return l_Dash_0.join(v33, {
                hasSentRequest = v32[v33.id]
            });
        end);
    end, v13, function(v34)
        local v35 = {};
        l_Dash_0.forEach(v34, function(v36)
            if not (v30.deviceContactToRobloxContact and v30.deviceContactToRobloxContact[v36.id]) then
                v35[v36.id] = l_Dash_0.join(v36, {
                    deviceContactId = v36.id, 
                    isMatchedContact = false, 
                    id = l_Dash_0.None
                });
            end;
        end);
        return v35;
    end, v20, v28)(v30 or {});
end;
