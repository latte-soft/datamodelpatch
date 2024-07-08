local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_HttpService_0 = game:GetService("HttpService");
local l_OpenCloudService_0 = game:GetService("OpenCloudService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
returnInvalidArgumentError = function(v5)
    return {
        StatusCode = 400, 
        Body = l_HttpService_0:JSONEncode({
            code = "INVALID_ARGUMENT", 
            message = v5
        })
    };
end;
verifyPlayerOnServer = function(v6)
    local v7 = verifyPlayer(v6);
    if v7 ~= nil then
        return v7;
    else
        for _, v9 in ipairs((l_Players_0:GetPlayers())) do
            if v9.UserId == v6.UserId then
                return nil;
            end;
        end;
        return returnInvalidArgumentError("Player not found on server.");
    end;
end;
verifyPlayer = function(v10)
    if not (typeof(v10) == "Instance") or v10.ClassName ~= "Player" then
        return returnInvalidArgumentError("user argument not a Player instance.");
    else
        return nil;
    end;
end;
verifyString = function(v11)
    if typeof(v11) ~= "string" then
        return returnInvalidArgumentError("Argument not a string.");
    else
        return nil;
    end;
end;
verifyNumber = function(v12)
    if typeof(v12) ~= "number" then
        return returnInvalidArgumentError("Argument not a number.");
    else
        return nil;
    end;
end;
getUrlPrefix = function()
    if not l_RunService_0:IsStudio() then
        return "rcc";
    else
        return "user";
    end;
end;
createListInventoryItemsUrl = function(v13, v14, v15, v16)
    local v17 = string.format("%s%s/cloud/v2/users/%d/inventory-items", string.gsub(string.gsub(l_ContentProvider_0.BaseUrl:lower(), "http:", "https:"), "www", "apis"), getUrlPrefix(), v13);
    if (v14 == nil and v15 == nil) and v16 == nil then
        return v17;
    else
        local v18 = {};
        if v14 ~= nil then
            table.insert(v18, string.format("maxPageSize=%d", v14));
        end;
        if v15 ~= nil then
            table.insert(v18, string.format("pageToken=%s", v15));
        end;
        if v16 ~= nil then
            table.insert(v18, string.format("filter=%s", v16));
        end;
        return (string.format("%s?%s", v17, table.concat(v18, "&")));
    end;
end;
listInventoryItems = function(v19)
    if v19.user == nil then
        return returnInvalidArgumentError("user argument was not provided.");
    else
        local v20 = verifyPlayerOnServer(v19.user);
        if v20 ~= nil then
            return v20;
        else
            if v19.maxPageSize ~= nil then
                v20 = verifyNumber(v19.maxPageSize);
                if v20 ~= nil then
                    return v20;
                end;
            end;
            if v19.pageToken ~= nil then
                v20 = verifyString(v19.pageToken);
                if v20 ~= nil then
                    return v20;
                end;
            end;
            if v19.filter ~= nil then
                v20 = verifyString(v19.filter);
                if v20 ~= nil then
                    return v20;
                end;
            end;
            return l_OpenCloudService_0:HttpRequestAsync({
                Url = createListInventoryItemsUrl(v19.user.UserId, v19.maxPageSize, v19.pageToken, v19.filter), 
                Request_Type = "GET"
            });
        end;
    end;
end;
l_OpenCloudService_0:RegisterOpenCloud("v2", "listInventoryItems", listInventoryItems);
l_OpenCloudService_0:RegistrationComplete();
