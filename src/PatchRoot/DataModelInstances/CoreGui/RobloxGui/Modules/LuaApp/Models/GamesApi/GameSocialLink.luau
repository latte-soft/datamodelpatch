local v0 = {
    new = function()
        return {};
    end
};
v0.mockDiscord = function()
    local v1 = v0.new();
    v1.url = "https://discord.gg/f2vDJse";
    v1.title = "Join the discord, to chat with players, and receive updates";
    v1.type = "Discord";
    return v1;
end;
v0.mockRobloxGroup = function()
    local v2 = v0.new();
    v2.url = "https://www.roblox.com/groups/2757866";
    v2.title = "Join Flamin' Studios to instantly unlock pushups in-game";
    v2.type = "RobloxGroup";
    return v2;
end;
v0.mockTwitter = function()
    local v3 = v0.new();
    v3.url = "https://twitter.com/HiddoYT";
    v3.title = "Follow Hiddo on Twitter for Codes";
    v3.type = "Twitter";
    return v3;
end;
v0.mockAmazon = function()
    local v4 = v0.new();
    v4.url = "https://amazon.com/roblox";
    v4.title = "Check out official Roblox merch";
    v4.type = "Amazon";
    return v4;
end;
v0.fromJsonData = function(v5)
    local v6 = v0.new();
    v6.url = v5.url;
    v6.title = v5.title;
    v6.type = v5.type;
    return v6;
end;
return v0;
