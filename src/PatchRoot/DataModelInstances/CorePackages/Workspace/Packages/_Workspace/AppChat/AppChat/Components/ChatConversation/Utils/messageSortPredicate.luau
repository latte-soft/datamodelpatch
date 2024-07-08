local function _(v0)
    local v1 = false;
    if v0.order ~= nil then
        v1 = not v0.moderated and not v0.failed;
    end;
    return v1;
end;
return function(v3, v4)
    if not v3.order or not v4.order then
        local v5 = false;
        if v3.order ~= nil then
            v5 = not v3.moderated and not v3.failed;
        end;
        if not v5 then
            v5 = false;
            if v4.order ~= nil then
                v5 = not v4.moderated and not v4.failed;
            end;
            if not v5 then
                if not (not v3.sent or not v4.sent) and v3.sent:GetUnixTimestamp() ~= v4.sent:GetUnixTimestamp() then
                    return v3.sent:GetUnixTimestamp() < v4.sent:GetUnixTimestamp();
                else
                    v5 = true;
                    if v4.moderated ~= true then
                        v5 = v4.failed == true;
                    end;
                    return v5;
                end;
            end;
        end;
        v5 = false;
        if v4.order ~= nil then
            v5 = not v4.moderated and not v4.failed;
        end;
        return v5;
    else
        return v3.order < v4.order;
    end;
end;
