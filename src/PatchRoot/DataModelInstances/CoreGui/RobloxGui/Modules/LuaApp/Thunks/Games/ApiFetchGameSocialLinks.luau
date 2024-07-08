local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Actions.Games.SetGameSocialLinks);
local v2 = require(l_Modules_0.LuaApp.Http.Requests.GamesApi.GamesGetSocialLinks);
local v3 = require(l_Modules_0.LuaApp.Models.GamesApi.GameSocialLink);
local v4 = require(l_Modules_0.LuaApp.Enum.SocialMediaType);
local _ = function(v5)
    for _, v7 in pairs(v4) do
        if v5 == v7 then
            return true;
        end;
    end;
    return false;
end;
return function(v9, v10)
    return function(v11)
        return v2(v9, v10):andThen(function(v12)
            local l_data_0 = v12.responseBody.data;
            local v14 = {};
            local v15 = nil;
            for _, v17 in ipairs(l_data_0) do
                local v18 = v3.fromJsonData(v17);
                local l_type_0 = v18.type;
                local v20;
                for _, v22 in pairs(v4) do
                    if l_type_0 == v22 then
                        v20 = true;
                        goto label0 --[[  true, false  ]];
                    end;
                end;
                v20 = false;
                ::label0::;
                if v20 then
                    if v18.type == v4.RobloxGroup then
                        if v15 then
                            warn("Detected multiple " .. v18.type .. " links for universe " .. v10 .. "");
                        else
                            v15 = v18;
                        end;
                    else
                        table.insert(v14, v18);
                    end;
                else
                    warn("Can NOT recognize " .. v18.type .. " as a valid Social Link Type");
                end;
            end;
            v11:dispatch(v1(v10, {
                externalLinks = v14, 
                groupLink = v15
            }));
        end);
    end;
end;
