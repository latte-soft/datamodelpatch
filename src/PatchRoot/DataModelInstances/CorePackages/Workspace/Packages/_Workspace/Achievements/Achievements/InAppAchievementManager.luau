local l_script_FirstAncestor_0 = script:FindFirstAncestor("Achievements");
local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Signal);
local v4 = require(l_script_FirstAncestor_0.Achievement.Achievement);
local v5 = require(l_script_FirstAncestor_0.Logger);
local l_LoginStatus_0 = require(l_Parent_0.RobloxAppEnums).LoginStatus;
local v7 = require(l_Parent_0.HttpRequest);
local v8 = require(l_Parent_0.Promise);
local v9 = require(l_Parent_0.Dash);
local v10 = require(l_script_FirstAncestor_0.Requests.GetXboxLoginConsecutiveDays);
local v11 = require(l_script_FirstAncestor_0.AchievementDataRefresher.VoteCountRefresher);
local v15 = v7.config({
    requestFunction = function(v12, v13, v14)
        return v7.requestFunctions.HttpRbxApi(v12, v13, v14);
    end
});
local v16 = nil;
pcall(function()
    v16 = game:GetService("PlatformCloudStorageService");
end);
local v39 = {
    startUp = function(v17)
        local v18, v19 = v3.createReadableSignal(0);
        local v20, v21 = v3.createReadableSignal(0);
        v11:init(v19, v17.store, v17.requestImpl, v17.platformCloudStorageService);
        v17.awardPollster = v4.new(v4.NAMES.AWARD_POLLSTER, v18);
        v17.awardPollster:hasAchieved():andThen(function(v22)
            if not v22 then
                v11:start();
                v17.awardPollster:registerOnAchievementAwardedListener(function()
                    v11:stop();
                end);
            end;
        end, function(v23)
            v5:warning(v23);
        end);
        v17.award3DayRoll = v4.new(v4.NAMES.AWARD_3_DAY_ROLL, v20);
        v17.award10DayRoll = v4.new(v4.NAMES.AWARD_10_DAY_ROLL, v20);
        v17.award20DayRoll = v4.new(v4.NAMES.AWARD_20_DAY_ROLL, v20);
        v17:_checkDayRollAchievements(v21);
        v17:_setupOneNameManyFacesAward();
    end, 
    shutDown = function(v24)
        v24.awardPollster = nil;
        v24.award3DayRoll = nil;
        v24.award10DayRoll = nil;
        v24.award20DayRoll = nil;
        v11:stop();
        if not (not v24.saveAvatarCompletedConnection or not v24.saveAvatarCompletedConnection.Connected) then
            v24.saveAvatarCompletedConnection:Disconnect();
            v24.saveAvatarCompletedConnection = nil;
        end;
    end, 
    _checkDayRollAchievements = function(v25, v26)
        v8.all(v25.award3DayRoll:hasAchieved(), v25.award10DayRoll:hasAchieved(), v25.award20DayRoll:hasAchieved()):andThen(function(v27)
            if v9.some(v27, function(v28, _)
                return v28 == false;
            end) then
                v10(v25.requestImpl):andThen(function(v30)
                    if v30.responseBody == nil then
                        v5:warning("Response body is empty.");
                        return ;
                    else
                        local l_count_0 = v30.responseBody.count;
                        if l_count_0 == nil then
                            v5:warning("Day count is missing.");
                            return ;
                        else
                            v26(l_count_0);
                            return ;
                        end;
                    end;
                end);
                return ;
            else
                return ;
            end;
        end):catch(function(v32)
            v5:warning(v32);
        end);
    end, 
    _setupOneNameManyFacesAward = function(v33)
        local v34, v35 = v3.createReadableSignal(false);
        v4.new(v4.NAMES.AWARD_ONE_NAME_MANY_FACES, v34):hasAchieved():andThen(function(v36)
            if not v36 then
                v33.saveAvatarCompletedConnection = v33.avatarEditorService.PromptSaveAvatarCompleted:Connect(function(v37)
                    if v37 == Enum.AvatarPromptResult.Success then
                        v35(true);
                        v33.saveAvatarCompletedConnection:Disconnect();
                        v33.saveAvatarCompletedConnection = nil;
                    end;
                end);
            end;
        end, function(v38)
            v5:warning(v38);
        end);
    end
};
v39.new = function(v40, v41, v42, v43)
    local v44 = setmetatable({
        store = v40, 
        requestImpl = v41 or v15, 
        avatarEditorService = v42 or l_AvatarEditorService_0, 
        platformCloudStorageService = v43 or v16
    }, {
        __index = v39
    });
    v40.changed:connect(function(v45, v46)
        local v47 = if not v45.AuthenticationStatus then l_LoginStatus_0.UNKNOWN else v45.AuthenticationStatus.status;
        if v47 ~= if not v46.AuthenticationStatus then l_LoginStatus_0.UNKNOWN else v46.AuthenticationStatus.status then
            if v47 == l_LoginStatus_0.LOGGED_IN then
                v44:startUp();
                return ;
            elseif v47 == l_LoginStatus_0.LOGGED_OUT then
                v44:shutDown();
            end;
        end;
    end);
    return v44;
end;
return v39;
