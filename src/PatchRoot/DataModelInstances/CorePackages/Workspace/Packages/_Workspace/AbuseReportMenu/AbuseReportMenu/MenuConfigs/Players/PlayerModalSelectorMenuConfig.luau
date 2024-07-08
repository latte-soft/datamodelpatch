local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.VerifiedBadges);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v5 = require(l_script_FirstAncestor_0.Components.Constants);
return {
    componentType = "modalSelector", 
    getIsVisible = function(_)
        return true;
    end, 
    getMenuItems = function(v7)
        return (v2.List.map(v7.playerObjects, function(v8)
            return {
                label = v8.DisplayName .. (not v3.isPlayerVerified(v8) and "" or v3.emoji.verified), 
                subLabel = "[@" .. v8.Name .. "]", 
                identifier = v8.Name
            };
        end));
    end, 
    getSelectedValue = function(v9)
        local l_allegedAbuser_0 = v9.allegedAbuser;
        if not l_allegedAbuser_0 then
            return nil;
        else
            return l_allegedAbuser_0.DisplayName .. "[@" .. l_allegedAbuser_0.Name .. "]";
        end;
    end, 
    onUpdateSelectedOption = function(v11, v12, v13, v14)
        if v11.identifier then
            local l_identifier_0 = v11.identifier;
            for _, v17 in v12.playerObjects, nil, nil do
                if l_identifier_0 == v17.Name then
                    local l_UserId_0 = v17.UserId;
                    v14.analyticsDispatch({
                        type = v5.AnalyticsActions.IncrementPersonChanged
                    });
                    v13({
                        type = v5.PlayerMenuActions.UpdateAbuser, 
                        abuseId = l_UserId_0, 
                        abuser = v17
                    });
                end;
            end;
        end;
    end, 
    fieldLabel = "Which Person?", 
    componentName = "PlayerSelector"
};
