local _ = game:GetService("CorePackages");
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableVRUpdate3");
local v2 = require(script.Parent.VRServiceWrapper);
return {
    GetUserCFrameWorldSpace = function(v3)
        local l_v2_UserCFrame_0 = v2:GetUserCFrame(v3);
        if not workspace.CurrentCamera.HeadLocked then
            l_v2_UserCFrame_0 = v2:GetUserCFrame(Enum.UserCFrame.Head):Inverse() * l_v2_UserCFrame_0;
        end;
        return workspace.CurrentCamera.CFrame * (CFrame.new(l_v2_UserCFrame_0.p * workspace.CurrentCamera.HeadScale) * (l_v2_UserCFrame_0 - l_v2_UserCFrame_0.p));
    end, 
    getCurrentControllerType = function()
        local v5 = not not l_game_EngineFeature_0 and v2.VRDeviceName or nil;
        local v6 = ((v5:match("Oculus") or v5:match("Meta")) or v5:match("OpenXr")) or v5:match("OpenXR");
        if not v5:match("Vive") then
            if not v5:match("Rift") then
                if not v5:match("Index") then
                    if not v6 then
                        return "Rift";
                    else
                        return "Touch";
                    end;
                else
                    return "Index";
                end;
            else
                return "Rift";
            end;
        else
            return "Vive";
        end;
    end
};
