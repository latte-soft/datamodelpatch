local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_CaptureService_0 = game:GetService("CaptureService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_default_0 = require(l_Parent_1.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default;
local l_Localization_0 = require(l_Parent_1.RobloxAppLocales).Localization;
local v6 = require(l_Parent_0.Enums.CaptureType);
local v7 = require(l_Parent_0.Constants);
local v8 = require(l_Parent_0.Enums.ServerType);
local v9 = require(l_Parent_0.Analytics.EventNames);
local v10 = require(l_Parent_0.Analytics.FireEvent);
local v11 = require(l_Parent_0.Utils.getPlaceIdFromCapture);
local v12 = require(l_Parent_0.App.Networking);
local _ = require(l_Parent_0.Types);
local l_NetworkingShareLinks_0 = v12.NetworkingShareLinks;
local l_LinkType_0 = v12.RoduxShareLinks.Enums.LinkType;
local v16 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
local function v19(v17, v18)
    if l_default_0 then
        assert(l_default_0 ~= nil, "ExternalContentSharingProtocol is required");
        l_default_0:shareImage({
            context = v7.CapturesContext, 
            image = v17, 
            shareSheetTitle = v16:Format("Feature.Captures.Action.ShareYourCapture"), 
            url = v18
        });
        return ;
    else
        return ;
    end;
end;
local function v22(v20, v21)
    if l_default_0 then
        assert(l_default_0 ~= nil, "ExternalContentSharingProtocol is required");
        l_default_0:shareVideo({
            context = v7.CapturesContext, 
            shareSheetTitle = v16:Format("Feature.Captures.Action.ShareYourCapture"), 
            url = v21, 
            video = v20
        });
        return ;
    else
        return ;
    end;
end;
local function _(v23, v24)
    if v23.type == v6.Video then
        v22(v23.filePath, v24);
    else
        v19(v23.filePath, v24);
    end;
    if game:GetEngineFeature("ShareCaptureUploadToApiEnabled") then
        l_CaptureService_0:OnCaptureShared(v23.filePath);
    end;
end;
return function(v26, v27)
    return function(v28)
        if v28:getState().ServerType == v8.StandardServer then
            local v29 = nil;
            local l_PlaceId_0 = game.PlaceId;
            local v31 = v11(v26);
            if l_PlaceId_0 == v31 then
                v29 = game.JobId;
            end;
            v28:dispatch(l_NetworkingShareLinks_0.GenerateLink.API({
                instanceId = v29, 
                launchData = v27, 
                linkType = l_LinkType_0.ScreenshotInvite.rawValue(), 
                placeId = v31
            })):andThen(function(v32)
                local l_shortUrl_0 = v32.responseBody.shortUrl;
                local l_v26_0 = v26;
                if l_v26_0.type == v6.Video then
                    v22(l_v26_0.filePath, l_shortUrl_0);
                else
                    v19(l_v26_0.filePath, l_shortUrl_0);
                end;
                if game:GetEngineFeature("ShareCaptureUploadToApiEnabled") then
                    l_CaptureService_0:OnCaptureShared(l_v26_0.filePath);
                end;
            end):catch(function(v35)
                warn("GenerateLink failed with error:", v35);
                v10(v9.ShareCaptureGenerateLinkFailed, {
                    httpError = v35.HttpError
                });
                local l_v26_1 = v26;
                if l_v26_1.type == v6.Video then
                    v22(l_v26_1.filePath, nil);
                else
                    v19(l_v26_1.filePath, nil);
                end;
                if game:GetEngineFeature("ShareCaptureUploadToApiEnabled") then
                    l_CaptureService_0:OnCaptureShared(l_v26_1.filePath);
                end;
            end);
            return ;
        else
            local l_v26_2 = v26;
            if l_v26_2.type == v6.Video then
                v22(l_v26_2.filePath, nil);
            else
                v19(l_v26_2.filePath, nil);
            end;
            if game:GetEngineFeature("ShareCaptureUploadToApiEnabled") then
                l_CaptureService_0:OnCaptureShared(l_v26_2.filePath);
            end;
            v10(v9.CapturesShareFromNonStandardServer);
            return ;
        end;
    end;
end;
