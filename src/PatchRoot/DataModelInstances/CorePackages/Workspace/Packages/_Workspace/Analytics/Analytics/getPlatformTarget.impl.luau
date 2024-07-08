return function(v0)
    return function()
        local v1 = "unknownLua";
        local l_None_0 = Enum.Platform.None;
        pcall(function()
            l_None_0 = v0:GetPlatform();
        end);
        local v3 = true;
        if l_None_0 ~= Enum.Platform.Windows then
            v3 = l_None_0 == Enum.Platform.OSX;
        end;
        local v4 = true;
        if l_None_0 ~= Enum.Platform.IOS then
            v4 = l_None_0 == Enum.Platform.Android;
        end;
        v4 = v4 or l_None_0 == Enum.Platform.UWP;
        local v5 = true;
        if l_None_0 ~= Enum.Platform.XBox360 then
            v5 = l_None_0 == Enum.Platform.XBoxOne;
        end;
        local l_v5_0 = v5;
        if not l_v5_0 then
            l_v5_0 = true;
            if l_None_0 ~= Enum.Platform.PS3 then
                l_v5_0 = true;
                if l_None_0 ~= Enum.Platform.PS4 then
                    l_v5_0 = game:GetEngineFeature("PlatformEnumPS5") and l_None_0 == Enum.Platform.PS5;
                end;
            end;
        end;
        return if not v3 then v4 and "mobile" or ((l_v5_0 or l_None_0 == Enum.Platform.WiiU) and "console" or v1 .. tostring(l_None_0)) else "client";
    end;
end;
