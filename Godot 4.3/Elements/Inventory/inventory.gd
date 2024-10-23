class_name Inventory

const EMPTY_ITEM = preload("res://Elements/Items/empty_item.tres")
var _content:Array[ItemStackInstance] = []
var slot_count:int

func _init(inv_slot_count:int) -> void:
	slot_count = inv_slot_count
	#Create empty slots
	for i in slot_count:
		var isi = ItemStackInstance.new()
		isi.item = EMPTY_ITEM
		isi.stack_count = 1
		_content.append(isi)

func add_item(new_stack: ItemStackInstance) -> int:
	#Loop through inventory checking for less than full stacks to fill
	for inv_item_stack in get_contents():
		#If new item is already in inventory, check if the stack is less than full
		if inv_item_stack.item.name == new_stack.item.name && inv_item_stack.stack_count < inv_item_stack.item.stack_max:
			#Empty new stack into existing inventory stack
			inv_item_stack.stack_count += new_stack.stack_count
			new_stack.stack_count = 0
			
			
			#Check if the stack is over max
			if inv_item_stack.stack_count > inv_item_stack.item.stack_max:
				#How many over max?
				var remainder = inv_item_stack.stack_count - inv_item_stack.item.stack_max
				
				#Pull remainder from overfilled stack and place back in new stack
				inv_item_stack.stack_count -= remainder
				new_stack.stack_count = remainder
		
		
		#Exit function and loop if stack reaches zero
		if new_stack.stack_count == 0:
			return 0
	
	#Loop through inventory checking for empty slots to fill
	for i in _content.size():
		if _content[i].item.name == EMPTY_ITEM.name:
			_content[i] = new_stack
			return 0
	
	#Inventory is full, return false
	return new_stack.stack_count

func remove_item(item_stack: ItemStackInstance):
	#empty the slot
	_content.erase(item_stack)

func get_contents() -> Array[ItemStackInstance]:
	return _content
