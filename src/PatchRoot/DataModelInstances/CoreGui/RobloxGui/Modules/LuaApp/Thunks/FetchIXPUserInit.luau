local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v4 = require(l_Modules_0.LuaApp.ArgCheck);
local v5 = require(l_Modules_0.LuaApp.Promise);
local v6 = {};
local function _(v7, v8)
    return "IXPFetchUserInit" .. tostring(v7) .. tostring(v8);
end;
v6.Fetch = function(v10, v11, v12)
    return l_PerformFetch_0.Single("IXPFetchUserInit" .. tostring(v11) .. tostring(v10), function(v13)
        if v10 then
            v4.isInTypes(v11, {
                "number", 
                "string"
            }, "userId");
            if typeof(v11) == "string" then
                v4.isNonEmptyString(v11, "userId");
            end;
            v4.assert(v6.IsValidUserIdForIxp(v11), string.format("expects %s to be a number or string representing a positive number", v11));
            v10:InitializeUserLayers(tonumber(v11) or 0);
            if v10:GetUserLayerLoadingStatus() ~= Enum.IXPLoadingStatus.Pending then
                return v5.resolve();
            else
                local v14 = nil;
                local v15 = false;
                return v5.new(function(v16, v17)
                    if v12 then
                        delay(v12, function()
                            if not v15 then
                                local v18 = l_PerformFetch_0.GetStatus(v13:getState(), "IXPFetchUserInit" .. tostring(v11) .. tostring(v10));
                                if v18 ~= l_RetrievalStatus_0.Done and v18 ~= l_RetrievalStatus_0.Failed then
                                    if v14 then
                                        v14:disconnect();
                                        v14 = nil;
                                    end;
                                    v17();
                                end;
                                return ;
                            else
                                return ;
                            end;
                        end);
                    end;
                    v14 = v10.OnUserLayerLoadingStatusChanged:Connect(function(_)
                        if v10:GetUserLayerLoadingStatus() ~= Enum.IXPLoadingStatus.Pending then
                            v15 = true;
                            if v14 then
                                v14:disconnect();
                                v14 = nil;
                            end;
                            v16();
                        end;
                    end);
                end);
            end;
        else
            return v5.reject();
        end;
    end);
end;
v6.GetFetchingStatus = function(v20, v21, v22)
    return l_PerformFetch_0.GetStatus(v20, "IXPFetchUserInit" .. tostring(v21) .. tostring(v22));
end;
v6.IsValidUserIdForIxp = function(v23)
    local v24 = false;
    if v23 ~= nil then
        v24 = false;
        if v23 ~= "" then
            v24 = false;
            if v23 ~= "-1" then
                v24 = false;
                if v23 ~= "0" then
                    v24 = false;
                    if v23 ~= -1 then
                        v24 = v23 ~= 0;
                    end;
                end;
            end;
        end;
    end;
    return v24;
end;
return v6;
