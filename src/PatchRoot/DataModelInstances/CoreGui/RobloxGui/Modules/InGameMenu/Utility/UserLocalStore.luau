local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Players_0 = game:GetService("Players");
local l_HttpService_0 = game:GetService("HttpService");
local function _()
    if l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId > 0 then
        return (tostring(l_Players_0.LocalPlayer.UserId));
    else
        return "0";
    end;
end;
local function _(v4)
    return "u_" .. tostring(v4 or "0");
end;
local function v10(v6)
    local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem(v6);
    local l_status_0, l_result_0 = pcall(function()
        return l_HttpService_0:JSONDecode(l_l_AppStorageService_0_Item_0);
    end);
    if l_status_0 and type(l_result_0) == "table" then
        return l_result_0;
    else
        return {
            default = l_l_AppStorageService_0_Item_0
        };
    end;
end;
local function _(v11, v12)
    l_AppStorageService_0:SetItem(v11, (l_HttpService_0:JSONEncode(v12)));
end;
local v14 = {};
v14.__index = v14;
v14.new = function(v15)
    if not v15 then
        v15 = if not not l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId > 0 then tostring(l_Players_0.LocalPlayer.UserId) else "0";
    end;
    local v16 = {
        userId = tostring(v15)
    };
    setmetatable(v16, v14);
    return v16;
end;
v14.GetItem = function(v17, v18)
    local v19 = v10(v18);
    local v20 = v19["u_" .. tostring(v17.userId or "0")];
    if v20 == nil then
        v20 = v19.default;
    end;
    return v20;
end;
v14.SetItem = function(v21, v22, v23)
    local v24 = v10(v22);
    v24["u_" .. tostring(v21.userId or "0")] = v23;
    l_AppStorageService_0:SetItem(v22, (l_HttpService_0:JSONEncode(v24)));
end;
v14.Flush = function(_)
    l_AppStorageService_0:Flush();
end;
v14.getItem = v14.GetItem;
v14.setItem = v14.SetItem;
v14.flush = v14.Flush;
return v14;
