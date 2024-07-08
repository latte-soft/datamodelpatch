local v0 = require(script.Parent.Rodux);
local v1 = require(script.Parent.Parent.Cryo);
local v2 = require(script.Parent.buildActionName);
return function(v3)
    return function()
        return v0.createReducer({}, {
            [v2(v3)] = function(v4, v5)
                local v6 = {};
                if #v5.ids == 0 then
                    v6[v5.keymapper()] = v5.status;
                else
                    for _, v8 in ipairs(v5.ids) do
                        v6[v5.keymapper(v8)] = v5.status;
                    end;
                end;
                return v1.Dictionary.join(v4, v6);
            end
        });
    end;
end;
