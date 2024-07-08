local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_IXPService_0 = game:GetService("IXPService");
local v4 = require(l_CorePackages_0.Cryo);
local v5 = require(l_Modules_0.LuaApp.Thunks.Networking.Util.PerformFetch);
local v6 = require(l_Modules_0.LuaApp.Http.Requests.GetIAExperiencesContinue);
local v7 = require(l_Modules_0.LuaApp.Models.GamesApi.Game);
local v8 = require(l_Modules_0.LuaApp.Constants);
local v9 = require(l_Modules_0.Personalization.OmniFeed.OmniFeedConstants);
local v10 = require(l_Modules_0.LuaApp.Actions.Games.AddGames);
local l_ApiFetchGameIcons_0 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux).GameIcons.ApiFetchGameIcons;
local v12 = require(l_Modules_0.Personalization.Games.DataStore.AddTopicContents);
local v13 = require(l_Modules_0.Personalization.Games.DataStore.TopicContentsModel);
local v14 = require(l_Modules_0.LuaApp.Thunks.Omni.ApiFetchOmniRecommendations);
local v15 = require(l_Modules_0.LuaApp.Thunks.WaitUntilIXPUserInit);
local v16 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v17 = require(l_Modules_0.Personalization.Flags.GetFFlagLuaAppFullRefreshOmniRecOnGameExit);
local v18 = require(l_Modules_0.Personalization.Flags.GetFFlagLuaAppFullRefreshOmniRecOnGameExitIXP);
local function v35(v19, v20)
    return v5.Single("IAPanelExperiences.continue", function(v21)
        return v6(v19):andThen(function(v22)
            local l_responseBody_0 = v22.responseBody;
            local l_Games_0 = v21:getState().Games;
            if l_responseBody_0 ~= nil and l_responseBody_0.experiences ~= nil then
                local v25 = {
                    hasMoreRows = l_responseBody_0.hasMoreRows, 
                    entries = {}
                };
                local v26 = {};
                local v27 = {};
                for _, v29 in pairs(l_responseBody_0.experiences) do
                    v7.fromExperienceData(v29):match(function(v30)
                        local l_universeId_0 = v30.universeId;
                        local v32 = nil;
                        if l_Games_0[l_universeId_0] == nil then
                            v26[l_universeId_0] = v30;
                            table.insert(v27, l_universeId_0);
                            v32 = v30;
                        else
                            v32 = v4.Dictionary.join(v30, l_Games_0[l_universeId_0]);
                        end;
                        v32.contentType = v8.OmniRecommendationsContentType.Game;
                        v32.contentId = l_universeId_0;
                        table.insert(v25.entries, v32);
                    end);
                end;
                if next(v26) then
                    v21:dispatch(v10(v26));
                end;
                if #v27 > 0 then
                    v21:dispatch(l_ApiFetchGameIcons_0(v19, v27));
                end;
                if #v25.entries > 0 then
                    local v33 = v13.new();
                    v33.entries = v25.entries;
                    v33.hasMoreRows = v25.hasMoreRows;
                    v33.updatedTimestamp = tick();
                    v21:dispatch(v12(v20, v33));
                end;
            end;
        end):catch(function(v34)
            warn("We failed to get continue experiences", v34);
        end);
    end);
end;
local function v40(v36, v37, v38)
    return v38:dispatch(v14(v36, v37, v8.OmniRecommendationsPageType.PAGE_TYPE_HOME, nil, nil, v9.OmniRecommendationsRequestIntent.GameExit)):catch(function(v39)
        warn("We failed to refresh omni recommendations on game exit", v39);
    end);
end;
return function(v41, v42)
    return function(v43)
        if not v17() then
            return v43:dispatch(v35(v41, v9.GameGridTopicIds.Continue));
        elseif not v18() then
            return v40(v41, v42, v43);
        else
            return v43:dispatch(v15(l_IXPService_0, not not l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or 0)):andThen(function()
                if not l_IXPService_0:GetUserLayerVariables(v16.HomeOmniFeedLayer).IsFullOmniRecRefreshOnGameExitEnabled then
                    return v43:dispatch(v35(v41, v9.GameGridTopicIds.Continue));
                else
                    return v40(v41, v42, v43);
                end;
            end);
        end;
    end;
end;
