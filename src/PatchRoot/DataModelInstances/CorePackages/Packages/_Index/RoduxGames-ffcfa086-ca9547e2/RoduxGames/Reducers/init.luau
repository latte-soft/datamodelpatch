local v0 = require(script:FindFirstAncestor("RoduxGames").Parent.Rodux);
local v1 = require(script.Games.playabilityByGameId);
local v2 = require(script.Games.productInfoByGameId);
local v3 = require(script.Games.byGameId);
local v4 = require(script.Games.mediaByGameId);
return function(v5)
    return v0.combineReducers({
        playabilityByGameId = v1(v5), 
        productInfoByGameId = v2(v5), 
        byGameId = v3(v5), 
        mediaByGameId = v4(v5)
    });
end;
