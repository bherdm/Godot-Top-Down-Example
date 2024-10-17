class_name Inventory

var _content:Array[ItemStackInstance] = []

func add_item(new_stack: ItemStackInstance):
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
			return
	
	
	#If loop finished with remaining count, create a new stack
	_content.append(new_stack)

func remove_item(item_stack: ItemStackInstance):
	_content.erase(item_stack)

func get_contents() -> Array[ItemStackInstance]:
	return _content
