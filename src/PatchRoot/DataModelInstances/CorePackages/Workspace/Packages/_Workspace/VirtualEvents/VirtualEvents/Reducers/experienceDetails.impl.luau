local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.Rodux);
local _ = require(l_script_FirstAncestor_0.Models.ExperienceDetailsModel);
return function(v4)
    return (v2.createReducer({}, {
        [v4.GetExperiencesDetails.Succeeded.name] = function(v5, v6)
            return v1.Dictionary.join(v5, {
                [v6.ids[1]] = v6.responseBody.data[1]
            });
        end, 
        [v4.GetExperiencesDetails.Failed.name] = function(v7, _)
            return v7;
        end
    }));
end;
