local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v3 = require(l_Modules_0.LuaApp.Analytics.Events.openYouTubeVideo);
local _ = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local _ = require(l_Modules_0.LuaApp.AppPage);
local v6 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v7 = require(l_Modules_0.Personalization.Flags.GetFFlagLuaAppYoutubeNoCookie);
local _ = table.concat({
    "autoplay=1", 
    "controls=0", 
    "modestbranding=1", 
    "rel=0", 
    "loop=0", 
    "cc_load_policy=0", 
    "playsinline=0"
}, "&");
local v9 = {
    autoplay = 1, 
    controls = 0, 
    modestbranding = 1, 
    rel = 0, 
    loop = 0, 
    cc_load_policy = 0, 
    playsinline = 0
};
return function(v10, v11, v12, v13, v14, v15, v16)
    return function(_)
        local v18 = v6.new({
            base = not v7() and "https://www.youtube.com" or "https://www.youtube-nocookie.com", 
            path = "/embed/{id}", 
            query = v9
        })({
            id = v11
        });
        v3(v14, v13, v12, v11, v15, v16);
        v10:BroadcastNotification(l_HttpService_0:JSONEncode({
            url = v18, 
            title = v12, 
            animated = true
        }), v2.OPEN_YOUTUBE_VIDEO);
    end;
end;
