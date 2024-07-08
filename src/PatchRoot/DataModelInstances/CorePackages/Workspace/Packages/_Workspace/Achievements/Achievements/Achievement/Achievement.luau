local l_script_FirstAncestor_0 = script:FindFirstAncestor("Achievements");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local _ = require(l_Parent_0.LuauPolyfill);
local _ = require(l_Parent_0.Signal);
local v5 = require(script.Parent.AchievementRules);
local v6 = require(l_Parent_0.AwardProtocol);
local l_default_0 = v6.AwardProtocol.default;
local v8 = require(l_script_FirstAncestor_0.Logger);
local v9 = {
    NAMES = v6.AWARD_NAMES
};
local v10 = game:DefineFastFlag("CacheHasAchieved", false);
v9._init = function(v11, v12, v13, v14)
    v11.awardProtocol = v14 or l_default_0;
    v11.awardName = v12;
    v11.achievementRule = v5[v12];
    v11.achievementAwardedCallbacks = {};
    assert(v11.achievementRule, "Achievement rule not found for " .. tostring(v12));
    if not v10 then
        v11:hasAchieved():andThen(function(v15)
            if not v15 then
                v11.achievementDataSubscription = v13:subscribe(function(v16)
                    if v11.achievementRule(v16) then
                        v11:grantAchievement();
                    end;
                end);
            end;
        end):catch(function(v17)
            v8:warning("There was an issue checking " .. v12 .. " has been achieved with error: " .. tostring(v17));
        end);
    else
        v11.hasAchievedCache = nil;
        local v18, v19 = v11:hasAchieved():awaitStatus();
        if v18 == "Resolved" then
            v11.hasAchievedCache = v19;
            if not v11.hasAchievedCache then
                v11.achievementDataSubscription = v13:subscribe(function(v20)
                    if v11.achievementRule(v20) then
                        v11:grantAchievement();
                    end;
                end);
                return ;
            end;
        else
            v8:warning("There was an issue checking " .. v12 .. " has been achieved with error: " .. tostring(v19));
            return ;
        end;
    end;
end;
v9.hasAchieved = function(v21)
    if not v10 then
        return v21.awardProtocol:isAvailable():andThen(function(v22)
            if not v22 then
                return v2.reject("AwardProtocol is not available to grant achievement: " .. v21.awardName);
            else
                return v21.awardProtocol:hasAchievedAward(v21.awardName);
            end;
        end);
    elseif v21.hasAchievedCache == nil then
        return v21.awardProtocol:isAvailable():andThen(function(v23)
            if not v23 then
                return v2.reject("AwardProtocol is not available to grant achievement: " .. v21.awardName);
            else
                return v21.awardProtocol:hasAchievedAward(v21.awardName);
            end;
        end);
    else
        return v2.resolve(v21.hasAchievedCache);
    end;
end;
v9.registerOnAchievementAwardedListener = function(v24, v25)
    v24.achievementAwardedCallbacks[v25] = v25;
    return {
        unsubscribe = function()
            v24.achievementAwardedCallbacks[v25] = nil;
        end
    };
end;
v9.grantAchievement = function(v26)
    return v26:_tryAwardAchievement(v26.awardName);
end;
v9._tryAwardAchievement = function(v27, v28)
    return v27:hasAchieved():andThen(function(v29)
        return v29 or v27.awardProtocol:grantAward(v28);
    end):andThen(function(v30)
        if v30 then
            if v10 then
                v27.hasAchievedCache = true;
            end;
            v27.achievementDataSubscription:unsubscribe();
            for _, v32 in v27.achievementAwardedCallbacks, nil, nil do
                v32(v28);
            end;
        end;
    end):catch(function(v33)
        v8:warning("There was an issue granting " .. v28 .. " with error: " .. tostring(v33));
        return false;
    end);
end;
v9.new = function(v34, v35, v36)
    local v37 = {};
    setmetatable(v37, {
        __index = v9
    });
    v37:_init(v34, v35, v36);
    return v37;
end;
v9.newWithRefresher = function(v38, v39, v40, v41)
    local v42 = v9.new(v38, v39, v41);
    v42:hasAchieved():andThen(function(v43)
        if not v43 then
            v40:start();
            v42:registerOnAchievementAwardedListener(function()
                v40:stop();
            end);
        end;
    end, function(v44)
        v8:warning(v44);
    end);
    return v42;
end;
return v9;
