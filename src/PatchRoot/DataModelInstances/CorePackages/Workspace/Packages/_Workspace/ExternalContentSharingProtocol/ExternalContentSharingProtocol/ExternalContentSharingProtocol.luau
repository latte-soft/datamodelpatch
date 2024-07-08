local l_Parent_0 = script.Parent.Parent;
local l_MessageBus_0 = require(l_Parent_0.MessageBus).MessageBus;
local v2 = require(l_Parent_0.t);
local _ = require(script.Parent.ExternalContentSharingProtocolTypes);
local _ = require(l_Parent_0.MessageBus);
local v5 = {
    EXTERNAL_CONTENT_SHARING_SHARE_TEXT_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("ExternalContentSharing", "shareText"), 
        validateParams = v2.strictInterface({
            text = v2.string, 
            context = v2.optional(v2.string)
        })
    }, 
    EXTERNAL_CONTENT_SHARING_SHARE_URL_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("ExternalContentSharing", "shareUrl"), 
        validateParams = v2.strictInterface({
            url = v2.string, 
            context = v2.optional(v2.string)
        })
    }, 
    EXTERNAL_CONTENT_SHARING_SHARE_IMAGE_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("ExternalContentSharing", "shareImage"), 
        validateParams = v2.strictInterface({
            context = v2.optional(v2.string), 
            image = v2.string, 
            shareSheetTitle = v2.optional(v2.string), 
            url = v2.optional(v2.string)
        })
    }, 
    EXTERNAL_CONTENT_SHARING_SHARE_VIDEO_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("ExternalContentSharing", "shareVideo"), 
        validateParams = v2.strictInterface({
            context = v2.optional(v2.string), 
            shareSheetTitle = v2.optional(v2.string), 
            url = v2.optional(v2.string), 
            video = v2.string
        })
    }
};
v5.__index = v5;
v5.new = function(v6)
    return (setmetatable({
        messageBus = v6 or l_MessageBus_0
    }, v5));
end;
v5.shareText = function(v7, v8)
    v7.messageBus.publish(v7.EXTERNAL_CONTENT_SHARING_SHARE_TEXT_DESCRIPTOR, v8);
end;
v5.shareUrl = function(v9, v10)
    v9.messageBus.publish(v9.EXTERNAL_CONTENT_SHARING_SHARE_URL_DESCRIPTOR, v10);
end;
v5.shareImage = function(v11, v12)
    v11.messageBus.publish(v11.EXTERNAL_CONTENT_SHARING_SHARE_IMAGE_DESCRIPTOR, v12);
end;
v5.shareVideo = function(v13, v14)
    v13.messageBus.publish(v13.EXTERNAL_CONTENT_SHARING_SHARE_VIDEO_DESCRIPTOR, v14);
end;
v5.default = v5.new();
return v5;
