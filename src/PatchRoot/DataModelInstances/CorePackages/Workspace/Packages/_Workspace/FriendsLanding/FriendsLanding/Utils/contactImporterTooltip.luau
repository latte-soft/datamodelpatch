local v0 = require(script:FindFirstAncestor("FriendsLanding").Common.Constants);
local l_game_EngineFeature_0 = game:GetEngineFeature(v0.TOOLTIP_GAME_ENGINE_FEATURE);
return {
    getKey = function(v2)
        if l_game_EngineFeature_0 then
            local l_status_0, l_result_0 = pcall(function()
                return v2:GetItem(v0.TOOLTIP_APP_STORAGE_KEY);
            end);
            if not l_status_0 then
                return false;
            else
                return l_result_0 == "true";
            end;
        else
            return true;
        end;
    end, 
    updateKey = function(v5, v6)
        if l_game_EngineFeature_0 then
            pcall(function()
                v5:SetItem(v0.TOOLTIP_APP_STORAGE_KEY, (tostring(v6)));
                v5:Flush();
            end);
            return ;
        else
            return ;
        end;
    end
};
