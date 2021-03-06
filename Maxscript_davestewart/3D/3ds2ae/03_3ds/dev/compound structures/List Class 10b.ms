-- basic list

	struct List(
		fn defaultListProperty=
		(
		)
	)
		
-- struct functions
	function makeList names values=
	(
		-- names
			local str=""
			for i = 1 to names.count do str+=(names[i] as string)+", "
			str=substring str 1 (str.count-2)
			
		-- create temp struct
			global List=undefined
			struct List(
				fn defaultListProperty=
				(
				)
			)
			local id=genClassId returnvalue:true
			id=(abs id[1] ) as string + "_" + (abs id[2]) as string

			execute ("tmpList=struct List_"+id+"("+str+")")
			local s=tmpList()
			
		-- values
			for i = 1 to names.count do setProperty s (names[i] as string) values[i]
	
		-- return
			return s
	)

	fn addItem &theList name value=
	(
		-- check that item exists
			if findItem (getPropNames theList) name >0 then
			(
				setProperty theList name value
				return theList
			)
		
		-- if not, create a new struct
		--initialize
			local names=#()
			local values=#()
			
		-- collect the existing props
			local names=getPropNames theList
			local values=for prop in names collect (getProperty theList prop)
			
		-- delete the "defaultListProperty" if found
			local i=findItem names #defaultListProperty
			if i>0 then
			(
				deleteItem names i
				deleteItem values i
			)

		-- add the new props	
			append names name
			append values value

		-- create a new items struct and replace
			theList= makeList names values
	)

List=undefined
newList=createNewList()

newList=List()
addItem &newList #name "dave"
addItem &newList #height 54
addItem &newList #color blue

addItem &newList #books (List())

classof newList.books

addItem &newList.books #fave "disney"

classof newList

classof newList.books

newList

 findItem (getPropNames newList) #name 
 >0 then setProperty theList name value


	fn addItem theList name value=
	(
		-- initialize
			local names=#()
			local values=#()
			
		-- collect the existing props
			local names=getPropNames theList
			local values=for prop in names collect (getProperty theList prop)

		-- add the new props	
			append names name
			append values value

		-- create a new items struct and replace
			local tmpStruct=makeList names values
			return tmpStruct
	)
newList=List()
addItem newList #name "dave"
newList=addItem newList #height 54

newList

listB=List()
addItem &listB #age 50
addItem &listB #color #blue

listB
newList

addItem newList #subList &listB

newList.subList