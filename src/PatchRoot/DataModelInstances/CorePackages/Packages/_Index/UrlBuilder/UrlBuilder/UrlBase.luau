local v0 = string.gsub(string.gsub(string.gsub(game:GetService("ContentProvider").BaseUrl, ".*://", ""), "/.*", ""), "^www%.", "");
local v7 = {
    new = function(v1, v2)
        assert(type(v1) == "string", "UrlBase.new: `name` should be a string");
        if v2 == nil then
            v2 = {};
        end;
        if not (type(v2) ~= "number") or type(v2) == "string" then
            v2 = {
                version = v2
            };
        end;
        assert(type(v2) == "table", "UrlBase.new: `params` should be a table");
        local l_proto_0 = v2.proto;
        local l_version_0 = v2.version;
        local l_path_0 = v2.path;
        if l_proto_0 == nil then
            l_proto_0 = v2.secure == false and "http" or "https";
        end;
        local l_l_proto_0_0 = l_proto_0;
        if #l_proto_0 > 0 then
            l_l_proto_0_0 = l_l_proto_0_0 .. "://";
        end;
        l_l_proto_0_0 = l_l_proto_0_0 .. v1;
        if #v1 > 0 then
            l_l_proto_0_0 = l_l_proto_0_0 .. ".";
        end;
        l_l_proto_0_0 = l_l_proto_0_0 .. v0;
        if l_version_0 ~= nil and #tostring(l_version_0) > 0 then
            l_l_proto_0_0 = l_l_proto_0_0 .. "/v" .. tostring(l_version_0);
        end;
        if l_path_0 ~= nil and #l_path_0 > 0 then
            l_l_proto_0_0 = l_l_proto_0_0 .. "/" .. l_path_0;
        end;
        return l_l_proto_0_0;
    end
};
local v8 = string.sub(v0, -6) == "qq.com";
v7.API = v7.new("api");
v7.APIS = v7.new("apis");
v7.APIS_RBXCDN = "https://apis.rbxcdn.com";
v7.AUTH = v7.new("auth");
v7.CHAT = v7.new("chat");
v7.CREATE = v7.new("create");
v7.FRIENDS = v7.new("friends", 1);
v7.ASSETGAME = v7.new("assetgame");
v7.GAMES = v7.new("games", 1);
v7.NOTIFICATION = v7.new("notification", 2);
v7.NOTIFICATIONS = v7.new("notifications", 2);
v7.PRESENCE = v7.new("presence", 1);
v7.REALTIME = v7.new("realtime");
v7.WEB = v7.new("web");
v7.WWW = v7.new("www");
v7.ADS = v7.new("ads", 1);
v7.ADCONFIGURATION = v7.new("adconfiguration", 2);
v7.FOLLOWINGS = v7.new("followings", 1);
v7.PREMIUM = v7.new("premiumfeatures", 1);
v7.BLOG = "https://blog.roblox.com";
v7.CORP = not v8 and "https://corp.roblox.com" or "https://roblox.qq.com";
v7.USERMODERATION = v7.new("usermoderation", 1);
v7.ACCOUNTINFORMATION = v7.new("accountinformation", 1);
v7.ACCOUNTSETTINGS = v7.new("accountsettings");
v7.BADGES = v7.new("badges", 1);
v7.INVENTORY = v7.new("inventory", 1);
v7.CATALOG = v7.new("catalog", 1);
v7.AVATAR = v7.new("avatar", 1);
v7.MOBILENAV = "roblox://navigation";
v7.APPSFLYER = "https://ro.blox.com";
return v7;
