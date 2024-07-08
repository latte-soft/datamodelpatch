local l_script_FirstAncestor_0 = script:FindFirstAncestor("GamePlayButton");
local _ = require(l_script_FirstAncestor_0.PlayButtonTypes);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v5 = require(l_Parent_0.RoactServiceTags);
local l_RoactAnalytics_0 = v5.RoactAnalytics;
local l_AppEventIngestService_0 = v5.AppEventIngestService;
local l_AppGame_0 = v5.AppGame;
local v9 = require(l_Parent_0.RoactUtils);
local l_useSelector_0 = v9.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v9.Hooks.RoactRodux.useDispatch;
local v12 = require(l_Parent_0.ExperienceAnalytics);
local l_gamePlayIntent_0 = v12.Events.gamePlayIntent;
local l_joinGamePlayButton_0 = v12.Points.joinGamePlayButton;
local v15 = require(l_Parent_0.GameVotesRodux);
local l_ReasonForNotVoteable_0 = v15.Enums.ReasonForNotVoteable;
local l_ClearUserGameVotes_0 = v15.UserGameVotes.ClearUserGameVotes;
local l_IsVRAppBuild_0 = require(l_Parent_0.AppCommonLib).IsVRAppBuild;
local l_SplashScreenManager_0 = require(l_Parent_0.SplashScreenManager).SplashScreenManager;
local l_LaunchGame_0 = require(l_Parent_0.GameLaunch).LaunchGame;
return function(v21, v22, v23, v24, v25)
    local v26 = l_useRoactService_0(l_RoactAnalytics_0);
    local v27 = l_useRoactService_0(l_AppEventIngestService_0);
    local v28 = l_useRoactService_0(l_AppGame_0);
    local v30 = l_useSelector_0(function(v29)
        return v29.UserGameVotes[v21];
    end);
    local v31 = l_useDispatch_0();
    return (v3.useCallback(function(v32)
        if v22 then
            if v32 ~= nil then
                v32();
            else
                l_gamePlayIntent_0(v27, "PlayButton", {
                    placeId = v22, 
                    rootPlaceId = tonumber(v22), 
                    referralSource = v23
                });
            end;
            l_joinGamePlayButton_0(v26.InfluxDb, "gamePlayIntent", {
                isUniversalApp = true, 
                referralSource = v23, 
                placeId = v22, 
                ctx = v24
            });
            if l_IsVRAppBuild_0() then
                l_SplashScreenManager_0.initialize(36);
                wait(0.3);
            end;
            l_LaunchGame_0(v22, v25, nil, v28);
            if v30 and v30.reasonForNotVoteable == l_ReasonForNotVoteable_0.PlayGame then
                v31(l_ClearUserGameVotes_0(v21));
            end;
            return ;
        else
            return ;
        end;
    end, {
        v27, 
        v26, 
        v28, 
        v30, 
        v21, 
        v22, 
        v23, 
        v24
    }));
end;
