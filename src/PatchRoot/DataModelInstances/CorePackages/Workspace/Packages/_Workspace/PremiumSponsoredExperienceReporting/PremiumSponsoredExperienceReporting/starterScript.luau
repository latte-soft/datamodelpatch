local v0 = require(script.Parent.Flags);
local l_GetFStringPremiumSponsoredExperienceInstances_0 = v0.GetFStringPremiumSponsoredExperienceInstances;
local v2 = v0.GetFIntPremiumSponsoredExperienceWaitTimeSeconds();
local l_default_0 = require(script.Parent.Parent.LoggingProtocol).default;
local v4 = require(script.Parent.TelemetryConfig);
local l_Players_0 = game:GetService("Players");
local function v11(v6, v7)
    local l_Name_0 = v6.Name;
    local l_Video_0 = v6.Video;
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if l_LocalPlayer_0 ~= nil then
        l_default_0:logRobloxTelemetryEvent(v4, nil, {
            place_id = tostring(game.PlaceId), 
            universe_id = tostring(game.GameId), 
            user_id = tostring(l_LocalPlayer_0.UserId), 
            video_asset_id = l_Video_0, 
            instance_name = l_Name_0, 
            event_type = v7
        });
    end;
end;
local function v17(v12)
    local l_game_0 = game;
    for _, v15 in ipairs(v12:split(".")) do
        l_game_0 = l_game_0:WaitForChild(v15, v2);
        if not l_game_0 then
            error("Could not find child " .. tostring(v15) .. " in " .. v12);
        end;
    end;
    local l_ClassName_0 = l_game_0.ClassName;
    if l_ClassName_0 ~= "VideoFrame" then
        error("Expected VideoFrame at " .. v12 .. ", got " .. l_ClassName_0);
    end;
    return l_game_0;
end;
local function v23(v18)
    local v19 = v17(v18);
    local v20 = false;
    local v21 = false;
    if not v19.Playing then
        v19.Played:Connect(function()
            if not v20 then
                v11(v19, "VideoStart");
                v20 = true;
            end;
        end);
    else
        v11(v19, "VideoStart");
        v20 = true;
    end;
    local function v22()
        if not v21 then
            v11(v19, "VideoEnd");
            v21 = true;
        end;
    end;
    v19.Ended:Connect(v22);
    v19.DidLoop:Connect(v22);
end;
return function()
    local v24 = tostring(game.PlaceId);
    for _, v26 in ipairs(l_GetFStringPremiumSponsoredExperienceInstances_0():split(",")) do
        local v27, v28 = unpack(v26:split(":"));
        if v27 == v24 then
            spawn(function()
                v23(v28);
            end);
        end;
    end;
end;
