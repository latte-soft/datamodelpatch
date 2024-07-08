local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v5 = require(l_Modules_0.LuaApp.Http.Url);
local v6 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Utils);
return {
    FetchPPEConfig = function(v7)
        return v7(string.format("%s/v1/avatar/thumbnail-customizations", v5.AVATAR_URL), "GET");
    end, 
    WritePPEConfig = function(v8, v9, v10, v11, v12, v13)
        v4.isType(v9, "userdata", "WebApi.WritePPEConfig expects thumbnailType to be a userdata");
        v4.isTypeOrNil(v10, "string", "WebApi.WritePPEConfig expects emoteAssetId to be a string or nil");
        v4.isType(v11, "number", "WebApi.WritePPEConfig expects cameraDistanceScale to be a number");
        v4.isType(v12, "number", "WebApi.WritePPEConfig expects cameraYRotDeg to be a number");
        v4.isType(v13, "number", "WebApi.WritePPEConfig expects fieldOfViewDeg to be a number");
        return v8(string.format("%s/v1/avatar/thumbnail-customization", v5.AVATAR_URL), "POST", {
            postBody = l_HttpService_0:JSONEncode({
                thumbnailType = v6.ConvertThumbnailTypeToInt(v9), 
                emoteAssetId = not v10 and 0 or tonumber(v10), 
                camera = {
                    fieldOfViewDeg = v13, 
                    yRotDeg = v12, 
                    distanceScale = v11
                }
            })
        });
    end
};
