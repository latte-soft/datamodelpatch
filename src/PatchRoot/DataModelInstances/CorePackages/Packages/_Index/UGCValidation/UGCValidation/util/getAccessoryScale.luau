local l_HumanoidModelFromDescription_0 = game:GetService("Players"):CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15);
l_HumanoidModelFromDescription_0.Humanoid.BodyTypeScale.Value = 0;
l_HumanoidModelFromDescription_0.Humanoid.BodyProportionScale.Value = 0;
local v1 = {};
for _, v3 in pairs(l_HumanoidModelFromDescription_0:GetDescendants()) do
    if v3:IsA("BasePart") then
        for _, v5 in v3:GetChildren() do
            if v5:IsA("Attachment") then
                v1[v5.Name] = l_HumanoidModelFromDescription_0.Humanoid:GetBodyPartR15(v3);
            end;
        end;
    end;
end;
return function(v6, v7)
    return l_HumanoidModelFromDescription_0.Humanoid:GetAccessoryHandleScale(v6, v1[v7.Name]);
end;
