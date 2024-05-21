-----------------
--| Variables |--
-----------------
lighting = game:GetService("Lighting")
tweenService = game:GetService("TweenService")
SSS = game:GetService("ServerScriptService")
-----------------
--| Constants |--
-----------------
dayDuration   = 10 * 60 -- How many real-time minutes an in-game day will last
nightDuration = 6 * 60 -- How many real-time minutes an in-game night will last
LightingFix = false
-----------------
--| Functions |--
-----------------
function tween (l, p)
	tweenService:Create(lighting, TweenInfo.new(l, Enum.EasingStyle.Linear, Enum.EasingDirection.In), p):Play()
end
--------------------
--| Script Logic |--
--------------------
lighting.ClockTime = 6

while type(dayDuration) == "number" and type(nightDuration) == "number" do
	
	tween(dayDuration, {ClockTime = 18})
	task.wait(dayDuration)
	
	-- Change colors only with 'LightingFix' enabled
	if LightingFix then
		tween(4, {OutdoorAmbient = Color3.fromRGB(60, 60, 60), FogColor = Color3.fromRGB(25, 25, 25), FogEnd = 250})
	end
		
	tween(nightDuration / 2, {ClockTime = 24})
	task.wait(nightDuration / 2)
	tween(nightDuration / 2, {ClockTime = 6})
	task.wait(nightDuration / 2)
	
	-- Change colors only with 'LightingFix' enabled
	if LightingFix then
		tween(4, {OutdoorAmbient = Color3.fromRGB(140, 140, 140), FogColor = Color3.fromRGB(195, 195, 195), FogEnd = 750})
	end
end