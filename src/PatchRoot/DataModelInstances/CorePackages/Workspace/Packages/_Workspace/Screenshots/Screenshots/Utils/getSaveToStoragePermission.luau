local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_default_0 = require(l_Parent_1.PermissionsProtocol).PermissionsProtocol.default;
local v4 = require(l_Parent_0.Thunks.SaveCaptureToExternalStorage);
local v5 = require(l_Parent_0.Thunks.SaveCapturesToExternalStorage);
local _ = require(l_Parent_0.Types);
local v7 = require(l_Parent_0.Flags.FFlagCaptureStorageBulkManagementM2Enabled);
local v8 = require(l_Parent_0.Flags.FFlagScreenshotsSaveToDeviceToast);
return function(v9, v10, v11)
    l_default_0:hasPermissions({
        l_default_0.Permissions.WRITE_MEDIA_STORAGE
    }):andThen(function(v12)
        local v13 = v12.status == l_default_0.Status.AUTHORIZED;
        if not (l_UserInputService_0:GetPlatform() == Enum.Platform.Android) or v13 then
            if not v8 or v13 then
                if v7 and #v9 > 0 then
                    v11(v5(v9));
                    return ;
                else
                    v11(v4(v9));
                    return ;
                end;
            else
                l_default_0:requestPermissions({
                    l_default_0.Permissions.WRITE_MEDIA_STORAGE
                }):andThen(function(v14)
                    if v14.status == l_default_0.Status.AUTHORIZED then
                        if v7 and #v9 > 0 then
                            v11(v5(v9));
                            return ;
                        else
                            v11(v4(v9));
                        end;
                    end;
                end):catch(function()
                end);
                return ;
            end;
        elseif v10 then
            assert(v10 ~= nil, "openPermissionModal is not nil");
            v10();
            return ;
        else
            return ;
        end;
    end):catch(function()
        if l_UserInputService_0:GetPlatform() ~= Enum.Platform.Android then
            return ;
        elseif v10 then
            assert(v10 ~= nil, "openPermissionModal is not nil");
            v10();
            return ;
        else
            return ;
        end;
    end);
    return nil;
end;
