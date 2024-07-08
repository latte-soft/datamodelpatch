local _ = require(script.Parent.FocusNavigation);
local v1 = require(script.composeFocusBehaviors);
local function v3(v2)
    return {
        getTargets = function()
            if not v2 then
                return {};
            else
                return {
                    v2
                };
            end;
        end
    };
end;
local function v6()
    local v4 = nil;
    return {
        onDescendantFocusChanged = function(v5)
            v4 = v5 or v4;
        end, 
        getTargets = function()
            if not v4 then
                return {};
            else
                return {
                    v4
                };
            end;
        end
    };
end;
return {
    default = v3, 
    mostRecent = v6, 
    mostRecentOrDefault = function(v7)
        return v1(v6(), {
            getTargets = function()
                if not v7 then
                    return {};
                else
                    return {
                        v7
                    };
                end;
            end
        });
    end, 
    composeFocusBehaviors = v1
};
