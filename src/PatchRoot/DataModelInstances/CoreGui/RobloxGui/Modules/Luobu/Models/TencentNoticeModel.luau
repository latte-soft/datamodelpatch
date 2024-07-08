local v0 = require(game:GetService("CorePackages").Packages.t);
local v1 = {
    validateJson = v0.interface({
        NoticeId = v0.string, 
        Scene = v0.string, 
        Type = v0.string, 
        StartTime = v0.string, 
        EndTime = v0.string, 
        Title = v0.optional(v0.string), 
        HasRead = v0.optional(v0.boolean), 
        Content = v0.optional(v0.string), 
        NoticeUrl = v0.optional(v0.string), 
        WebTypeUrl = v0.optional(v0.string), 
        LandscapePicUrl = v0.optional(v0.string), 
        PortraitPicUrl = v0.optional(v0.string)
    }), 
    new = function()
        return {};
    end
};
v1.mock = function()
    local v2 = v1.new();
    v2.noticeId = 117617;
    v2.scene = "2";
    v2.type = "Image";
    v2.hasRead = false;
    v2.startTime = 1605686400;
    v2.endTime = 1614499200;
    v2.title = "Luobu";
    v2.noticeUrl = "https://www.roblox.cn/";
    return v2;
end;
local function _(v3)
    if not (v3 ~= "") or v3 == " " then
        return nil;
    else
        return v3;
    end;
end;
v1.fromJsonData = function(v5)
    assert(v1.validateJson(v5), "Error: TencentNotice JSON file is not valid.");
    local v6 = v1.new();
    v6.noticeId = tonumber(v5.NoticeId);
    v6.scene = v5.Scene;
    v6.startTime = tonumber(v5.StartTime);
    v6.endTime = tonumber(v5.EndTime);
    v6.hasRead = v5.HasRead;
    v6.title = v5.Title;
    v6.content = v5.Content;
    v6.type = v5.Type;
    local l_NoticeUrl_0 = v5.NoticeUrl;
    v6.noticeUrl = if not (l_NoticeUrl_0 ~= "") or l_NoticeUrl_0 == " " then nil else l_NoticeUrl_0;
    l_NoticeUrl_0 = v5.WebTypeUrl;
    v6.webTypeUrl = if not (l_NoticeUrl_0 ~= "") or l_NoticeUrl_0 == " " then nil else l_NoticeUrl_0;
    v6.landscapePicUrl = v5.LandscapePicUrl;
    v6.portraitPicUrl = v5.PortraitPicUrl;
    return v6;
end;
return v1;
