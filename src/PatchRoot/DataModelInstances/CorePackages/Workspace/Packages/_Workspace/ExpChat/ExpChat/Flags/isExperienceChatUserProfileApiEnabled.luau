local l_AppStorageService_0 = game:GetService("AppStorageService");
game:DefineFastInt("ExperienceChatUserProfileApiRollout_v1", 0);
game:DefineFastFlag("ExperienceChatUserProfileApiEnabledForAll_v1", false);
local function _(v1)
    local l_l_AppStorageService_0_0 = l_AppStorageService_0;
    if v1 then
        l_l_AppStorageService_0_0 = v1;
    end;
    local l_l_l_AppStorageService_0_0_Item_0 = l_l_AppStorageService_0_0:GetItem("AppInstallationId");
    local v4 = typeof(l_l_l_AppStorageService_0_0_Item_0);
    if v4 == "number" then
        return l_l_l_AppStorageService_0_0_Item_0;
    elseif v4 == "string" then
        if string.len(l_l_l_AppStorageService_0_0_Item_0) <= 0 then
            return nil;
        else
            return (tonumber((string.sub(l_l_l_AppStorageService_0_0_Item_0, -2))));
        end;
    else
        return nil;
    end;
end;
local function _(v6, v7)
    local v8 = v6();
    local l_l_AppStorageService_0_1 = l_AppStorageService_0;
    if v7 then
        l_l_AppStorageService_0_1 = v7;
    end;
    local l_l_l_AppStorageService_0_1_Item_0 = l_l_AppStorageService_0_1:GetItem("AppInstallationId");
    local v11 = typeof(l_l_l_AppStorageService_0_1_Item_0);
    local v12 = if v11 == "number" then l_l_l_AppStorageService_0_1_Item_0 else if v11 == "string" then if string.len(l_l_l_AppStorageService_0_1_Item_0) <= 0 then nil else tonumber((string.sub(l_l_l_AppStorageService_0_1_Item_0, -2))) else nil;
    if v12 == nil then
        return v8 >= 100;
    else
        return v12 % 100 + 1 <= v8;
    end;
end;
local function _(v14, v15)
    local v16 = v14();
    local l_l_AppStorageService_0_2 = l_AppStorageService_0;
    if v15 then
        l_l_AppStorageService_0_2 = v15;
    end;
    local l_l_l_AppStorageService_0_2_Item_0 = l_l_AppStorageService_0_2:GetItem("AppInstallationId");
    local v19 = typeof(l_l_l_AppStorageService_0_2_Item_0);
    local v20 = if v19 == "number" then l_l_l_AppStorageService_0_2_Item_0 else if v19 == "string" then if string.len(l_l_l_AppStorageService_0_2_Item_0) <= 0 then nil else tonumber((string.sub(l_l_l_AppStorageService_0_2_Item_0, -2))) else nil;
    local v21 = if v20 == nil then v16 >= 100 else v20 % 100 + 1 <= v16;
    return function()
        return v21;
    end;
end;
local function v23()
    return game:GetFastInt("ExperienceChatUserProfileApiRollout_v1");
end;
local function _()
    return game:GetFastFlag("ExperienceChatUserProfileApiEnabledForAll_v1");
end;
local v25 = v23();
local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem("AppInstallationId");
local v27 = typeof(l_l_AppStorageService_0_Item_0);
local v28 = if v27 == "number" then l_l_AppStorageService_0_Item_0 else if v27 == "string" then if string.len(l_l_AppStorageService_0_Item_0) <= 0 then nil else tonumber((string.sub(l_l_AppStorageService_0_Item_0, -2))) else nil;
local v29 = if v28 == nil then v25 >= 100 else v28 % 100 + 1 <= v25;
local function v30()
    return v29;
end;
return function()
    return game:GetFastFlag("ExperienceChatUserProfileApiEnabledForAll_v1") or v30();
end;
