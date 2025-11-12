hookfunction((gcinfo or collectgarbage), function(...) return math.random(1, 100) end)
wait(0.01)
local gamemt = getrawmetatable(game)
setreadonly(gamemt, false)
local nc = gamemt.__namecall
gamemt.__namecall = newcclosure(function(...)
    if (getnamecallmethod() == 'GetTotalMemoryUsageMb') then return math.random(1, 100) end
    return nc(...)
end)
hookfunction(game.Stats.GetTotalMemoryUsageMb, function() return math.random(1, 100) end)
wait(0.01)
_G.Settings = {
    Players = { ["Ignore Me"]=true, ["Ignore Others"]=true },
    Meshes = { Destroy=true, LowDetail=true },
    Images = { Invisible=true, LowDetail=true, Destroy=false },
    Other = {
        ["No Particles"]=true,
        ["No Camera Effects"]=false,
        ["No Explosions"]=true,
        ["No Clothes"]=false,
        ["Low Water Graphics"]=true,
        ["No Shadows"]=true,
        ["Low Rendering"]=false,
        ["Low Quality Parts"]=true
    }
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/uuuuuuu/main/low%20detail"))()
