local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAvatarSettings);
local v2 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetDefaultBodyColors);
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetExtendedBodyColors);
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetDefaultBodyColorRanges);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v6 = require(l_Modules_0.AvatarExperience.Flags.ColorPickerSliderIXPTest);
local l_game_EngineFeature_0 = game:GetEngineFeature("ClientAvatarUsesColor3sForBodyParts");
local v8 = require(l_Modules_0.AvatarExperience.Common.Util.IXPUtils);
return function(v9)
    return function(v10)
        v10:dispatch(v1(v9.minimumDeltaEBodyColorDifference, v9.scales));
        if not v8.readTestVariable(v6.EnabledForUser) then
            local l_basicBodyColorsPalette_0 = v9.basicBodyColorsPalette;
            if l_basicBodyColorsPalette_0 then
                v10:dispatch(v2(l_basicBodyColorsPalette_0));
            end;
        else
            v10:dispatch(v4(v5.DefaultBodyColorRanges));
            if not l_game_EngineFeature_0 then
                local l_basicBodyColorsPalette_1 = v9.basicBodyColorsPalette;
                if l_basicBodyColorsPalette_1 then
                    v10:dispatch(v2(l_basicBodyColorsPalette_1));
                end;
            end;
        end;
        if l_game_EngineFeature_0 then
            v10:dispatch(v3(v9.bodyColorsPalette));
        end;
    end;
end;
