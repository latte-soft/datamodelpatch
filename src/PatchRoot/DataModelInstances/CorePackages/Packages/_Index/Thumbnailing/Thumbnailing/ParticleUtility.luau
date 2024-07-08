local v1 = {
    InstanceIsAParticleEffect = function(v0)
        return ((v0:IsA("ParticleEmitter") or v0:IsA("Fire")) or v0:IsA("Smoke")) or v0:IsA("Sparkles");
    end
};
local function v2(v3)
    if v1.InstanceIsAParticleEffect(v3) then
        v3:FastForward(240);
    end;
    for _, v5 in (v3:GetChildren()), nil, nil do
        v2(v5);
    end;
end;
v1.FastForwardParticles = function(v6)
    v2(v6);
end;
return v1;
