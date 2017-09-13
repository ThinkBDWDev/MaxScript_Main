---------------------------------------------------------------------------------------------------
-- global declarations
---------------------------------------------------------------------------------------------------

rollout ro1 "Options" width:162 height:311
(
	editText edt1 "" pos:[8,8] width:144 height:16 text:"c:\\windows\\temp\\scene.avi"
	button btn1 "Button" pos:[16,32] width:136 height:16
	---------------------------------------------------------------------------------------------------
	-- declarations
	---------------------------------------------------------------------------------------------------



	---------------------------------------------------------------------------------------------------
	-- Interface
	---------------------------------------------------------------------------------------------------



	---------------------------------------------------------------------------------------------------
	-- Functions
	---------------------------------------------------------------------------------------------------
		fn convertToValidFilename str= 
		(
				newStr = ""
				for i=1 to str.count do
				(
					if str[i] == "\\" then newStr += "\\\\"
					else newStr += str[i]
				)
				return newStr
		)



	---------------------------------------------------------------------------------------------------
	-- Handlers
	---------------------------------------------------------------------------------------------------

	on btn1 pressed do format "%\n" (convertToValidFilename edt1.text)

)

if myFloater != undefined then closerolloutfloater myFloater
	myFloater = newRolloutFloater "My Floater" 188 150 
addRollout ro1 myFloater
