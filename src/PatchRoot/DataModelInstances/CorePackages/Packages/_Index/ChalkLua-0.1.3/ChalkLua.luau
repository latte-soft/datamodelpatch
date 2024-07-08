local v0 = {
    modifier = {
        reset = {
            0, 
            0
        }, 
        bold = {
            1, 
            22
        }, 
        dim = {
            2, 
            22
        }, 
        italic = {
            3, 
            23
        }, 
        underline = {
            4, 
            24
        }, 
        overline = {
            53, 
            55
        }, 
        inverse = {
            7, 
            27
        }, 
        hidden = {
            8, 
            28
        }, 
        strikethrough = {
            9, 
            29
        }
    }, 
    color = {
        black = {
            30, 
            39
        }, 
        red = {
            31, 
            39
        }, 
        green = {
            32, 
            39
        }, 
        yellow = {
            33, 
            39
        }, 
        blue = {
            34, 
            39
        }, 
        magenta = {
            35, 
            39
        }, 
        cyan = {
            36, 
            39
        }, 
        white = {
            37, 
            39
        }, 
        blackBright = {
            90, 
            39
        }, 
        gray = {
            90, 
            39
        }, 
        grey = {
            90, 
            39
        }, 
        redBright = {
            91, 
            39
        }, 
        greenBright = {
            92, 
            39
        }, 
        yellowBright = {
            93, 
            39
        }, 
        blueBright = {
            94, 
            39
        }, 
        magentaBright = {
            95, 
            39
        }, 
        cyanBright = {
            96, 
            39
        }, 
        whiteBright = {
            97, 
            39
        }
    }, 
    bgColor = {
        bgBlack = {
            40, 
            49
        }, 
        bgRed = {
            41, 
            49
        }, 
        bgGreen = {
            42, 
            49
        }, 
        bgYellow = {
            43, 
            49
        }, 
        bgBlue = {
            44, 
            49
        }, 
        bgMagenta = {
            45, 
            49
        }, 
        bgCyan = {
            46, 
            49
        }, 
        bgWhite = {
            47, 
            49
        }, 
        bgBlackBright = {
            100, 
            49
        }, 
        bgGray = {
            100, 
            49
        }, 
        bgGrey = {
            100, 
            49
        }, 
        bgRedBright = {
            101, 
            49
        }, 
        bgGreenBright = {
            102, 
            49
        }, 
        bgYellowBright = {
            103, 
            49
        }, 
        bgBlueBright = {
            104, 
            49
        }, 
        bgMagentaBright = {
            105, 
            49
        }, 
        bgCyanBright = {
            106, 
            49
        }, 
        bgWhiteBright = {
            107, 
            49
        }
    }
};
local v1 = {};
for _, v3 in pairs(v0) do
    for v4, v5 in pairs(v3) do
        v1[v4] = {
            open = string.format("%c[%dm", 27, v5[1]), 
            close = string.format("%c[%dm", 27, v5[2])
        };
    end;
end;
local v6 = nil;
local function v9(v7, v8)
    return v6(v7.open .. v8.open, v8.close .. v7.close);
end;
local function _()
    return (pcall(function()
        game:getService("ProcessService");
    end));
end;
local v11 = {
    level = 2
};
if not (not _G.NOCOLOR and pcall(function()
    game:getService("ProcessService");
end)) then
    v11.level = 0;
end;
setmetatable(v11, {
    __call = function(_, v13)
        if not (v13 ~= nil) or type(v13) == "string" and #v13 == 0 then
            return "";
        else
            return (tostring(v13));
        end;
    end
});
v6 = function(v14, v15)
    local v16 = {
        open = v14, 
        close = v15
    };
    setmetatable(v16, {
        __call = function(v17, v18)
            if not (v18 ~= nil) or type(v18) == "string" and #v18 == 0 then
                return "";
            elseif v11.level == 0 then
                return (tostring(v18));
            else
                return v17.open .. tostring(v18) .. v17.close;
            end;
        end, 
        __concat = function(v19, v20)
            return v9(v19, v20);
        end
    });
    return v16;
end;
local function v21()
    return v6("", "");
end;
local v22 = string.format("%c[%dm", 27, 39);
local v23 = string.format("%c[%dm", 27, 49);
local v24 = string.format("%c[%dm", 27, 0);
for v25, v26 in pairs(v1) do
    v11[v25] = v6(v26.open, v26.close);
end;
v11.reset = v6(v24, v24);
local function v30(v27, v28, v29)
    if v27 == v28 and v28 == v29 then
        if v27 < 8 then
            return 16;
        elseif v27 > 248 then
            return 231;
        else
            return (math.round(((v27 - 8) / 247) * 24 + 232));
        end;
    else
        return ((16 + 36 * math.round((v27 / 255) * 5)) + 6 * math.round((v28 / 255) * 5)) + math.round((v29 / 255) * 5);
    end;
end;
v11.rgb = function(v31, v32, v33)
    if not (((((((type(v31) == "number" and type(v32) == "number") and type(v33) == "number") and v31 <= 255) and v31 >= 0) and v32 <= 255) and v32 >= 0) and v33 <= 255) or v33 < 0 then
        return v21();
    else
        return v6(string.format("%c[%d;5;%dm", 27, 38, (v30(v31, v32, v33))), v22);
    end;
end;
v11.bgRgb = function(v34, v35, v36)
    if not (((((((type(v34) == "number" and type(v35) == "number") and type(v36) == "number") and v34 <= 255) and v34 >= 0) and v35 <= 255) and v35 >= 0) and v36 <= 255) or v36 < 0 then
        return v21();
    else
        return v6(string.format("%c[%d;5;%dm", 27, 48, (v30(v34, v35, v36))), v23);
    end;
end;
local function _(v37)
    return (v30(tonumber(string.sub(v37, 2, 3), 16), tonumber(string.sub(v37, 4, 5), 16), (tonumber(string.sub(v37, 6, 7), 16))));
end;
v11.hex = function(v39)
    if not (type(v39) == "string" and string.find(v39, "#%X") == nil) or #v39 ~= 7 then
        return v21();
    else
        return v6(string.format("%c[%d;5;%dm", 27, 38, (v30(tonumber(string.sub(v39, 2, 3), 16), tonumber(string.sub(v39, 4, 5), 16), (tonumber(string.sub(v39, 6, 7), 16))))), v22);
    end;
end;
v11.bgHex = function(v40)
    if not (type(v40) == "string" and string.find(v40, "#%X") == nil) or #v40 ~= 7 then
        return v21();
    else
        return v6(string.format("%c[%d;5;%dm", 27, 48, (v30(tonumber(string.sub(v40, 2, 3), 16), tonumber(string.sub(v40, 4, 5), 16), (tonumber(string.sub(v40, 6, 7), 16))))), v23);
    end;
end;
v11.ansi = function(v41)
    if not ((type(v41) == "number" and v41 >= 30) and (not (v41 > 37) or v41 >= 90)) or v41 > 97 then
        return v21();
    else
        return v6(string.format("%c[%dm", 27, v41), v22);
    end;
end;
v11.bgAnsi = function(v42)
    if not ((type(v42) == "number" and v42 >= 40) and (not (v42 > 47) or v42 >= 100)) or v42 > 107 then
        return v21();
    else
        return v6(string.format("%c[%dm", 27, v42), v23);
    end;
end;
v11.ansi256 = function(v43)
    if not (type(v43) == "number" and v43 >= 0) or v43 > 255 then
        return v21();
    else
        return v6(string.format("%c[%d;5;%dm", 27, 38, v43), v22);
    end;
end;
v11.bgAnsi256 = function(v44)
    if not (type(v44) == "number" and v44 >= 0) or v44 > 255 then
        return v21();
    else
        return v6(string.format("%c[%d;5;%dm", 27, 48, v44), v23);
    end;
end;
return v11;
