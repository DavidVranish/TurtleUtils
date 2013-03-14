include('modules/SchematicReader.lua')
include('modules/ItemPlace.lua')
include('modules/TurtleMove.lua')

function startRunning(string aFilePath, bool aExcavate)
{
	lContinue = true
	if fs.exists(aFilePath) then
		Schematic.init(aFilePath)
	else
		lContinue = false
		print ("Error: File not found")
	end

	while (lContine == true) do

		lReturnCode = TurtleMove.moveTurtle(aExcavate)
		
		if lReturnCode == 1 then
			lContinue = false
			print ("Schematic completed successfully")
		elseif lReturnCode == -1 then
			lContinue = false
			print ("Error: Area is not clear")
		elseif lReturnCode == -2 then
			lContinue = false
			print ("Error: Out of Materials")
		end
	end
}

lExcavate = false
lFilePath = ''

if arg[1] == '-excavate' then
	lExcavate = true
	lFilePath = arg[2]
else
	lFilePath = arg[1]
end

startRunning(lFilePath, lExcavate)
