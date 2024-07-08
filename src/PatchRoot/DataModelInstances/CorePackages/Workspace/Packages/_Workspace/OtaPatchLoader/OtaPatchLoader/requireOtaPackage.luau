local l_Players_0 = game:GetService("Players");
local l_DataModelPatchService_0 = game:GetService("DataModelPatchService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local v3 = require(script.Parent.requireOtaPackageInternal);
local l_Parent_0 = script:FindFirstAncestor("OtaPatchLoader").Parent;
local l_OtaPackagesStatus_0 = require(l_Parent_0.OtaPatchPackagesStatus).OtaPackagesStatus;
local l_FFlagLuaAppShowOtaPackagesLoaded_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppShowOtaPackagesLoaded;
local v7 = game:DefineFastFlag("LuaAppDisableAllOtaPackages", false);
return function(v8, v9, v10, v11, v12, v13)
    local v14 = require(v9);
    if not v7 then
        if not _G.__TESTEZ_RUNNING_TEST__ then
            if not v8 then
                error("requireOtaPackage must specify a package by name");
            end;
            if not v9 then
                error("requireOtaPackage must specify a starter script");
            end;
            if not v11 then
                error("requireOtaPackage must specify a patch info");
            end;
            local l_v9_FirstAncestor_0 = v9:FindFirstAncestor("CorePackages");
            if l_v9_FirstAncestor_0 then
                if l_v9_FirstAncestor_0 ~= game:GetService("CorePackages") then
                    return v14;
                else
                    local v16 = not not l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or nil;
                    if not v16 or v16 == 0 then
                        v16 = tonumber(l_AppStorageService_0:GetItem("UserId")) or 0;
                    end;
                    assert(v16, "userId should always exist; assert to workaround static analysis");
                    local v17 = {
                        loggingProtocol = v12, 
                        dataModelPatchService = l_DataModelPatchService_0
                    };
                    if not l_FFlagLuaAppShowOtaPackagesLoaded_0 then
                        return v3(v16, v8, v14, v10, v11, v17, v13, nil);
                    else
                        local v18 = v3(v16, v8, v14, v10, v11, v17, v13, nil);
                        l_OtaPackagesStatus_0.AddPackageStatus(v11.patchName, v8, v18 ~= v14);
                        return v18;
                    end;
                end;
            else
                return v14;
            end;
        else
            return v14;
        end;
    else
        return v14;
    end;
end;
