local l_Cryo_0 = require(game:GetService("CorePackages").InGameMenuDependencies).Cryo;
local l_Parent_0 = script.Parent;
local v2 = require(l_Parent_0.Actions.SetMenuOpen);
local v3 = require(l_Parent_0.Actions.SetMainPageMoreMenuOpen);
local v4 = require(l_Parent_0.Actions.SetCurrentPage);
local v5 = require(l_Parent_0.Actions.SetScreenSize);
local v6 = require(l_Parent_0.Actions.StartLeavingGame);
local v7 = require(l_Parent_0.Actions.CancelLeavingGame);
local v8 = require(l_Parent_0.Actions.SetControlLayout);
local v9 = require(l_Parent_0.Actions.SetVideoRecording);
local v10 = require(l_Parent_0.Actions.SetRespawning);
local v11 = require(l_Parent_0.Actions.SetCurrentZone);
local v12 = require(l_Parent_0.Actions.SetControllerBarHeight);
local v13 = require(l_Parent_0.Actions.DecrementControllerBar);
local v14 = require(l_Parent_0.Actions.IncrementControllerBar);
local v15 = require(script.navigationReducer);
local v16 = require(script.respawn);
local v17 = require(script.invites);
local v18 = require(script.gameInfo);
local v19 = require(script.report);
local v20 = require(script.friends);
local v21 = require(script.displayOptions);
local v22 = require(script.nativeClosePrompt);
local v23 = require(l_Parent_0.Parent.VoiceChat.Reducers.voiceState);
local v24 = require(l_Parent_0.Flags.FFlagRecordRecording);
local v25 = require(l_Parent_0.Resources.Constants);
local v26 = require(l_Parent_0.Resources.Controls);
local v55 = {
    [v2.name] = function(v27, v28)
        local v29 = nil;
        if not v28.isMenuOpen then
            v29 = false;
        end;
        return l_Cryo_0.Dictionary.join(v27, {
            isMenuOpen = v28.isMenuOpen, 
            isMainPageMoreMenuOpen = v29, 
            currentZone = v27.isMenuOpen ~= v28.isMenuOpen and 1 or nil
        });
    end, 
    [v3.name] = function(v30, v31)
        return l_Cryo_0.Dictionary.join(v30, {
            isMainPageMoreMenuOpen = v31.isMainPageMoreMenuOpen
        });
    end, 
    [v6.name] = function(v32, _)
        return l_Cryo_0.Dictionary.join(v32, {
            leavingGame = true
        });
    end, 
    [v7.name] = function(v34, _)
        return l_Cryo_0.Dictionary.join(v34, {
            leavingGame = false
        });
    end, 
    [v4.name] = function(v36, v37)
        return l_Cryo_0.Dictionary.join(v36, {
            menuPage = v37.newPage, 
            isMainPageMoreMenuOpen = false, 
            currentZone = v37.newPage == v25.InitalPageKey and 0 or 1
        });
    end, 
    [v8.name] = function(v38, v39)
        return l_Cryo_0.Dictionary.join(v38, {
            controlLayout = v39.controlLayout
        });
    end, 
    [v5.name] = function(v40, v41)
        return l_Cryo_0.Dictionary.join(v40, {
            screenSize = v41.newScreenSize
        });
    end, 
    [v9.name] = not not v24 and function(v42, v43)
        return l_Cryo_0.Dictionary.join(v42, {
            recording = v43.recording
        });
    end or nil, 
    [v10.name] = function(v44, v45)
        local _ = nil;
        return l_Cryo_0.Dictionary.join(v44, {
            isMainPageMoreMenuOpen = if not v45.respawning then v44.isMainPageMoreMenuOpen else false
        });
    end, 
    [v11.name] = function(v47, v48)
        return l_Cryo_0.Dictionary.join(v47, {
            currentZone = v48.zone
        });
    end, 
    [v12.name] = function(v49, v50)
        return l_Cryo_0.Dictionary.join(v49, {
            controllerBarHeight = v50.controllerBarHeight
        });
    end, 
    [v14.name] = function(v51, _)
        return l_Cryo_0.Dictionary.join(v51, {
            controllerBarCount = v51.controllerBarCount + 1
        });
    end, 
    [v13.name] = function(v53, _)
        return l_Cryo_0.Dictionary.join(v53, {
            controllerBarCount = v53.controllerBarCount - 1
        });
    end
};
return function(v56, v57)
    if v56 == nil then
        v56 = {
            controlLayout = v26.ControlLayouts.KEYBOARD, 
            isMenuOpen = false, 
            leavingGame = false, 
            currentZone = nil, 
            menuPage = v25.defaultPageKey, 
            voiceState = nil, 
            invites = v17(nil, v57), 
            respawn = v16(nil, v57), 
            gameInfo = v18(nil, v57), 
            friends = v20(nil, v57), 
            displayOptions = v21(nil, v57), 
            screenSize = Vector2.new(0, 0), 
            recording = false, 
            isMainPageMoreMenuOpen = false, 
            nativeClosePrompt = v22(nil, v57), 
            controllerBarHeight = 0, 
            controllerBarCount = 0
        };
    end;
    local v58 = v55[v57.type];
    if v58 ~= nil then
        v56 = v58(v56, v57);
    end;
    v56 = v15(v56, v57);
    v56.respawn = v16(v56.respawn, v57);
    v56.invites = v17(v56.invites, v57);
    v56.voiceState = v23(v56.voiceState, v57);
    v56.gameInfo = v18(v56.gameInfo, v57);
    v56.report = v19(v56.report, v57);
    v56.friends = v20(v56.friends, v57);
    v56.displayOptions = v21(v56.displayOptions, v57);
    v56.nativeClosePrompt = v22(v56.nativeClosePrompt, v57);
    return v56;
end;
