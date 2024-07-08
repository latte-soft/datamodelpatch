local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_Modules_0.LuaApp.Enum.SocialMediaType);
local v5 = require(script.Parent.LogoTray);
local v6 = {
    [v4.Twitter] = "rbxasset://textures/ui/LuaApp/ExternalSite/twitter.png", 
    [v4.Facebook] = "rbxasset://textures/ui/LuaApp/ExternalSite/facebook.png", 
    [v4.Discord] = "rbxasset://textures/ui/LuaApp/ExternalSite/discord.png", 
    [v4.RobloxGroup] = "LuaApp/icons/GameDetails/social/RobloxGroup", 
    [v4.YouTube] = "rbxasset://textures/ui/LuaApp/ExternalSite/youtube.png", 
    [v4.Twitch] = "rbxasset://textures/ui/LuaApp/ExternalSite/twitch.png", 
    [v4.Amazon] = "rbxasset://textures/ui/LuaApp/ExternalSite/amazon.png", 
    [v4.Guilded] = "rbxasset://textures/ui/LuaApp/ExternalSite/guilded.png"
};
local function v7()
end;
local v8 = v2.PureComponent:extend("ExperienceLogoTray");
v8.validateProps = v3.strictInterface({
    layoutOrder = v3.optional(v3.integer), 
    socialLinks = v3.table, 
    linking = v3.table, 
    openLeaveRobloxAlertUIBlox = v3.callback, 
    closeAlert = v3.callback
});
v8.defaultProps = {
    openLeaveRobloxAlertUIBlox = v7, 
    closeAlert = v7
};
v8.init = function(v9)
    v9.createItems = function(v10)
        local v11 = {};
        local v12 = {};
        for _, v14 in ipairs(v10) do
            local l_type_0 = v14.type;
            if v6[l_type_0] ~= nil then
                table.insert(v11, {
                    key = l_type_0, 
                    logo = v6[l_type_0]
                });
                v12[l_type_0] = v14.url;
            end;
        end;
        return v11, v12;
    end;
    local function _(v16, v17)
        return function()
            local l_v17_0 = v17;
            if v16 == v4.Twitter then
                local v19 = v17:match("twitter.com/+([a-zA-Z0-9_]+)/*");
                if v19 ~= nil then
                    l_v17_0 = "twitter://user?screen_name=" .. v19;
                end;
            end;
            local l_linking_0 = v9.props.linking;
            l_linking_0:openURL(l_v17_0):andThen(function(v21)
                if v21 == false then
                    l_linking_0:openURL(v17);
                end;
            end);
            v9.props.closeAlert();
        end;
    end;
    v9.getItemClickCallback = function(v23)
        return function(v24)
            local v25 = v23[v24];
            v9.props.openLeaveRobloxAlertUIBlox(function()
                local l_v25_0 = v25;
                if v24 == v4.Twitter then
                    local v27 = v25:match("twitter.com/+([a-zA-Z0-9_]+)/*");
                    if v27 ~= nil then
                        l_v25_0 = "twitter://user?screen_name=" .. v27;
                    end;
                end;
                local l_linking_1 = v9.props.linking;
                l_linking_1:openURL(l_v25_0):andThen(function(v29)
                    if v29 == false then
                        l_linking_1:openURL(v25);
                    end;
                end);
                v9.props.closeAlert();
            end);
        end;
    end;
end;
v8.render = function(v30)
    local v31, v32 = v30.createItems(v30.props.socialLinks);
    return v2.createElement(v5, {
        layoutOrder = 1, 
        itemList = v31, 
        handleItemClick = v30.getItemClickCallback(v32)
    });
end;
return v8;
