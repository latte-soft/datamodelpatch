local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.Dash);
local v5 = require(l_CorePackages_0.Packages.t);
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local v7 = require(l_CorePackages_0.Workspace.Packages.GamePlayButton);
local l_usePlayButtonState_0 = v7.usePlayButtonState;
local l_useOnPlayButtonCallback_0 = v7.useOnPlayButtonCallback;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v12 = require(l_Modules_0.LuaApp.Common.wrapComponent);
local v13 = require(l_Modules_0.AvatarExperience.Flags.FFlagEnableAttributionItemRow);
return {
    connect = function(v14, v15)
        return function(v16)
            local v17 = v2.PureComponent:extend("LaunchExperienceConnector(" .. tostring(v16) .. ")");
            v17.validateProps = v5.interface({
                componentProps = v5.table, 
                universeId = v5.string, 
                launchSource = v5.optional(v5.string), 
                eventContext = v5.optional(v5.string), 
                referralSource = v5.optional(v5.string), 
                fetchDelayInSeconds = v5.optional(v5.number)
            });
            v17.init = function(v18)
                v18.onPlayButtonActivated = function(v19, v20)
                    v18.props.onPlayButtonCallback(v19 or v18.props.playButtonState, v20);
                end;
            end;
            v17.render = function(v21)
                return v2.createElement(v16, v4.assign({}, v21.props.componentProps, v15({
                    playabilityStatus = v21.props.playabilityStatus, 
                    playButtonState = v21.props.playButtonState, 
                    onPlayButtonActivated = v21.onPlayButtonActivated, 
                    gameName = if not v13 then nil else v21.props.gameName, 
                    fetchDelayInSeconds = v21.props.fetchDelayInSeconds
                }, v21.props.componentProps)));
            end;
            local l_v17_0 = v17;
            return v12(function(v23, v24)
                local v25 = v14(v24);
                return v2.createElement(v23, {
                    componentProps = v24, 
                    universeId = v25.universeId, 
                    launchSource = v25.launchSource, 
                    eventContext = v25.eventContext, 
                    referralSource = v25.referralSource, 
                    fetchDelayInSeconds = v25.fetchDelayInSeconds
                });
            end)((v3.connect(function(v26, v27)
                local v28 = v26.GameDetails[v27.universeId];
                local v29 = v26.Games[v27.universeId];
                return {
                    gameName = (not not v28 and v28.name or v29 and v29.name) or nil
                };
            end)(function(v30)
                local v31 = l_usePlayButtonState_0(l_useRoactService_0(l_RoactNetworking_0), v30.universeId, v30.fetchDelayInSeconds);
                return v2.createElement(l_v17_0, (v1.Dictionary.join(v30, {
                    onPlayButtonCallback = l_useOnPlayButtonCallback_0(v30.universeId, v30.referralSource, v30.eventContext or "PlayButton", nil, v30.launchSource or "UnknownLaunchSource"), 
                    playButtonState = v31.playButtonState, 
                    playabilityStatus = v31.playabilityStatus
                })));
            end)));
        end;
    end
};
