local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.VerifiedBadges);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v5 = require(l_script_FirstAncestor_0.Components.Constants);
return {
    componentType = "dropdown", 
    getIsVisible = function(_)
        return true;
    end, 
    getMenuItems = function(v7)
        return (v2.List.map(v7.playerObjects, function(v8)
            return v8.DisplayName .. (not v3.isPlayerVerified(v8) and "" or v3.emoji.verified) .. "\n[@" .. v8.Name .. "]";
        end));
    end, 
    onUpdateSelectedOption = function(v9, v10, v11, v12)
        local v13 = string.find(v9, "@");
        if v13 ~= nil then
            local v14 = string.sub(v9, v13 + 1, -2);
            for _, v16 in v10.playerObjects, nil, nil do
                if v14 == v16.Name then
                    local l_UserId_0 = v16.UserId;
                    v12.analyticsDispatch({
                        type = v5.AnalyticsActions.IncrementPersonChanged
                    });
                    v11({
                        type = v5.PlayerMenuActions.UpdateAbuser, 
                        abuseId = l_UserId_0, 
                        abuser = v16
                    });
                end;
            end;
        end;
    end, 
    fieldLabel = "Which Person?", 
    componentName = "PlayerSelector"
};
