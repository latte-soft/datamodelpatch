local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameIconRodux");
local v1 = require(l_script_FirstAncestor_0.GamesGetIcons);
local v2 = require(l_script_FirstAncestor_0.BigGameIcons.SetBigGameIcons);
local v3 = require(l_script_FirstAncestor_0.BigGameIcons.BigGameIconReducer);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_Parent_0.Promise);
local l_ApiFetchThumbnails_0 = require(l_Parent_0.Http).Utils.ApiFetchThumbnails;
return function(v7, v8, v9)
    return function(v10)
        local v11 = v10:getState()[v3.key];
        local v12 = {};
        for _, v14 in pairs(v8) do
            if v11[v14] == nil then
                table.insert(v12, v14);
            end;
        end;
        if #v12 == 0 then
            return v5.resolve();
        else
            return l_ApiFetchThumbnails_0.Fetch(v7, v12, v9 or "512x512", "Game", v1, v2, v10);
        end;
    end;
end;
