local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameProductInfoRodux");
local l_Immutable_0 = require(l_script_FirstAncestor_0.Parent.AppCommonLib).Immutable;
local v2 = require(l_script_FirstAncestor_0.SetGamesProductInfo);
local _ = require(l_script_FirstAncestor_0.GameProductInfo);
return {
    key = "GamesProductInfoKey", 
    reducer = function(v4, v5)
        v4 = v4 or {};
        assert(v4, "");
        if v5.type == v2.name then
            v4 = l_Immutable_0.JoinDictionaries(v4, v5.gamesProductInfo);
        end;
        return v4;
    end
};
